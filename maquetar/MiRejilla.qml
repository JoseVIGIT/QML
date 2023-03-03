import QtQuick 2.0

Item {
    // Propiedades del objeto
    property variant colorArray: ["#00bde3", "#67c111", "#ea7025"]
    property int rejillaRows: 4
    property int rejillaColumns: 4

    // Objeto
    Grid{
        anchors.fill: parent
        anchors.margins: 8
        spacing: 4
        rows:rejillaRows
        columns:rejillaColumns
        Repeater {
            model: 16
            Rectangle {
                width: 56; height: 56
                property int colorIndex: Math.floor(Math.random()*3)
                color: colorArray[colorIndex]
                border.color: Qt.lighter(color)
                Text {
                    anchors.centerIn: parent
                    color: "#f0f0f0"
                    text: "Cell " + index
                }
            }
        }
    }
}
