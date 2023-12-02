#ifndef PAGE_H
#define PAGE_H

#include <QObject>
#include <QStringList>

class Page : public QObject
{
    Q_OBJECT

public:
    explicit Page(QObject *parent = nullptr);

    void addNewPage();
};

#endif // PAGE_H
