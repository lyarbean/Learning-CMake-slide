import QtQuick 2.2
import "../qml"

Slide {
    headline: "CMake, the right way"
    subHeadline: "Family"

    Rectangle {
        id: box
        x: contentArea.x + contentArea.width -  im.width - 20
        y: contentArea.y + contentArea.height - im.height - 20
        focus: true
        color: "lightgray"
        Image {
            id: im
            x: 5
            y: 5
            source: Qt.resolvedUrl("images/cmake-software-process.jpg")
        }
        MouseArea {
            anchors.fill: im
            drag.target: im
        }
    }

    Keys.onReleased: {
        if (event.key === Qt.Key_Minus) {
            box.scale = box.scale * 0.8
            event.accepted = true
        } else if (event.key === Qt.Key_Equal) {
            box.scale = box.scale * 1.25
            event.accepted = true
        }
    }

    ListModel {
        id: cmakeModel
        ListElement {
            name: "CMake"
            desc: "A make generator"
        }
        ListElement {
            name: "CTest"
            desc: "A testing system"
        }
        ListElement {
            name: "CPack"
            desc: "A packager"
        }
        ListElement {
            name: "CDash"
            desc: "A continuous integration platform"
        }
    }

    ListView {
        id: makeView
        x: contentArea.x
        y: contentArea.y
        model: cmakeModel
        highlightFollowsCurrentItem: false
        focus: true
        height: contentArea.height * 0.8
        snapMode: ListView.SnapToItem
        currentIndex: -1
        width: contentArea.width * 0.3
        delegate: Rectangle {
            width: contentArea.width * 0.3
            height: contentArea.height * 0.1
            radius: 10
            color: Style.lighterRainBow[index % 7]
            StyleText {
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
            StyleText {
                x: 4
                id: t
                anchors.centerIn: parent
                wrapMode: Text.WrapAnywhere
                text: makeView.model.get(makeView.currentIndex).desc
                Component.onCompleted: parent.width = t.width + 20
                onTextChanged: parent.width = t.width + 20

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
