import QtQuick 2.2
import "../qml"

Slide {
    headline: "CMake, from A to Z"
    subHeadline: "Hello CMake"
    CodeView {
        anchors.fill: contentArea
        resolvedUrl: Qt.resolvedUrl("assets/hellocmake.txt")
    }
}
