import QtQuick 2.2
import QtQuick.Controls 1.2
import io.thp.pyotherside 1.4

import "../qml"

Slide {
    headline: "CMake, from A to Z"
    subHeadline: "Variables"
    Column{
        anchors.fill: contentArea
        spacing: 8
        Row {
            spacing: 8
            Repeater {
                model: ListModel {
                    ListElement {
                        name: "Targets"
                        txt: "targets.txt"
                    }
                    ListElement {
                        name: "Locations"
                        txt: "cmakepaths.txt"
                    }
                    ListElement {
                        name: "Flags"
                        txt: "flagsanddefinitions.txt"
                    }
                    ListElement {
                        name: "Properties"
                        txt: "properties.txt"
                    }
                }
                Rectangle {
                    radius: 4
                    height: childrenRect.height + 16
                    width: childrenRect.width + 16
                    color: Style.lighterRainBow[index % 7]
                    StyleText {
                        x: 8
                        y: 8
                        text:  codeView.resolvedUrl === Qt.resolvedUrl("assets/" + txt) ? name : "    "
                        color: Style.rainBowForeGround[index % 7]
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                codeView.resolvedUrl = Qt.resolvedUrl("assets/" + txt)
                            }
                        }
                    }
                }
            }
        }
        CodeView {
            id: codeView
            width: contentArea.width
            height: contentArea.height * 0.9
        }
    }
    Text {
        anchors.fill: footer
        text: "/usr/share/cmake/Help/command"
        font.pointSize: smallFontSize
    }


}
