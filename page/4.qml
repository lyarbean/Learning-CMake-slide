import QtQuick 2.2
import QtWebKit 3.0
import "../qml"
Slide {
    headline: "CMake, from A to Z"
    // TODO Add fig that shows how cmake is easy to use////
    // TODO add a log curve
    Image {
        anchors.fill: contentArea
        fillMode: Image.PreserveAspectFit
        id: im
        source: Qt.resolvedUrl("images/cmake_easy.png")
    }
}
