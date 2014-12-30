import QtQuick 2.3
import "."
Rectangle {
    // FIXME QFont::setPointSizeF: Point size <= 0 (0.000000), must be greater than 0
    property real widthScale: 1.0
    property real heightScale: 1.0
    // PointSize
    property real tinyFontSize: 14 * widthScale
    property real smallFontSize: 16 * widthScale
    property real normalFontSize: 18 * widthScale
    property real largeFontSize: 24 * widthScale
    property real hugeFontSize: 32 * widthScale

    property string slideSubject : ""
    property string presenterName : ""
    property string dateAndPlace : ""

    onWidthChanged: {
        widthScale = parent.width / 960.0
    }

    onHeightChanged: {
        heightScale = parent.height / 540.0
    }

    antialiasing: true
    smooth: true
    color: "white"
    StyleText {
        y : 350 * heightScale
        x : 255 * widthScale
        width : (960 - 330) * widthScale
        text : slideSubject
        font.pointSize: largeFontSize
        font.bold: true
        color: Style.dBlue
        horizontalAlignment: Text.AlignRight
    }
    StyleText {
        y : 390 * heightScale
        x : 255 * widthScale
        width : (960 - 330) * widthScale
        text : presenterName
        font.pointSize: normalFontSize
        color : Style.dBlue
        horizontalAlignment: Text.AlignRight
    }

    StyleText {
        y : 470 * heightScale
        x : 255 * widthScale
        width : (960 - 330) * widthScale
        text :  dateAndPlace
        font.pointSize: tinyFontSize
        color : Style.dBlue
        horizontalAlignment: Text.AlignRight
    }

    Rectangle {
        id : footer
        x : 45 * widthScale
        y : 510 * heightScale
        focus: true
        width : (960 - 155) * widthScale
        height : 30 * heightScale
    }
}
