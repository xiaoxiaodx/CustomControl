#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtWidgets/QApplication>
#include <QQuickView>

#include <QtQuickWidgets/QQuickWidget>

#include "dashboard/dashbord0.h"
#include "dashboard/dashbord1.h"
#include "dashboard/dashbord2.h"
#include "dashboard/dashbord3.h"
#include "dashboard/dashbord4.h"
#include "dashboard/dashbord5.h"
#include "progressbar/progressbar0.h"
int main(int argc, char *argv[])
{
   // QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);
//QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    qmlRegisterType<Dashbord0>("Dashbord0", 1, 0, "Dashbord0");
    qmlRegisterType<Dashbord1>("Dashbord1", 1, 0, "Dashbord1");
    qmlRegisterType<Dashbord2>("Dashbord2", 1, 0, "Dashbord2");
    qmlRegisterType<Dashbord3>("Dashbord3", 1, 0, "Dashbord3");
    qmlRegisterType<Dashbord4>("Dashbord4", 1, 0, "Dashbord4");
    qmlRegisterType<Dashbord5>("Dashbord5", 1, 0, "Dashbord5");
    qmlRegisterType<Progressbar0>("Progressbar0", 1, 0, "Progressbar0");
   engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;



    return app.exec();
}
