import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.3
import com.database 1.0

ApplicationWindow {
    visible: true
    width: 1024
    height: 600

    minimumWidth: 1024
    minimumHeight: 600

    maximumWidth: 1024
    maximumHeight: 600
    title: "Satış Verileri | KENAN ÖZTÜRK"

    property string baslangicTarihi: ""
    property string bitisTarihi: ""
    property string minBaslangicTarihi: ""

    DatabaseManager {
        id: dbManager
    }

    Column {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        Row {
            spacing: 20
            Button {
                text: "Başlangıç Tarihi Seç"
                width: 120
                height: 50
                onClicked: {
                    calendarDialog.title = "Başlangıç Tarihi Seçiniz"
                    calendarDialog.open()
                }
            }
            Button {
                text: "Bitiş Tarihi Seç"
                width: 120
                height: 50
                onClicked: {
                    calendarDialog.title = "Bitiş Tarihi Seçiniz"
                    calendarDialog.open()
                }
            }
            Button {
                text: "Verileri Getir"
                width: 120
                height: 50
                onClicked: {
                    if (baslangicTarihi && bitisTarihi) {
                        if(baslangicTarihi > bitisTarihi){
                            tarihKontrolDialog.open()
                        }else{
                            var data = dbManager.getSales(baslangicTarihi, bitisTarihi);
                            tableModel.clear();
                            for (var i = 0; i < data.length; i++) {
                                tableModel.append(data[i]);
                            }
                        }
                    }else{
                        tarihSecDialog.open()
                        console.log("Tarih seçiniz")
                    }
                }
            }
        }
        MessageDialog {
            id: tarihSecDialog
            title: "Tarih seçimi yapmadınız!"
            text: "Lütfen devam etmek için tarih aralığı seçin."
            visible:false
            onAccepted: {
                tarihSecDialog.close()
            }
        }
        MessageDialog {
            id: tarihKontrolDialog
            title: "Tarih Seçiminde Hata"
            text: "Lütfen devam etmek için tarih aralığını uygun seçin"
            visible:false
            onAccepted: {
                tarihKontrolDialog.close()
            }
        }
        Row {
            spacing: 20
            TextField {
                id: startDateField
                placeholderText: "Başlangıç Tarihi"
                text: baslangicTarihi
                readOnly: true
                width: 120
                MouseArea{
                    anchors.fill:parent
                    onClicked: {
                        calendarDialog.title = "Başlangıç Tarihi Seçiniz"
                        calendarDialog.open()
                    }
                }
            }
            TextField {
                id: endDateField
                placeholderText: "Bitiş Tarihi"
                text: bitisTarihi
                readOnly: true
                width: 120
                MouseArea{
                    anchors.fill:parent
                    onClicked: {
                        calendarDialog.title = "Bitiş Tarihi Seçiniz"
                        calendarDialog.open()
                    }
                }
            }
        }

        TableView {
            width: parent.width
            height: 400
            model: ListModel {
                id: tableModel
            }

            TableViewColumn {
                role: "id"
                title: "ID"
                width: 50
            }
            TableViewColumn {
                role: "urun"
                title: "Ürün Adı"
                width: 200
            }
            TableViewColumn {
                role: "miktar"
                title: "Miktar"
                width: 80
            }
            TableViewColumn {
                role: "fiyat"
                title: "Fiyat"
                width: 100
            }
            TableViewColumn {
                role: "kod"
                title: "Kod"
                width: 100
            }
            TableViewColumn {
                role: "tarih"
                title: "Tarih"
                width: 150
            }
        }

        Dialog {
            id: calendarDialog
            title: "Tarih Seçiniz"
            standardButtons: Dialog.Ok | Dialog.Cancel
            onAccepted: {
                if (calendar.selectedDate) {
                    var selectedDate = calendar.selectedDate;
                    var formattedDate = selectedDate.getFullYear() + "-" +
                                      (selectedDate.getMonth() + 1).toString().padStart(2, '0') + "-" +
                                      selectedDate.getDate().toString().padStart(2, '0');
                    if (calendarDialog.title === "Başlangıç Tarihi Seçiniz") {
                        baslangicTarihi = formattedDate;
                        startDateField.text = baslangicTarihi;
                        minBaslangicTarihi = selectedDate.getFullYear() + "-" +
                                (selectedDate.getMonth() + 1).toString().padStart(2, '0') + "-" +
                                (selectedDate.getDate()+1).toString().padStart(2, '0');
                    } else {
                        bitisTarihi = formattedDate;
                        endDateField.text = bitisTarihi;
                        console.log(calendar.minimumDate,"bitiş")
                    }
                }
            }
            onVisibleChanged: {
                    if (visible) {
                        if (calendarDialog.title === "Başlangıç Tarihi Seçiniz") {
                            calendar.selectedDate = undefined;
                            calendar.minimumDate = new Date(2000, 0, 1);
                        } else {
                            calendar.minimumDate = new Date(minBaslangicTarihi);
                        }
                    }
                }
            Calendar {
                id: calendar
                minimumDate: minBaslangicTarihi
            }
        }
    }
}
