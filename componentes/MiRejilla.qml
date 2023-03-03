import QtQuick 2.0

Item {
    // Propiedades del objeto
    property variant colorArray: ["#00bde3", "#67c111", "#ea7025"]
    property int rejillaRows: 4
    property int rejillaColumns: 4
    property int rejillaWidth : 252
    property int rejillaHeight : 252
    property int rejillaMargin: 7

    width: rejillaWidth
    height: rejillaHeight

    // Objeto
    Grid{
        anchors.fill: parent
        anchors.margins: rejillaMargin+1
        spacing: 4

        rows:rejillaRows
        columns:rejillaColumns
        Repeater {
            model: 16
            Rectangle {
                //id: index

                width: rejillaWidth/rejillaColumns - rejillaMargin; height: rejillaHeight/rejillaRows - rejillaMargin
                property int colorIndex: Math.floor(Math.random()*3)
                color: colorArray[colorIndex]
                border.color: Qt.lighter(color)
                Text {
                    anchors.centerIn: parent
                    color: "#f0f0f0"
                    text: "Cell " + index
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        //parent.visible = false
                        parent.opacity = 1 - parent.opacity
                    }
                }
            }
        }


    }

}
