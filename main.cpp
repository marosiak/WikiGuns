#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <randomquotes.h>
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    RandomQuotes rndq;
    engine.rootContext()->setContextProperty("RandomQuotes", &rndq);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));


    return app.exec();
}
