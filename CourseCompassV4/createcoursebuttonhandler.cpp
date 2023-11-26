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
    // qDebug() << "Button clicked! Add your functionality here.";
    QQmlEngine* engine = qmlEngine(this);
    if (!engine) {
        qWarning() << "No QQmlEngine found.";
        return;
    }

    QQmlComponent component(engine, QUrl("qrc:/CourseComponent.qml"));
    if (component.isError()) {
        qWarning() << component.errorString();
        return;
    }

    // Access column 1 component using the context
    QObject* column1 = engine->rootContext()->contextObject()->property("column1").value<QObject*>();


    // Create three instances of the custom QML component
    QObject* instance = component.create(); // This creates a new instance
    if (instance) {
        QQmlEngine::setObjectOwnership(instance, QQmlEngine::CppOwnership); // Makes it so C++ code has ownership of the instance of the component
        instance->setParent(column1);
    }
}
