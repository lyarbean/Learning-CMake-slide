import QtQuick 2.3
import "."

Rectangle {
    color: "white"
    property real widthScale: parent.width / 840
    property real heightScale: parent.height / 525 

    // PixelSize ~= PointSize * fScale
    property real fScale: 1.0
    property real fontScale: Math.min(widthScale, heightScale)
    property real hugeFontSize: 32 * fScale * fontScale

    Text {
        anchors.centerIn: parent
        font.pixelSize: hugeFontSize 
        text: "Thank you!"
        style: Text.Raised
        styleColor: "red"
        color : "green"
        opacity: 0.8
    }
}
