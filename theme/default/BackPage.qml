import QtQuick 2.3
import "."

Rectangle {
    property real widthScale: 1.0
    property real heightScale: 1.0
    // PointSize
    property real tinyFontSize: 14 * widthScale
    property real smallFontSize: 16 * widthScale
    property real normalFontSize: 18 * widthScale
    property real largeFontSize: 24 * widthScale
    property real hugeFontSize: 32 * widthScale

    onWidthChanged: {
        widthScale = width / 960
    }

    onHeightChanged: {
        heightScale = height / 540
    }

    color : 'white'
    antialiasing: true
    smooth: true

    Item {
        id : contentBody
        x : 45 * widthScale
        y : 85 * heightScale
        width : (960 - 155) * widthScale
        height : (540 - 90) * heightScale
        opacity: 0
    }
    Text {
        anchors.centerIn: contentBody
        font.pointSize: hugeFontSize
        text: "Thank you!"
        style: Text.Raised
        styleColor: "blue"
        color : "steelblue"
        opacity: 0.8
        z : 1
    }
}
