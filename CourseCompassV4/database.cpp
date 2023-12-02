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
        qDebug() << "JSDB: Database saved.";
    } else {
        qWarning() << "JSDB: Saving to database failed.";
    }
}

// load data to the current object
void JSDB::load() {
    QFile file(filename_);
    if (file.open(QIODevice::ReadOnly)) {
        QByteArray data = file.readAll();
        QJsonDocument dbFile = QJsonDocument::fromJson(data);
        if (dbFile.isObject()) {
            QJsonObject JSDB = dbFile.object();
            QStringList keys = JSDB.keys();
            for (const QString& key : keys) { // nest this loop to read for array?
                database_[key] = JSDB.value(key).toVariant();
            }
            qDebug() << "JSDB: Database loaded successfully.";
        } else {
            qWarning() << "JSDB: Invalid JSON format.";
        }
        file.close();
    } else {
        qWarning() << "JSDB: Unable read file. New file created.";
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
