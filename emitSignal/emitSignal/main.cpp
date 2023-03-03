/* Dado un QML con un texto con una cadena predefinida
 * se carga un nuevo texto en el componente de texto del QML
 * Si se pulsa en el QML se cierra la aplicación
 * Sobre esto último, seǵun el método empleado, se debe crear el enlace entre señal quit y acción quit
 */

#include <QGuiApplication>
#include "Puente.h"

// includes para FORMA 1
//#include <QQuickView>
//#include <QQmlContext>

// includes para FORMA 2
#include <QQmlEngine>
#include <QQmlComponent>
#include <QQmlContext>

// includes para FORMA 3
//#include <QQmlApplicationEngine>
//#include <QQmlContext>


int main(int argc, char *argv[])
{

    QGuiApplication app(argc, argv);

    // Obj para tener en cuenta señal --> slot
    Puente *puente;
    puente = new Puente ();


//  FORMA 1:
/*
    // Inicializar aplicación
    QQuickView view;

    // Enlace (expone) el objeto con la propiedad target que esta definida a PuenteQT (ver main.qml)
    // Con esto se está diciendo que PuenteQT (target en qml) se está refiriendo al objeto puente
    view.rootContext()->setContextProperty("PuenteQT", puente);

    // Usando un QQmlEngine no funciona Qt.quit() en QML. Para que funcione se vincula la señal quit al quit de la QGUIAPPLICATION
    QQmlEngine *engine = view.engine();
    QObject::connect((QObject*)engine, SIGNAL(quit()), &app, SLOT(quit()));

    // Asociar plantilla a usar (a la que se le ha añadido  (expuesto) la variable previa
    view.setSource(QUrl("qrc:/main.qml"));
    view.show();
*/


// FORMA 2:

    // Inicializar aplicación
    QQmlEngine engine;

    // Enlace (expone) el objeto con la propiedad target que esta definida a PuenteQT (ver main.qml)
    // Con esto se está diciendo que PuenteQT (target en qml) se está refiriendo al objeto puente
    engine.rootContext()->setContextProperty("PuenteQT", puente);

    // Se genera el elemento raiz. Plantilla a utilizar
    QQmlComponent root(&engine);
    root.loadUrl(QUrl(QStringLiteral("qrc:/main.qml")));
    QObject *obj = root.create(engine.rootContext());

    // Señales recibidas desde QML
    // quit() ---> Usando un QQmlEngine no funciona Qt.quit() en QML. Para que funcione se vincula la señal quit al quit de la QGUIAPPLICATION
    QObject::connect((QObject*)&engine, SIGNAL(quit()), &app, SLOT(quit()));
    // leerTxt1()
    QObject *btnLeer1 = obj->findChild<QObject*>("botonLeer1");
    QObject::connect(btnLeer1, SIGNAL(leerTxt1()), puente, SLOT(leerTexto1()));
    // leerTxt2()
    QObject *btnLeer2 = obj->findChild<QObject*>("botonLeer2");
    QObject::connect(btnLeer2, SIGNAL(leerTxt2()), puente, SLOT(leerTexto2()));



// FORMA 3:
/*
    // Inicializar aplicación
    QQmlApplicationEngine appEngine;

    // Enlace (expone) el objeto con la propiedad target que esta definida a PuenteQT (ver main.qml)
    // Con esto se está diciendo que PuenteQT (target en qml) se está refiriendo al objeto puente
    appEngine.rootContext()->setContextProperty("PuenteQT", puente);

    // Asociar plantilla a usar (a la que se le ha añadido  (expuesto) la variable previa
    appEngine.load(QUrl(QStringLiteral("qrc:/main.qml")));
*/


// ----------

    //Lanzar señal
    puente->conecta();

    // Lanzar la aplicación
    return app.exec();
}
