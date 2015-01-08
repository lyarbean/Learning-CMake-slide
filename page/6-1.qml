import QtQuick 2.2
import QtWebKit 3.0
import "../qml"
Slide {
    headline: "Port to CMake"
    subHeadline: "Root Project"

    CodeView {
        anchors.fill: contentArea
        resolvedUrl: Qt.resolvedUrl("assets/port/system_port.txt")
    }
}
