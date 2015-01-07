import QtQuick 2.2
import QtWebKit 3.0
import "../qml"

Slide {
    headline: "Port to CMake"
    HtmlView {
        id: codeView
        anchors.fill: contentArea
        // resolvedUrl: Qt.resolvedUrl("assets/cmake_system_output.html")
    }
}
