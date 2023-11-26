#ifndef CREATECOURSEBUTTONHANDLER_H
#define CREATECOURSEBUTTONHANDLER_H

#include <QObject>

class CreateCourseButtonHandler : public QObject
{
    Q_OBJECT

public:
    CreateCourseButtonHandler(QObject *parent = nullptr);
public slots:
    void handleButtonClick();
};

#endif // CREATECOURSEBUTTONHANDLER_H
