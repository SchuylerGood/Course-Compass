#ifndef PAGE_H
#define PAGE_H

#include <QObject>
#include <QStringList>

class Page : public QObject
{
    Q_OBJECT

public:
    explicit Page(QObject *parent = nullptr);

    Q_INVOKABLE QStringList getStringList();
};

#endif // PAGE_H
