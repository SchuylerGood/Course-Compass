#ifndef CREATECOURSEBUTTONHANDLER_H
#define CREATECOURSEBUTTONHANDLER_H

#include <QObject>

class CreateCourseButtonHandler : public QObject {
    Q_OBJECT

public:
    explicit CreateCourseButtonHandler(QObject *parent = nullptr);

public slots:
    void handleButtonClick(); // Declaration of the slot to handle button clicks
};

#endif // CREATECOURSEBUTTONHANDLER_H
