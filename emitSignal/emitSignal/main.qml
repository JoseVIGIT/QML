import QtQuick 2.3
import QtQuick.Window 2.2

//Rectangle { //SI SE USA LA FORMA1 descomentar este elemento
Window { //SI SE USA FORMA 2, 3 descomentar este elemento

    width: 150
    height: 150
    visible: true
    objectName: "raiz"

    // Señales que se envian
    //signal leerTxt1() // Señal que se emitirá al pulsar el botón Leer1
    //signal leerTxt2() // Señal que se emitirá al pulsar el botón Leer1

    // Señales que se reciben
    Connections  {
        target: PuenteQT // PuenteQT es el texto al que se vinculará el objeto en C con setContextProperty("PuenteQT", obj);
        onSenalConectaC: {
            console.log("Señal recibida:", txt) // txt : mismo nombre que el parametro de la función que define este signal en C (senalConectaC(QString txt))
            texto.text = txt
        }
        onSenalTextoDeC: {
            texto.text = txt
        }
    }

    Text {
        id: btn1
        text: "Cerrar"
        width: parent.width/3
        anchors {
            left: parent.left
            bottom: parent.bottom
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                Qt.quit(); // Depende del método empleado habrá que crear o no asociación entre señal quit y acción a realizar
            }
        }
    }

    Text {
        id: btn2
        objectName: "botonLeer1"
        signal leerTxt1() // Señal que se emitirá al pulsar el botón Leer1

        text: "Leer1"
        width: parent.width/3
        anchors {
            left: btn1.right
            bottom: parent.bottom
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log ("Pulsado");
                btn2.leerTxt1(); // manda la señal leerTxt1
            }
        }
    }

    Text {
        id: btn3
        objectName: "botonLeer2"
        signal leerTxt2() // Señal que se emitirá al pulsar el botón Leer2

        text: "Leer2"
        width: parent.width/3
        anchors {
            left: btn2.right
            bottom: parent.bottom
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                //signal senalConectadoQT()
                btn3.leerTxt2(); // manda la señal leerTxt1
            }
        }
    }

    Text {
        id: texto
        objectName: "textoDinamico"
        text: "Texto..."
        anchors.centerIn: parent
    }



}

