#include <QCoreApplication>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QFile>
#include <QDebug>
#include "database.h"


JSDB::JSDB(const QString& filename) : filename_(filename) {
    load();
}

void JSDB::addEntry(const QString& key, const QVariant& value) {
    database_[key] = value;
}

void JSDB::addCourse(/*Course*/void * ptr) {

}

QVariant JSDB::getEntry(const QString& key) const {
    return database_.value(key);
}

void JSDB::save() const {
    QFile file(filename_);
    if (file.open(QIODevice::WriteOnly)) {
        QJsonObject JSDB;
        for (auto it = database_.constBegin(); it != database_.constEnd(); ++it) {
            JSDB[it.key()] = QJsonValue::fromVariant(it.value());
        }

        QJsonDocument jsonDoc(JSDB);
        file.write(jsonDoc.toJson());
        file.close();
        qDebug() << "Database saved successfully.";
    } else {
        qWarning() << "Unable to open the file for writing.";
    }
}

void JSDB::load() {
    QFile file(filename_);
    if (file.open(QIODevice::ReadOnly)) {
        QByteArray data = file.readAll();
        QJsonDocument jsFile = QJsonDocument::fromJson(data);
        if (jsFile.isObject()) {
            QJsonObject JSDB = jsFile.object();
            QStringList keys = JSDB.keys();
            for (const QString& key : keys) { // nest this loop to read for array?
                database_[key] = JSDB.value(key).toVariant();
            }
            qDebug() << "JSDB: Database loaded successfully.";
        } else {
            qWarning() << "JSDB: Invalid JSON format in the file.";
        }
        file.close();
    } else {
        qWarning() << "JSDB: Unable to open the file for reading. A new database will be created.";
    }
}


