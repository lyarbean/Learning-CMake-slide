import QtQuick 2.3
import QtQuick.Controls 1.3
import "../qml"

Slide {
    headline: "Build Systems"
    subHeadline: "Autotools process vs. CMake Process"
    focus: true
    Image {
        id: autotools
        x: contentArea.x
        y: contentArea.y
        height: contentArea.height
        fillMode: Image.PreserveAspectFit
        source: Qt.resolvedUrl("images/Autoconf-automake-process.svg.png")
        MouseArea {
            anchors.fill: parent
            drag.target: parent
        }
    }
    MouseArea {
        x: contentArea.x + contentArea.width - 350
        y: contentArea.y
        id: cmake
        height: contentArea.height
        width: contentArea.width * 0.3
        drag.target: cmake
        Rectangle {
            width: parent.width
            height: contentArea.height * 0.3
            color: "white"
            border {
                width: 4
                color: "orange"
            }
            radius: 4
            StyleText {
                x: 4
                y: 4
                text: "Configure Step"
                font.pointSize: tinyFontSize
            }

            ListView {
                enabled: false
                x: 16
                y: contentArea.height * 0.06
                spacing: contentArea.height * 0.01
                width: parent.width - 24
                height: contentArea.height * 0.6
                model: ["Read CMakeCache.txt", "Read CMakeLists.txt", "Write CMakeCache.txt"]
                delegate: Rectangle {
                    height: contentArea.height * 0.06
                    width: parent.width
                    color: "steelblue"
                    radius: 4
                    StyleText {
                        anchors.centerIn: parent
                        color: "white"
                        font.pointSize: tinyFontSize
                        text: modelData
                    }
                }
            }
        }

        Rectangle {
            y: contentArea.height * 0.32
            width: parent.width
            height: contentArea.height * 0.15
            color: "white"
            border {
                width: 4
                color: "orange"
            }
            radius: 4
            StyleText {
                x: 4
                y: 4
                text: "Generate Step"
                font.pointSize: tinyFontSize
            }

            Rectangle {
                x: 16
                y: contentArea.height * 0.06
                height: contentArea.height * 0.06
                width: parent.width - 24
                color: "steelblue"
                radius: 4
                StyleText {
                    anchors.centerIn: parent
                    color: "white"
                    font.pointSize: tinyFontSize
                    text: "Write Makefiles"
                }
            }
        }
    }

    Keys.onReleased: {
        if (event.key === Qt.Key_1) {
            autotools.visible = !autotools.visible
        } else if (event.key === Qt.Key_2) {
            cmake.visible = !cmake.visible
        } else if (event.key === Qt.Key_Equal) {
            autotools.scale = autotools.scale * 1.25
        } else if (event.key === Qt.Key_Minus) {
            autotools.scale = autotools.scale * 0.8
        }
    }
}
