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

QVariant JSDB::getEntry(const QString& key) const {
    return database_.value(key);
}

QStringList JSDB::prefixLookup(const QString& prefix) const {
    QStringList keys;
    for (auto item = database_.constBegin(); item != database_.constEnd(); ++item) {
        if (item.key().startsWith(prefix))
            keys.append(item.key());
    }
    return keys;
}


void JSDB::save_() const {
    QFile file(filename_);
    if (file.open(QIODevice::WriteOnly)) {
        QJsonObject JSDB;
        for (auto it = database_.constBegin(); it != database_.constEnd(); ++it) {
            JSDB[it.key()] = QJsonValue::fromVariant(it.value());
        }
        QJsonDocument jdbuf(JSDB);
        file.write(jdbuf.toJson());
        file.close();
        qDebug() << "Database saved successfully.";
    } else {
        qWarning() << "Unable to open the file for writing.";
    }
}

// save database_ to json db
void JSDB::save() const {
    QFile file(filename_);
    if (file.open(QIODevice::WriteOnly)) {
        QJsonObject JSDB;
        for (auto it = database_.constBegin(); it != database_.constEnd(); ++it) {
            JSDB[it.key()] = QJsonValue::fromVariant(it.value());
        }
        QJsonDocument jdbuf(JSDB);
        file.write(jdbuf.toJson());
        file.close();
        qDebug() << "JSDB: Database saved.";
    } else {
        qWarning() << "JSDB: Saving to database failed.";
    }
}

// load from json db
void JSDB::load() {
    QFile file(filename_);
    if (!file.open(QIODevice::ReadOnly))
        qWarning() << "JSDB: Unable read file. New file created.";

    QByteArray jsonByteArr = file.readAll();
    QJsonDocument dbFile = QJsonDocument::fromJson(jsonByteArr);
    if (!dbFile.isObject())
        qWarning() << "JSDB: Invalid JSON format.";
    QJsonObject JSDB = dbFile.object();
    QStringList keys = JSDB.keys();

    for (const QString& key : keys) {
        database_[key] = JSDB.value(key).toVariant();
    }
    qDebug() << "JSDB: Database loaded successfully.";

    file.close();
}

void JSDB::load_() {
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

/*
// load data to the navbar class
void JSDB::load(navbar* target) {


