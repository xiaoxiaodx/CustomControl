#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "dashboard/dashbord0.h"
#include "dashboard/dashbord1.h"
#include "dashboard/dashbord2.h"
#include "dashboard/dashbord3.h"
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    qmlRegisterType<Dashbord0>("Dashbord0", 1, 0, "Dashbord0");
    qmlRegisterType<Dashbord1>("Dashbord1", 1, 0, "Dashbord1");
    qmlRegisterType<Dashbord2>("Dashbord2", 1, 0, "Dashbord2");
    qmlRegisterType<Dashbord3>("Dashbord3", 1, 0, "Dashbord3");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}