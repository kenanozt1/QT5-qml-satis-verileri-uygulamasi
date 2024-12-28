#include "databasemanager.h"
#include "QFile"
#include <QDir>
#include <QCoreApplication>
#include <QVariantList>
DatabaseManager::DatabaseManager(QObject *parent) : QObject(parent) {
    db.close();
    QSqlDatabase::removeDatabase("qt_sql_default_connection");
    db = QSqlDatabase::addDatabase("QSQLITE");
}

DatabaseManager::~DatabaseManager() {
    if (db.isOpen()) {
        db.close();
    }
}

bool DatabaseManager::connectToDatabase() {
    QString executablePath = QCoreApplication::applicationDirPath();
    QDir projectDir = QDir(executablePath);
    projectDir.cdUp();
    projectDir.cdUp();
    projectDir.cdUp();

    QString dbPath = projectDir.absolutePath() + QDir::separator() + "/database.db";
    if (db.isOpen()) {
        return true;
    }
    db.setDatabaseName(dbPath);
    QFile file(dbPath);

    if (!file.exists()) {
        qDebug() << "Veritabanı dosyası bulunamadı:" << dbPath;
        return false;
    }

    if (!db.open()) {
        qDebug() << "Veritabanı bağlantısı başarısız:" << db.lastError().text();
        return false;
    }

    qDebug() << "Veritabanı başarıyla bağlandı!";
    return true;
}

QVariantList DatabaseManager::getSales(const QString &startDate, const QString &endDate)
{
    QVariantList result;

    if (!db.isOpen() && !connectToDatabase()) {
        qDebug() << "Veritabanı bağlantısı kapalı.";
        return result;
    }

    QString queryStr = QString("SELECT * FROM sales WHERE created_at BETWEEN '%1' AND '%2'")
                           .arg(startDate)
                           .arg(endDate);

    QSqlQuery query;
    if (query.exec(queryStr)) {
        while (query.next()) {
            QVariantMap row;
            row["id"] = query.value("id");
            row["urun"] = query.value("product_name");
            row["miktar"] = query.value("quantity");
            row["fiyat"] = query.value("price");
            row["kod"] = query.value("product_code");
            row["tarih"] = query.value("created_at");
            result.append(row);
        }
    } else {
        qDebug() << "Sorgu başarısız:" << query.lastError().text();
    }

    return result;
}


