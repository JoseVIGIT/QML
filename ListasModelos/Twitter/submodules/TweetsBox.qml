import QtQuick 2.0

Item {
    property int loadingCircle: 135
    property real loadingCirclePerc: 0.5 // %50%

    Item {
        id: componentTwitterLoading
        anchors.fill: parent
        opacity: 1
        z: 0
        AnimatedImage {
            id: spin
            width: (Math.min (parent.width, parent.height) * loadingCirclePerc) < loadingCircle ? (Math.min (parent.width, parent.height) * loadingCirclePerc) : loadingCircle
            height: width
            anchors.centerIn: parent
            source: "qrc:/Twitter/imagenes/loading.gif"
        }
        Image {
            x: 0
            y: 0
            z: 1
            width: spin.width / 3
            height: spin.width / 3
            anchors.centerIn: parent
            source: "qrc:/Twitter/imagenes/twitterLogo.png"
        }
    }

    Rectangle {
        id: componentTwitter
        visible: false
        opacity: 0
        z: 1
        height: parent.height
        width: rootTwitter.logo? parent.width : parent.width + 20
        color: "#D0E2ED"

        // Logo Twitter
        Image {
            id: logoTwitter
            visible: rootTwitter.logo // Muestra logo a peticion del usuario
            width: 40
            height: 40
            x: 0
            y: 0
            z: 1 // Pon el logo por encima de la esquina del listado
            opacity: 0.9
            source: "qrc:/Twitter/imagenes/twitterLogo.png"
        }

        // Listado de mensajes
        ListView {
            id: listTweets
            x: rootTwitter.logo? 15 : 0
            y: rootTwitter.logo? 15 : 0
            z: 0 // Para conseguir que el icono de twitter salga por encima
            height: parent.height
            width: parent.width - 20
            spacing: 4
            model: lModelTweets
            delegate: TweetsBoxDelegate{}

            onCountChanged: {
                if (rootTwitter.loaded) {
                    componentTwitter.opacity = 0
                    // Para disparar el behavior aseguro cambio de estado en visible cambiando de false a true (si estuviera ya en true no cambiaria el valor sin el false previo)
                    componentTwitter.visible = false
                    componentTwitter.visible = true
                }
            }
        }

        Behavior on visible {
            NumberAnimation  {
                targets: [componentTwitter]
                properties: "opacity"
                to: 1
                duration: 1000
            }
        }
    }

}
