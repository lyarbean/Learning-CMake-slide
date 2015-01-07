import QtQuick 2.2
import "../qml"

Slide {
    headline: "Not Just Make"
    subHeadline: "CTest"
    CodeView {
        anchors.fill: contentArea
        resolvedUrl: Qt.resolvedUrl("assets/ctest.txt")
    }
}
