import QtQuick 2.3
import QtQuick.Window 2.2

Window {
    visible: true
    id: root
    width: 252
    height: 252

    MiRejilla {
        id: rejilla
        width: parent.width
        height: parent.height

        // configurando las propiedades del objeto
        rejillaRows: 4
        rejillaColumns: 4
        colorArray: ["#00bde3", "#67c111", "#ea7025"]
    }

}
