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
        ListElement {
            name: "GYP"
            desc: ""
        }
    }

    ListModel {
        id: generatorModel
        ListElement {
            name: "GNU Autotools"
            desc: "A Makefile generator"
        }
        ListElement {
            name: "qmake"
            desc: "Qt's Makefile generator"
        }
        ListElement {
            name: "CMake"
            desc: "A native build tool script generator"
        }
    }

    Column {
        x: contentArea.x + contentArea.width * 0.7
        y: contentArea.y + contentArea.height * 0.8
        width: contentArea.width * 0.2
        height: contentArea.height * 0.2
        focus: true
        spacing: 6
        Rectangle {
            focus: true
            width: parent.width
            height: contentArea.height * 0.1
            color: "orange"
            radius: 5
            Text {
                font.pixelSize: tinyFontSize
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
            height: contentArea.height * 0.1
            color: "steelblue"
            radius: 5
            Text {
                font.pixelSize: tinyFontSize
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

    ListView {
        id: makeView
        x: contentArea.x
        y: contentArea.y
        highlightFollowsCurrentItem: false
        focus: true
        height: contentArea.height * 0.8
        snapMode: ListView.SnapToItem
        currentIndex: 0
        width: contentArea.width * 0.5
        delegate: Rectangle {
            width: contentArea.width * 0.4
            height: contentArea.height * 0.1
            radius: 10
            color: ["orange", "purple", "steelblue", "limegreen"][index % 4]
            Text {
                font.pixelSize: normalFontSize
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
            height: makeView.currentItem.height
            color: "lightsteelblue";
            radius: 5
            border {
                width: 4
                color:"steelblue"
            }
            Text {
                id: t
                anchors.centerIn: parent
                font.pixelSize: smallFontSize
                wrapMode: Text.WrapAnywhere
                text: makeView.model.get(makeView.currentIndex).desc
                Component.onCompleted: parent.width = t.width + 16
                onTextChanged: parent.width = t.width + 16

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
