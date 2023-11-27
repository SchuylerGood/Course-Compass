#include "page.h"

Page::Page(QObject *parent) : QObject(parent)
{
    // Constructor logic
}

QStringList Page::getStringList()
{
    QStringList list;
    // Add strings to the list
    list << "String 1" << "String 2" << "String 3";
    return list;
}
