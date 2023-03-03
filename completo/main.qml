import QtQuick 2.3
import QtQuick.Window 2.2

import "util.js" as Util // import a pure JS module

Window {
    visible: true
    width: 700
    height: 400


    Component.onCompleted: {
        var noticiaJSON = JSON.parse(Util.generaNoticiaDemo ())
        var noticia = noticiaJSON.Noticia
        var titular = noticiaJSON.Titular
        txtNoticiaTitular.text = titular
        txtNoticiaNoticia.text = noticia
    }

    property int pisoActual: 1

    Image {
        id: fondo
        source: "imagenes/fondo_edificio.jpg"
        //y: -768
        Behavior on y {
            NumberAnimation {
                duration: 250
            }
        }
    }


    // Slider imagenes
    SliderLateral {
        id: zonaSlider
        anchors.right: parent.right
        width: 232
        height: 445
        z: 100

        slModel: SlideModelImagenes {}
        slDelegate: DelegateImagenes {}
        slTiempo: 1000
    }

    Rectangle {
        height: zonaSlider.height
        width: 4
        anchors.left: zonaSlider.left
        border.color: "#88AA88"
        border.width: 4
    }
    // Fin Slider imagenes


    // Slider noticias
    SliderLateral {
        id: zonaSlider2
        x: botonera.x
        y: botonera.y + botonera.height + 10
        width: 250
        height: 50
        opacity: .5

        slModel: SlideModelNews {}
        slDelegate: DelegateNews {}
        slTiempo: 3000


    }
    // Fin Slider noticias


    Grid {
        x: 245
        y: 25

        rows: 3
        columns: 3
        spacing: 4
        Repeater {
            model: 9
            Rectangle {
                width: 60
                height: 60
                border.color: "#88AA88"
                border.width: 4
                color: "#AAAAAA"
                radius: 10
                gradient: Gradient {
                            GradientStop { position: 0.0; color: "lightsteelblue" }
                            GradientStop { position: 1.0; color: "slategray" }
                }
                Text {
                    anchors.centerIn: parent
                    text: index
                    font.pixelSize: 30
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log ("Ir al piso", index)
                    }
                }
            }
        }


    }

    Text {
        id: txtPisoActual
        x: fondoNumeroPiso.x + 7
        y: 85
        text: pisoActual
        font.pixelSize: 50
        font.bold: true
        color: "#005500"
        z: 3
    }

    Image {
        id: fondoNumeroPiso
        source: "imagenes/fondo_pisoNumero.png"
        x: botonera.x + botonera.width + 2
        y: botonera.y + 15
    }

    Rectangle {
        id: botonera
        x: 10
        y:10
        width: 110
        height: 210
        border.color: "#88AA88"
        border.width: 4
        radius: 20

        Image {
            id: image1
            x: parent.border.width
            y: parent.border.width
            width: 100
            height: 100
            source: "imagenes/button_arrow_green.png"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    Util.pulsado(fondo.y);
                    if (pisoActual > 1) {
                        fondo.y+=100
                        pisoActual--
                    }
                }
            }
        }

        Image {
            id: image2
            x: parent.border.width
            y: parent.border.width+100
            width: 100
            height: 100
            rotation: 180
            source: "imagenes/button_arrow_green.png"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    Util.pulsado(fondo.y);
                    if (pisoActual < 10) {
                        fondo.y-=100
                        pisoActual++
                    }
                }
            }
        }
    }
}

