#include <QCoreApplication>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QFile>
#include <QDebug>
#include "database.h"


JsonDatabase::JsonDatabase(const QString& filename) : filename_(filename) {
    loadDatabase();
}

void JsonDatabase::addEntry(const QString& key, const QVariant& value) {
    database_[key] = value;
}

QVariant JsonDatabase::getEntry(const QString& key) const {
    return database_.value(key);
}

void JsonDatabase::saveDatabase() const {
    QFile file(filename_);
    if (file.open(QIODevice::WriteOnly)) {
        QJsonObject jsonDatabase;
        for (auto it = database_.constBegin(); it != database_.constEnd(); ++it) {
            jsonDatabase[it.key()] = QJsonValue::fromVariant(it.value());
        }

        QJsonDocument jsonDoc(jsonDatabase);
        file.write(jsonDoc.toJson());
        file.close();
        qDebug() << "Database saved successfully.";
    } else {
        qWarning() << "Unable to open the file for writing.";
    }
}

void JsonDatabase::loadDatabase() {
    QFile file(filename_);
    if (file.open(QIODevice::ReadOnly)) {
        QByteArray data = file.readAll();
        QJsonDocument jsonDoc = QJsonDocument::fromJson(data);
        if (jsonDoc.isObject()) {
            QJsonObject jsonDatabase = jsonDoc.object();
            QStringList keys = jsonDatabase.keys();
            for (const QString& key : keys) {
                database_[key] = jsonDatabase.value(key).toVariant();
            }
            qDebug() << "Database loaded successfully.";
        } else {
            qWarning() << "Invalid JSON format in the file.";
        }
        file.close();
    } else {
        qWarning() << "Unable to open the file for reading. A new database will be created.";
    }
}


