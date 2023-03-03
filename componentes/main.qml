import QtQuick 2.3
import QtQuick.Window 2.2

Window {
    visible: true
    id: root
    width: 504
    height: 252

    Rectangle {
        id: zona1
        width: parent.width*0.5
        height: parent.height
        anchors.left: parent.left
        border.color: "#000000000"
        color: "#DDDDFF"

        MiRejilla {
            id: rejilla1

            // configurando las propiedades del objeto
            rejillaWidth: parent.width
            rejillaHeight: parent.height
            rejillaRows: 4
            rejillaColumns: 4
            colorArray: ["#00bde3", "#67c111", "#ea7025"]
        }
    }

    Rectangle {
        id: zona2
        width: parent.width * 0.5
        height: parent.height
        anchors.left: zona1.right
        border.color: "#000000000"
        color: "#FFDDDD"

        MiRejilla {
            id: rejilla2

            anchors.right: parent.right
            anchors.bottom: parent.bottom

            // configurando las propiedades del objeto
            rejillaWidth: 252
            rejillaHeight: 252
            rejillaRows: 4
            rejillaColumns: 4
            colorArray: ["#ff0000", "#00ff00", "#0000ff"]
        }
    }
}
