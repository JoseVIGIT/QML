import QtQuick 2.0

Item {

    property ListModel slModel
    property Component slDelegate
    property int slTiempo

    Rectangle {
        id: zonaSlider
        width: parent.width
        height: parent.height

        color: "#000000"
        //border.color: "#88AA88"

        /*
        Component {
            id: delegate
            Column {
                Image {
                    id: imgLateral
                    source: imgPath
                }
            }
        }
        */


        PathView {
            id: slider
            anchors.fill: parent
            clip: true
            model: slModel
            delegate: slDelegate
            path: Path {
                /*
                    zonaSlider es igual de ancho que la imagen
                    startX, startY marcan posición de inicio (esquina superior izquierda de primera imagen)
                    cuando se coloca la imagen esta queda desplazada la mitad de su anchura hacia el interior del PathView
                    Para colocar justo en el borde zonaSlider.width/2
                    Para que además no desaparezca a negro y haga el efecto de salir de la zona zonaSlider.width/2-zonaSlider.width
                    Lo mismo para el caso de la Y
                 */
                startX: zonaSlider.width/2-zonaSlider.width
                startY: zonaSlider.height/2
                PathLine { relativeX: zonaSlider.width*2; relativeY: 0 }
            }
        }

        Timer {
               interval: slTiempo
               running: true
               repeat: true
               onTriggered: {
                   if (slider.currentIndex < 10)
                        slider.incrementCurrentIndex()
                   else
                       slider.currentIndex = 0
               }
        }

    }

}
