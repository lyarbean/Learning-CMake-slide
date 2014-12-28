import QtQuick 2.3
import "."
Rectangle {
    width: 960
    height: 540
    antialiasing: true
    smooth: true
    color : 'white'
    property string slideSubject : ""
    property string presenterName : ""
    property string dateAndPlace : ""

    StyleText {
        y : 350
        x : 255
        width : 960 - 330
        text : slideSubject
        font.pointSize: 22
        font.bold: true
        color : Style.dBlue
        horizontalAlignment: Text.AlignRight
    }
    StyleText {
        y : 390
        x : 255
        width : 960 - 330
        text : presenterName
        font.pointSize: 13
        color : Style.dBlue
        horizontalAlignment: Text.AlignRight
    }

    StyleText {
        y : 470
        x : 255
        width : 960 - 330
        text :  dateAndPlace
        font.pointSize: 10
        color : Style.dBlue
        horizontalAlignment: Text.AlignRight
    }

    Rectangle {
        id : footer
        x : 45
        y : 510
        focus: true
        width : 960 - 155
        height : 30
    }

}
