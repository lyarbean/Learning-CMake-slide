import QtQuick 2.2
import QtWebKit 3.0
import "../qml"

Slide {
    headline: "Port to CMake"
    Column {
        spacing: contentArea.height * 0.1
        anchors.fill: contentArea
        StyleText {
            width: parent.width
            text: "Poring to CMake, please consider porting a big C project to Python!"
        }
        StyleText {
            width: parent.width
            text: "A good solution is to write scripts from scratch!"
        }

    }

}
