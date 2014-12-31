import QtQuick 2.0
import "."

Rectangle {
    property string presenterName : ""
    property string functionString : ""
    property string slideSubject : ""
    property string dateAndPlace : ""
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
