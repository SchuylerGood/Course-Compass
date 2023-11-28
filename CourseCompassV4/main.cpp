#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "page.h"

int main(int argc, char *argv[])
{

    #if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
        QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    #endif

    QGuiApplication app(argc, argv);

    // This is where we define our QML type from page.cpp
    qmlRegisterType<Page>("MyPage", 1, 0, "Page");

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

    engine.load(url); // This loads the main qml file into the engine

    return app.exec();
}

