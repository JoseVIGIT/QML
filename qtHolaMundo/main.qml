import QtQuick 2.3
import QtQuick.Window 2.2

Window {
    visible: true


    Image {
        id: root
        source: "imagenes/background.png"

        width: parent.width
        height: parent.height

        /*
        Image {
            id: pole
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            source: "imagenes/pole.png"
        }
        */

        Image {
            id: wheel
            anchors.centerIn: parent
            //source: "imagenes/pinwheel.png"
            source: txtImagenNueva.text

            width: parent.width/2
            height: parent.height/2

            MouseArea {
                anchors.fill: parent
                onClicked: wheel.rotation += 90
            }
            Behavior on rotation {
                NumberAnimation {
                    duration: 250
                }
            }
        }
    }

    Rectangle {
        id: btnSalir
        width: parent.width * 0.9
        height:  parent.width * 0.2
        anchors.horizontalCenter: parent.width
        anchors.bottom: parent.bottom
        border.color: "#FFFFFF"
        border.width: 5
        radius: 8
/*
        Text {
            id: lblImagenNueva
            text: "Salir"
            anchors.left: parent.left
            width: parent.width / 0.5

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    Qt.quit ();
                }
            }
        }
*/

        TextInput {
            id: txtImagenNueva
            text: "imagenes/pinwheel.png"
            anchors.fill: parent
        }
/*
        MouseArea {
            anchors.fill: parent
            onClicked: {
                Qt.quit ();
            }
        }
*/
    }
}
