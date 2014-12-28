import QtQuick 2.2
import "../qml"
import "../qml/theme"

Slide {
    headline: "How popular CMake is"

    ListView {
        focus: true
        anchors.fill : parent.contentArea
        cacheBuffer: parent.width
        snapMode: ListView.SnapOneItem
        orientation: ListView.Vertical
        spacing: 12
        model: theModel
        ListModel {
            id : theModel
            ListElement {
                itemName : "KDE"
            }
            ListElement {
                itemName : "VTK"

            }
            ListElement {
                itemName : "ITK"

            }
            ListElement {
                itemName : "ParaView"

            }
            ListElement {
                itemName : "MariaDB, a.k.a. MySQL"
            }
        }
        delegate: StyleText {
            id: t
            text : itemName

            MouseArea {
                anchors.fill:  parent
                drag.target: t
            }
        }
    }
    // KDE
    Image {
        id: kde
        x: contentArea.x + 100
        y: contentArea.y + 50
        fillMode: Image.PreserveAspectFit
        source: Qt.resolvedUrl("images/kde_projects.png")
        visible: false
        MouseArea {
            anchors.fill: parent
            drag.target: parent
        }
    }

    // PLASMA
    Image {
        id: plasma
        x: contentArea.x + 100
        y: contentArea.y + 50
        fillMode: Image.PreserveAspectFit
        source: Qt.resolvedUrl("images/plasma_media_center.png")
        visible: false
        MouseArea {
            anchors.fill: parent
            drag.target: parent
        }
    }

    // CMAKE
    Image {
        id: cmake
        x: contentArea.x + 100
        y: contentArea.y + 50
        fillMode: Image.PreserveAspectFit
        source: Qt.resolvedUrl("images/cmake_in_github.png")
        visible: false
        MouseArea {
            anchors.fill: parent
            drag.target: parent
        }
    }

    Keys.onReleased: {
        console.log("oh yeah")
        if (event.key === Qt.Key_0) {
            cmake.visible = !cmake.visible
            event.accepted = true
        } else if (event.key === Qt.Key_1) {
            kde.visible = !kde.visible
            event.accepted = true
        } else if (event.key === Qt.Key_2) {
            plasma.visible = !plasma.visible
            event.accepted = true
        }
    }
}
