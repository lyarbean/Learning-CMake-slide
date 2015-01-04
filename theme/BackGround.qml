import QtQuick 2.3
import "../qml"
import "."
Item {
    x: parent.x + parent.width * 0.85
    y: parent.y + parent.height * 0.15
    width: parent.width * 0.13
    Column {
        anchors.fill: parent
        spacing: 4
        Text {
            width: parent.width
            text: "Slide " + currentIndex
            font.pointSize: scriptFontSize
            color: Style.dBlue
            horizontalAlignment: Text.AlignRight
        }
        Text {
            width: parent.width
            text:  Qt.formatDate(new Date())
            font.pointSize: scriptFontSize
            color: Style.dBlue
            horizontalAlignment: Text.AlignRight
        }
    }
    // TODO Add Clock
}
