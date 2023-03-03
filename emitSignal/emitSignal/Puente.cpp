#include "Puente.h"
#include <QDebug>

Puente::Puente(QObject *parent) : QObject(parent)
{
    // Señales recibidas desde QML
    //connect(PuenteQT, &PuenteQT::leerTxt1, this, &Puente::leerTxt1);
    //connect(PuenteQT, &PuenteQT::leerTxt2, this, &Puente::leerTxt2);
}

void Puente::conecta () {
    emit senalConectaC("Hola Mundo");
}

void Puente::leerTexto1() {
    // Se recibe la signal y se emite esta para responder a la de QML
    emit senalTextoDeC("Hola Mundo 1");
    qDebug() << "pulsado 1";

    /* Ejemplo de como acceder a una propiedad de un objeto llamado "rect"

        QObject *rect = object->findChild<QObject*>("rect");
        if (rect)
            rect->setProperty("color", "red");

     */
}

void Puente::leerTexto2() {
    // Se recibe la signal y se emite esta para responder a la de QML
    emit senalTextoDeC("Hola Mundo 2");
    qDebug() << "pulsado 2";
}
