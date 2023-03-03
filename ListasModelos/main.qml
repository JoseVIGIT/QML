import QtQuick 2.3
import QtQuick.Window 2.2

import "./Twitter"

Window {
    id: rootApp
    visible: true
    width: 400
    height: 400

    Rectangle {
        id: btnCargar
        z: 1
        anchors {
            left: parent.left
            top: parent.top
            right: parent.right
        }
        height: 50
        color: "#808080"
        Text {
            anchors.centerIn: parent
            color: "#FFFFFF"
            text: "Recargar tweets..."
        }
        MouseArea {
            id: areaSignal
            anchors.fill: parent
            signal loadTweets(string twitterPanel)
            onPressed: loadTweets("twitterPanel1")
        }
    }

    Twitter {
        id: tweets1
        clip: true
        z: 0

        //x:25; y:75; height: 310; width: 350

        anchors {
            top: btnCargar.bottom
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        //panel: "twitterPanel1" // para filtrar que la signal vaya a este paquete
        //logo: false
        //maxTweets: 10
        //timeRefresh: 30
        //searchForText: "twitter"
        //autoload: false
        signalEmiter: areaSignal // para definir quien emite la signal
    }
}
