import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

import "."
ApplicationWindow {
    id: theWindow
    title: qsTr("CMake, the easy way")
    width: 840
    height: 525
    visible: true
    Pages {
        id: theModel
    }

    property int currentIndex: 0
    property int previousIndex: 0

    Component.onCompleted: {
        theView.push(Qt.resolvedUrl(theModel.get(0).ref))
        theView.currentItem.focus = true
        theWindow.showFullScreen()
    }

    function nextPage() {
        if (currentIndex < theModel.count - 1) {
            currentIndex++
            theView.push(Qt.resolvedUrl(theModel.get(currentIndex).ref)).focus = true
        }
    }

    function jumpToIndex(idx) {
        previousIndex = currentIndex
        while (idx < currentIndex) {
            theView.pop()
            theView.currentItem.focus = true
            currentIndex--
        }
        while (idx > currentIndex) {
            currentIndex++
            theView.push(Qt.resolvedUrl(theModel.get(currentIndex).ref)).focus = true
        }
    }

    StackView {
        id: theView
        antialiasing: true
        smooth: true
        Keys.onEscapePressed: {
            if (theWindow.visibility === Window.FullScreen) {
                theWindow.showNormal()
            } else {
                theWindow.showFullScreen()
            }
        }
        Keys.onReleased: {
            // console.log(event.key)
            if (event.key === Qt.Key_Left || event.key === Qt.Key_Backspace) {
                if (currentIndex > 0) {
                    currentIndex--
                    theView.pop()
                    theView.currentItem.focus = true
                    event.accepted = true
                }
            } else if (event.key === Qt.Key_Right || event.key === Qt.Key_Return) {
                if (currentIndex < theModel.count - 1) {
                    currentIndex++
                    theView.push(Qt.resolvedUrl(theModel.get(currentIndex).ref)).focus = true
                    event.accepted = true
                }
            } else if (event.key === Qt.Key_Up) {
                jumpToIndex(previousIndex)
                event.accepted = true
            } else if (event.key === Qt.Key_Down) {
                previousIndex = currentIndex
                event.accepted = true
            } else if (event.key === Qt.Key_Menu) {
                navigator.visible = !navigator.visible
                event.accepted = true
            } else if (event.key === Qt.Key_Meta) {
                noteEdit.visible = !noteEdit.visible
                event.accepted = true
            }
        }
    }

    Rectangle {
        id: noteEdit
        y: parent.height * 0.65
        x: parent.width * 0.65
        height: parent.height * 0.3
        width: parent.width * 0.3
        visible: false
        focus: true
        radius: 5
        color: Qt.lighter("orange", 1.8)
        ScrollView {
            anchors.fill: parent
            frameVisible: true
            highlightOnFocus: true
            TextEdit {
                id: noteText
                text: "Note"
                font.pointSize: 24
                color: "steelblue"
                selectByMouse: true
                cursorVisible: true
                cursorDelegate: Rectangle {
                    width: 5
                    color: "#4fff0000"
                }
                Keys.onReleased: {
                    if (event.key === Qt.Key_Meta) {
                        noteEdit.visible = false
                        theView.currentItem.focus = true
                        event.accepted = true
                    }
                }
            }
        }
        Rectangle {
            color: Qt.lighter("orange")
            width: 32
            height: 32
            anchors.left: parent.right
            anchors.bottom: parent.bottom
            MouseArea {
                anchors.fill: parent
                drag.target: noteEdit
                onEntered: {
                    theView.currentItem.focus = true
                }
            }
        }
    }

    // Navigator with preview support
    Rectangle {
        id: previewBox
        height: parent.height * 0.3 + 10
        width: parent.width * 0.3 + 10
        y: parent.height * 0.68 - 80
        x: parent.width * 0.1
        visible: navigator.visible
        color: "#ffffff"
        border {
            width: 3
            color: "steelblue"
        }
        radius: 3
    }
    Loader {
        id: preview
        parent: previewBox
        visible: previewBox.visible
        anchors.fill: parent
        asynchronous: false
        onSourceChanged: {
            if (item !== null) {
            }
        }
        enabled: false
    }

    Rectangle {
        z: 999
        id: navigator
        focus: true
        height: 50
        width: parent.width * 0.5
        visible: false
        y: parent.height - 75
        color: "#00ffffff"
        ListView {
            id: theList
            model: theModel
            orientation: ListView.Horizontal
            anchors.fill: parent
            header: Rectangle {
                width: 50
                height: 50
                radius: 25
                color: "orange"
                Rectangle {
                    x: 25
                    width: 25
                    height: 50
                    color: "orange"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: navigator.visible = false
                }
            }
            delegate: Rectangle {
                id: box
                color: "white"
                width: 50
                height: 50
                border {
                    width: 2
                    color: "orange"
                }
                radius: 4
                Text {
                    id: page
                    anchors {
                        margins: 3
                        centerIn: parent
                    }
                    font.pointSize: 24
                    text: index
                    color: "steelblue"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        navigator.visible = false
                        jumpToIndex(index)
                    }
                    hoverEnabled: true
                    onHoveredChanged: {
                        box.color = containsMouse ? "orange" : "white"
                        page.color = containsMouse ? "black" : "steelblue"
                    }
                    onEntered: {
                        preview.source = ref
                    }
                }
            }
        }
    }
}
