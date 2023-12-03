#include <QCoreApplication>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QDebug>
#include <QFile>
#include "database.h"
#include "page.h"


JSDB::JSDB(const QString& filename) : filename_(filename) {
    this->load();
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
        qDebug() << "JSDB: Database saved.";
    } else {
        qWarning() << "JSDB: Saving to database failed.";
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

}

//load data to the page object
void JSDB::loadPageData(Page* page) {
    if (!page) {
        qWarning() << "JSDB: Page pointer is null.";
        return;
    }
    // Example of loading data into the Page object
    // This assumes that Page class has methods or properties to set data
    for (const QString& key : database_.keys()) {
        QVariant value = database_.value(key);

        // Here you should call a method of the Page class or set its properties
        // For example, if Page has a method `setData(QString key, QVariant value)`

        page->setData(key, value); //Set data is a method to be defined in the Page class. Key would be the type of value, value would be the actual data. ex DueDay, 12th
    }

    qDebug() << "JSDB: Data loaded into Page object.";
}
*/
//load data to the page object

