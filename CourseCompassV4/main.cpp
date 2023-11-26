#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "createcoursebuttonhandler.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml")); // This gets the GUI info from the QML file
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);

    // This is where we add our button handler conections
    qmlRegisterType<CreateCourseButtonHandler>("Custom", 1, 0, "CreateCourseButtonHandler");

    engine.load(url); // This loads the main qml file into the engine

    return app.exec();
}

