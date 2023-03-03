#include <QGuiApplication>
#include <QQmlApplicationEngine>

//#include "../../shared/shared.h"
//DECLARATIVE_EXAMPLE_MAIN(tweetsearch)

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/tweetsearch.qml")));

    return app.exec();
}
