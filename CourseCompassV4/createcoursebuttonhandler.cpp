#include "createcoursebuttonhandler.h"
#include <QDebug>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QQmlContext>

CreateCourseButtonHandler::CreateCourseButtonHandler(QObject *parent) : QObject(parent){
    // This is the constructor
}

void CreateCourseButtonHandler::handleButtonClick()
{
    qDebug() << "Button clicked";
}
