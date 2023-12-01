#ifndef JSONDATABASE_H
#define JSONDATABASE_H

#include <QString>
#include <QVariant>
#include <QHash>

class JsonDatabase {
public:
    JsonDatabase(const QString& filename);

    void addEntry(const QString& key, const QVariant& value);
    QVariant getEntry(const QString& key) const;
    void saveDatabase() const;

private:
    void loadDatabase();

    QString filename_;
    QHash<QString, QVariant> database_;
};

#endif // JSONDATABASE_H
