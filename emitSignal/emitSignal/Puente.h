#ifndef PUENTE_H
#define PUENTE_H

#include <QObject>

// Clase puente que envia/recibe señales desde QT
class Puente : public QObject
{
    Q_OBJECT
public:
    explicit Puente(QObject *parent = 0);

signals:

    // señal esperada en QTML (seccion Connections { on<NombreSenal: ... } p.ej: onSenalConectaC (en QT) para el caso de senalConectaC (en C)
    void senalConectaC(QString txt);
    void senalTextoDeC(QString txt);

public slots:
    void conecta();
    void leerTexto1(); // Señal que se emitirá al pulsar el botón Leer1
    void leerTexto2(); // Señal que se emitirá al pulsar el botón Leer1
};

#endif // PUENTE_H
