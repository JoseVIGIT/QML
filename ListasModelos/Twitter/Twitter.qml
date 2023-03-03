import QtQuick 2.0

import "./submodules"
import "./js/twitter.js" as JS

Item {    
    property string panel: "" // nombre del panel
    property bool logo: true // mostrar logo
    property int maxTweets: 5 // máximo de Tweets a cargar
    property int timeRefresh: 30 // tiempo de refresco
    property string searchForText: "twitter" // cadena a buscar
    property bool autoload: true // autocargar contenidos
    property Item signalEmiter // target que emite el signal (necesario si autoload: false)
    property bool loaded: false // datos marcados como cargados (pueden estar cargados ya o estar cargandose pero para el uso

    id: rootTwitter

    ListModel {
        id: lModelTweets
    }

    // Tipo de formato para representar el componente
    TweetsBox {
        anchors.fill: parent
    }

    // Refresca los twits cada N segundos
    Timer {
        id: refreshTimer
        interval: timeRefresh * 1000
        running: rootTwitter.loaded; repeat: true
        onTriggered: JS.loadTweets (lModelTweets, maxTweets, searchForText)
    }

    // Señales que se reciben desde target
    // La señal recibida será emitida como X en C o QML y recibida como onX aqui en QML
    Connections  {
        target: rootTwitter.signalEmiter // texto al que se vinculará el objeto en QML o en C con setContextProperty("***", obj);
        onLoadTweets: {
            if (twitterPanel == rootTwitter.panel || rootTwitter.panel == "") {
                initComponent ()
            }
        }
    }

    // Uso sin señales (autocarga)
    Component.onCompleted: {
        if (rootTwitter.autoload) {
            initComponent ()
        }
    }

    function initComponent () {
        lModelTweets.clear()
        rootTwitter.loaded = true
        JS.loadTweets (lModelTweets, maxTweets, searchForText)
        refreshTimer.restart()
    }
}
