#ifndef DATABASEMANAGER_H
#define DATABASEMANAGER_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>
#include <QStandardItemModel>

class DatabaseManager : public QObject
{
    Q_OBJECT

public:
    explicit DatabaseManager(QObject *parent = nullptr);
    ~DatabaseManager();

    Q_INVOKABLE bool connectToDatabase();
    Q_INVOKABLE QVariantList getSales(const QString &startDate, const QString &endDate);

private:
    QSqlDatabase db;

};

#endif // DATABASEMANAGER_H
