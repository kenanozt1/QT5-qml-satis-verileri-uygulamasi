SQL Veri Görüntüleme Projesi
Bu proje, belirlenen tarih aralığındaki satış verilerini SQLite veritabanından çekerek kullanıcı dostu bir arayüzde görüntüleyen bir Qt/QML uygulamasıdır.
🚀 Özellikler

Tarih Aralığı Seçimi: Kullanıcı dostu takvim arayüzü ile başlangıç ve bitiş tarihi seçimi
Veritabanı Entegrasyonu: SQLite veritabanı ile entegre çalışma
Dinamik Veri Görüntüleme: Seçilen tarih aralığındaki verileri tablo formatında gösterme
Modern Arayüz: Özelleştirilmiş butonlar ve kullanıcı dostu tasarım
Gerçek Zamanlı Güncelleme: Seçilen tarih aralığına göre anlık veri güncelleme

📋 Gereksinimler

Qt 5.15 veya üzeri
SQLite
C++ Compiler (MSVC, GCC, veya Clang)
Qt Creator IDE (önerilen)

💻 Kurulum

Projeyi klonlayın:

bashCopygit clone https://github.com/kenanozt1/QT5-qml-satis-verileri-uygulamasi.git

Proje dizinine gidin:

bashCopycd QT5-qml-satis-verileri-uygulamasi

Qt Creator'da projeyi açın:

Qt Creator'ı başlatın
File -> Open File or Project
Proje dizinindeki .pro dosyasını seçin


Projeyi derleyin ve çalıştırın

📊 Veritabanı Yapısı
Sales tablosu aşağıdaki alanları içerir:
id (PRIMARY KEY)
product_name (VARCHAR)
quantity (INTEGER)
price (DECIMAL)
product_code (VARCHAR)
created_at (DATETIME)

🎯 Kullanım

Başlangıç tarihi seçmek için "Başlangıç Tarihi Seç" butonuna tıklayın
Bitiş tarihi seçmek için "Bitiş Tarihi Seç" butonuna tıklayın
"Verileri Getir" butonuna tıklayarak seçilen tarih aralığındaki verileri görüntüleyin
Tablo üzerinde verileri inceleyebilirsiniz

🔧 Teknik Detaylar

Frontend: Qt Quick (QML)
Backend: C++
Veritabanı: SQLite
Veri Modeli: QSqlQueryModel
UI Komponentleri: Qt Quick Controls 2

👨‍💻 Geliştirici
Kenan Öztürk

📄 Lisans
Bu proje MIT lisansı altında lisanslanmıştır.

✨ Ekran Görüntüleri
![Screenshot_3](https://github.com/user-attachments/assets/896b273f-0a11-4433-a123-131de8e20e9f)
![Screenshot_2](https://github.com/user-attachments/assets/dbb339e9-3eea-450b-bacc-7b2ca405f1c7)
![Screenshot_1](https://github.com/user-attachments/assets/a065624e-e2ed-4a67-bb06-753108ef7174)

📝 Not
Bu proje, Qt ve QML teknolojilerini kullanarak modern bir veri görüntüleme uygulaması geliştirme yeteneklerini göstermek amacıyla oluşturulmuştur.