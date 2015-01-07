import QtQuick 2.2
import "../qml"
Slide {
    headline: "Port to CMake"
    subHeadline: "Work with Custom Command"
    CodeView {
        anchors.fill: contentArea
        resolvedUrl: Qt.resolvedUrl("assets/custom_command.txt")
    }
}
