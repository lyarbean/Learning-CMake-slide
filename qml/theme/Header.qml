import QtQuick 2.3
import "."
Item {
    x : 45
    y : 10
    width : 960 - 155
    height : 70
    Column {
        anchors.fill :  parent
        spacing : 2
        StyleText {
            enabled: true
            text : headline
            color : Style.dBlue
            font.pointSize: Style.largeFontSize
        }
        StyleText {
            enabled: true
            text : subHeadline
            color : Style.dBlue
            font.pointSize: Style.normalFontSize
        }
    }
}
