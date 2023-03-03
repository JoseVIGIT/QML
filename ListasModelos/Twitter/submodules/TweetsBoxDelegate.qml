import QtQuick 2.0

Rectangle {

    property int avatarMaxSize: 100
    property real avatarPerc: 0.2 // 20% de la anchura de la fila
    property int borderWidth: 4
    property int paddingRect: 10 // padding entre rectangulo exterior y cuerpo mensaje (img+txt)
    property int paddingTxt: 10 // padding entre mensaje y borde mensaje. Valor horizontal. El valor vertical es la mitad

    id: rootTweeter
    width: parent.width

    // Altura del componente depende de altura máxima de texto o avatar (del mayor de los dos)
    height: ((texto.height > avatar.height ) ? texto.height : avatar.height) + paddingRect*2 // padding inferior y superior (padding*2)

    border.color: "#28A9E0"
    border.width: borderWidth
    radius: 10

    Row {
        id: marco
        x: paddingRect
        y: paddingRect
        width: parent.width - paddingRect
        spacing: 10

        Image {
            id: avatar
            width: rootTweeter.width * avatarPerc < avatarMaxSize ? rootTweeter.width * avatarPerc : avatarMaxSize // % de la anchura total o avatarMaxSize
            height: width
            source: imgProfile // dato: Modelo
        }

        Rectangle {
            id: texto
            height: textoMensaje.height + paddingTxt // padding inferior del txt desplazando rect exterior de texto hacia abajo
            width: marco.width - avatar.width - marco.spacing - paddingRect // - paddingRect para añadir padding entre rect txt y rect fila
            border.color: "#cccccc"
            radius: 10

            Text{
                id: textoMensaje
                x: paddingTxt ; y: paddingTxt /2 // padding sup, izq interno del texto
                width: parent.width - paddingTxt // padding derecha (inferior no se define, depende del numero de lineas de texto)
                wrapMode: Text.Wrap
                font.pointSize: 10
                text: txtTweet  // dato: Modelo
            }
        }
    }
}
