import QtQuick 2.0
import "../qml"
import "."

Rectangle {
    property string presenterName : ""
    property string functionString : ""
    property string slideSubject : ""
    property string dateAndPlace : ""
    property real fontScale: Math.min(width / 840.0, height/ 525)

    onFontScaleChanged: {
        scriptFontSize = fontScale * 7.0
        tinyFontSize   = fontScale * 10.0
        smallFontSize  = fontScale * 14.0
        normalFontSize = fontScale * 18.0
        bigFontSize    = fontScale * 22.0
        largeFontSize  = fontScale * 24.0
        hugeFontSize   = fontScale * 32.0
    }
    property real scriptFontSize: 7.0
    property real tinyFontSize:   10.0
    property real smallFontSize:  14.0
    property real normalFontSize: 18.0
    property real bigFontSize:    22.0
    property real largeFontSize:  24.0
    property real hugeFontSize:   32.0

    Column {
        spacing: parent.height * 0.01
        x: parent.width * 0.3
        y: parent.height * 0.7
        width : parent.width * 0.65
        Text {
            width : parent.width
            text: slideSubject
            font.pointSize: bigFontSize
            font.bold: true
            color: Style.dBlue
            horizontalAlignment: Text.AlignRight
        }

        Text {
            width : parent.width
            text : presenterName
            font.pointSize: tinyFontSize
            color : Style.dBlue
            horizontalAlignment: Text.AlignRight
        }

        Text {
            width : parent.width
            text :  functionString
            font.pointSize: tinyFontSize
            color : Style.dBlue
            horizontalAlignment: Text.AlignRight
        }

        Text {
            width : parent.width
            text :  dateAndPlace
            font.pointSize: tinyFontSize
            color : Style.dBlue
            horizontalAlignment: Text.AlignRight
        }
    }

}
