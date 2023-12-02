#ifndef JSDB_H_
#define JSDB_H_

#include <QString>
#include <QVariant>
#include <QHash>

class JSDB {
public:
    JSDB(const QString& filename);

    void addEntry(const QString& key, const QVariant& value);
    void addCourse(void* ptr);
    QVariant getEntry(const QString& key) const;
    void save() const;

private:
    void load();

    QString filename_;
    QHash<QString, QVariant> database_;
};

#endif // JSDB_H_