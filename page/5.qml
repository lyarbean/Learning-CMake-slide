import QtQuick 2.2
import QtWebKit 3.0
import "../qml"
Slide {
    headline: "Not Just Make"
    // TODO not just make
    Column {
        anchors.fill: contentArea
        Repeater {
            model: ["CTest", "CPack", "Graphiviz", "LaTeX", "Doxygen"]
            Rectangle {
                width: contentArea.width * 0.3
                height: contentArea.height * 0.1
                color: Style.rainBow[index % 7]
                radius: contentArea.height * 0.02
                StyleText {
                    color: Style.rainBowForeGround[index % 7]
                    anchors.centerIn: parent
                    text: modelData
                }
            }
        }
    }
}
