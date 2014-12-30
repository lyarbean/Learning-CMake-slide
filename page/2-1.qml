import QtQuick 2.3
import QtQuick.Controls 1.3
import "../qml"
import "../theme"

Slide {
    headline: "Build Systems"
    subHeadline: "Make Tools and Make Generators"
    focus: true
    ListModel {
        id: toolsModel
        ListElement {
            name: "GNU Make (gmake)"
            desc: "the standard implementation of make for Linux and OS X."
            cite: "Arnold Robbins (2005), Unix in a Nutshell, Fourth Edition, O'Reilly"
        }
        ListElement {
            name: "VisualStudio"
            desc: "nmake, yeah, it's a Make"
        }
        ListElement {
            name: "Ninja"
            desc: "http://martine.github.io/ninja/, Make replacement"
        }
        ListElement {
            name: "Scons"
            desc: "http://www.scons.org/, Make replacement"
        }
    }

    ListModel {
        id: generatorModel
        ListElement {
            name: "GNU Autotools"
            desc: "A Makefile generator"
        }
        ListElement {
            name: "CMake"
            desc: "A multi-target generator"
        }
    }

    Item {
        x: contentArea.x + contentArea.width * 0.7
        y: contentArea.y + contentArea.height * 0.8
        width: contentArea.width * 0.2
        height: 106 * heightScale
        focus: true
        Column {
            anchors.fill: parent
            spacing: 6 * heightScale
            Rectangle {
                focus: true
                width: parent.width
                height: 50 * heightScale
                color: "orange"
                radius: 5
                Text {
                    font.pointSize: tinyFontSize
                    text: "Tools"
                    anchors.centerIn: parent
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: makeView.model= toolsModel
                }
            }
            Rectangle {
                focus: true
                width: parent.width
                height: 50 * heightScale
                color: "steelblue"
                radius: 5
                Text {
                    font.pointSize: tinyFontSize
                    text: "Generators"
                    anchors.centerIn: parent
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        makeView.model= generatorModel
                    }
                }
            }
        }
    }
    ListView {
        id: makeView
        x: contentArea.x
        y: contentArea.y
        highlightFollowsCurrentItem: false
        focus: true
        height: contentArea.height
        snapMode: ListView.SnapToItem
        currentIndex: 0
        Component.onCompleted: {
            width = childrenRect.width
        }
        delegate: Rectangle {
            width: 250 * widthScale
            height: 50 * heightScale
            radius: 10 * fontScale
            color: ["orange", "red", "steelblue", "limegreen"][index % 4]
            Text {
                font.pointSize: normalFontSize
                anchors.centerIn: parent
                text: name
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    makeView.currentIndex = index
                }
            }
        }
        highlight: highlight
    }
    Component {
        id: highlight
        Rectangle {
            x: makeView.currentItem.x + makeView.currentItem.width
            height: 50 * heightScale
            color: "lightsteelblue";
            radius: 5
            border {
                width: 4
                color:"steelblue"
            }
            Text {
                id: t
                anchors.centerIn: parent
                font.pointSize: tinyFontSize
                wrapMode: Text.WrapAnywhere
                text: makeView.model.get(makeView.currentIndex).desc
                onTextChanged:
                parent.width = t.width + 16

            }
            y: makeView.currentItem.y
            Behavior on y {
                SpringAnimation {
                    spring: 2
                    damping: 0.3
                }
            }
        }
    }
}
