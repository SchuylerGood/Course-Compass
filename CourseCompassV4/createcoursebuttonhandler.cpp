#include "createcoursebuttonhandler.h"
#include <QDebug>

CreateCourseButtonHandler::CreateCourseButtonHandler(QObject *parent) : QObject(parent){

}

void CreateCourseButtonHandler::handleButtonClick()
{
    qDebug() << "Button clicked! Add your functionality here.";
    // Add your custom C++ functionality here
}
