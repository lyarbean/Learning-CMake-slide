import QtQuick 2.2
import "../qml"
Slide {
    headline: "Port to CMake"
    subHeadline: "Work with Fortran"
    CodeView {
        anchors.fill: contentArea
        resolvedUrl: Qt.resolvedUrl("assets/fortran.txt")
    }
}
