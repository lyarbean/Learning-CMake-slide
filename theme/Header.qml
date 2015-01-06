import QtQuick 2.3
import "../qml"
import "."
Item {
    x: parent.width * 0.1
    y: 0
    width: parent.width * 0.7
    height: parent.height * 0.15
    focus: true
    Column {
        spacing: 2
        Text {
            text: headline
            color: Style.dBlue
            font.pointSize: largeFontSize
        }
        Text {
            text: subHeadline
            color: Style.dBlue
            font.pointSize: normalFontSize
        }
    }
}
