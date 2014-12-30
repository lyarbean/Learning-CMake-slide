import QtQuick 2.0
import "."

Rectangle {
    property string presenterName : ""
    property string functionString : ""
    property string slideSubject : ""
    property string dateAndPlace : ""
    StyleText {
        y: 350 * heightScale
        x: 255 * widthScale
        width: parent.width - 330 * widthScale
        text: slideSubject
        font.pointSize: largeFontSize
        font.bold: true
        color: Style.dBlue
        horizontalAlignment: Text.AlignRight
    }


    StyleText {
        y : 390 * heightScale
        x : 255 * widthScale
        width : parent.width - 330 * widthScale
        text : presenterName
        font.pointSize: tinyFontSize
        color : Style.dBlue
        horizontalAlignment: Text.AlignRight
    }

    StyleText {
        y : 420 * heightScale
        x : 255 * widthScale
        width : parent.width - 330 * widthScale
        text :  functionString
        font.pointSize: tinyFontSize
        color : Style.dBlue
        horizontalAlignment: Text.AlignRight
    }

    StyleText {
        y : 470 * heightScale
        x : 255 * widthScale
        width : parent.width - 330 * widthScale
        text :  dateAndPlace
        font.pointSize: tinyFontSize
        color : Style.dBlue
        horizontalAlignment: Text.AlignRight
    }

}
