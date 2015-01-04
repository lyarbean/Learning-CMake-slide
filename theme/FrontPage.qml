import QtQuick 2.0
import "../qml"
import "."

Rectangle {
    property string presenterName : ""
    property string functionString : ""
    property string slideSubject : ""
    property string dateAndPlace : ""
    width: 840
    height: 525
    property real fontScale: Math.max(1.0, Math.min(width / 840.0, height/ 525))
    property real scriptFontSize: 7 *  fontScale
    property real tinyFontSize: 10 * fontScale
    property real smallFontSize: 14 * fontScale
    property real normalFontSize: 18 * fontScale
    property real bigFontSize: 22 * fontScale
    property real largeFontSize: 24 * fontScale
    property real hugeFontSize: 32 * fontScale

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
