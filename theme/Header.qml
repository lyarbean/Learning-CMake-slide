import QtQuick 2.3
import "."
Item {
    x: parent.width * 0.1
    y: 0
    width : parent.width * 0.7
    height : parent.height * 0.2
    Column {
        anchors.fill:  parent
        spacing : 2
        Text {
            text: headline
            color: Style.dBlue
            font.pointSize: bigFontSize
        }
        Text {
            text: subHeadline
            color: Style.dBlue
            font.pointSize: normalFontSize
        }
    }
}
