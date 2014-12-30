import QtQuick 2.3
import "."
Item {
    x : 45 * widthScale
    y : 10 * heightScale
    width : (960 - 155) * widthScale
    height : 70 * heightScale
    Column {
        anchors.fill :  parent
        spacing : 2 * heightScale
        StyleText {
            enabled: true
            text : headline
            color : Style.dBlue
            font.pointSize: largeFontSize
        }
        StyleText {
            enabled: true
            text : subHeadline
            color : Style.dBlue
            font.pointSize: normalFontSize
        }
    }
}
