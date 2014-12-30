import QtQuick 2.3
import QtQuick.Controls 1.3
import "../qml"
import "../theme"

Slide {
    headline: "Build Systems"
    subHeadline: "Autotools process vs. CMake Process"
    focus: true
    Image {
        x: contentArea.x
        y: contentArea.y
        id: autotools
        visible: false
        source: Qt.resolvedUrl("images/Autoconf-automake-process.svg.png")
        scale: fontScale
        MouseArea {
            anchors.fill: parent
            drag.target: parent
        }
    }
    Image {
        x: contentArea.x + 0.1 * contentArea.width
        y: contentArea.y + 0.1 * contentArea.height
        id: cmake
        visible: false
        source: Qt.resolvedUrl("images/cmake_process.png")
        scale: fontScale
        MouseArea {
            anchors.fill: parent
            drag.target: parent
        }
    }


    Keys.onReleased: {
        if (event.key === Qt.Key_1) {
            autotools.visible = !autotools.visible
        } else if (event.key === Qt.Key_2) {
            cmake.visible = !cmake.visible
        }
    }
    Rectangle {
        x: footer.x
        y: footer.y
        Row {
            spacing: 5
            Text {text: "1"}
            Text {text: "2"}
        }
    }
}
