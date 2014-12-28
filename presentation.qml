import QtQuick 2.3
import QtQuick.Controls 1.2
import "."

ApplicationWindow {
    id: theWindow
    title: qsTr( "CMake, the easy way")
    minimumWidth: 960
    minimumHeight: 540
    visible: true

    Pages {
        id: theModel
    }

    property int currentIndex : 0
    property int previousIndex : 0
    Component.onCompleted: {
        theView.push(Qt.resolvedUrl(theModel.get(0).ref))
        theView.currentItem.focus = true
    }
    function nextPage() {
        if (currentIndex < theModel.length - 1) {
            currentIndex++
            theView.push (Qt.resolvedUrl(theModel.get(currentIndex).ref))
            theView.currentItem.focus = true
        }
    }

    function jumpToIndex (idx) {
        previousIndex = currentIndex
        while (idx < currentIndex) {
            theView.pop()
            theView.currentItem.focus = true
            currentIndex--
        }
        while (idx > currentIndex) {
            currentIndex++
            theView.push (Qt.resolvedUrl(theModel.get(currentIndex).ref))
            theView.currentItem.focus = true
        }
        //        console.log(theModel.get(currentIndex).ref)
        //        console.log("log: ", currentIndex === idx)
    }

    StackView {
        id: theView
        antialiasing: true
        smooth: true
        Keys.onEscapePressed: {
            theWindow.close();
        }
        Keys.onTabPressed: {
            if (theWindow.visibility !== ApplicationWindow.FullScreen)
            { theWindow.showFullScreen() }
        }
        Keys.onReleased: {
            console.log(event.key)
            if (event.key === Qt.Key_Left || event.key === Qt.Key_Backspace) {
                if (currentIndex > 0) {
                    currentIndex--
                    theView.pop()
                    theView.currentItem.focus = true
                    event.accepted = true
                }
            } else if (event.key === Qt.Key_Right ||  event.key === Qt.Key_Return) {
                if (currentIndex < theModel.count - 1) {
                    currentIndex++
                    theView.push (Qt.resolvedUrl(theModel.get(currentIndex).ref)).focus = true
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
            }
        }
        transform: [
            Scale {
                id : scale
                xScale: yScale
                yScale: Math.min(width/960, height/540)
            }
        ]

    }

    // Navigator with preview support
    Rectangle {
        id: previewBox
        height: parent.height * 0.35
        width: parent.width * 0.35
        y : parent.height * 0.3
        visible: false
        color: "#ffffff"
        border {
            width: 4
            color: "steelblue"
        }
        radius:  4
    }
    Loader {
        id: preview
        parent: previewBox
        anchors {
            fill: previewBox
            leftMargin: parent.height * 0.025
            topMargin:  parent.height * 0.025
        }
    }
    Rectangle {
        z : 999
        id: navigator
        focus: true
        height: 50
        width : parent.width
        visible: false
        y: parent.height - 75
        color : "#00ffffff"
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
            }
            delegate :
                Rectangle {
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
                    font.pixelSize: 36
                    text: index
                    color: "steelblue"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        jumpToIndex(index)
                        navigator.visible = false
                        previewBox.visible = false
                    }
                    hoverEnabled: true
                    onHoveredChanged: {
                        box.color = containsMouse ? "orange" : "white"
                        page.color = containsMouse ? "black" : "steelblue"
                    }
                    onEntered: {
                        previewBox.visible = true
                        preview.source = ref
                    }
                    onExited: {
                        previewBox.visible = false
                    }
                }
            }
        }
    }
}




