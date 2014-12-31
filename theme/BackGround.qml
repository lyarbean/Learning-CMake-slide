import QtQuick 2.3
import "."
Item {
    x: parent.x + parent.width * 0.8
    y: parent.y + parent.height * 0.15
    width: parent.width * 0.15
    Column {
        anchors.fill: parent
        spacing: 4
        Text {
            width: parent.width
            text: "Slide " + currentIndex
            font.pixelSize: scriptFontSize
            color: Style.dBlue
            horizontalAlignment: Text.AlignRight
        }
        Text {
            width: parent.width
            text:  Qt.formatDate(new Date())
            font.pixelSize: scriptFontSize
            color: Style.dBlue
            horizontalAlignment: Text.AlignRight
        }
    }
    // TODO Add Clock
}
