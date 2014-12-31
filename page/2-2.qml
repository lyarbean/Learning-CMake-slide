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
        source: Qt.resolvedUrl("images/Autoconf-automake-process.svg.png")
        MouseArea {
            anchors.fill: parent
            drag.target: parent
        }
    }
    Rectangle {
        x: contentArea.x + 0.5 * contentArea.width
        y: contentArea.y
        id: cmake
        scale: contentArea.width / 600
        width: 350
        height: 260
        MouseArea {
            anchors.fill: parent
            drag.target: parent
        }
        color:"white"
        Row {
            spacing: 80
            Column {
                spacing: 30
                width: 150
                height:  260
                Text {text: "Configure Step"}
                Rectangle {
                    color:"white"
                    border {
                        width: 4
                        color: "orange"
                    }
                    radius: 4
                    width: 150
                    height:  260
                    Column {
                        spacing: 20
                        x: 20
                        y: 20
                        width: 150
                        Rectangle {
                            width: 150
                            height: 60
                            border {
                                width: 4
                                color: "orange"
                            }
                            radius: 4
                            Text {
                                anchors.centerIn: parent
                                text: "Read CMakeCache.txt"
                            }
                        }
                        Rectangle {
                            width: 150
                            height: 60
                            border {
                                width: 4
                                color: "orange"
                            }
                            radius: 4
                            Text {
                                anchors.centerIn: parent
                                text: "Read CMakeLists.txt"
                            }
                        }
                        Rectangle {
                            width: 150
                            height: 60
                            border {
                                width: 4
                                color: "orange"
                            }
                            radius: 4
                            Text {
                                anchors.centerIn: parent
                                text: "Write CMakeCache.txt"
                            }
                        }
                    }
                }
            }
            Rectangle {
                width: 120
                height: 260
                Column{
                    spacing: 30
                    Text {text: "Generate Step"}
                    Rectangle {
                        width: 120
                        height: 60
                        border {
                            width: 4
                            color: "orange"
                        }
                        radius: 4
                        Text {
                            anchors.centerIn: parent
                            text: "Write Makefiles"
                        }
                    }
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
