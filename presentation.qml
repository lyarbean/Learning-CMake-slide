import QtQuick 2.3
import QtQuick.Controls 1.2
import "."
ApplicationWindow {
    id: theWindow
    title: qsTr("CMake, the easy way")
    minimumWidth: 840
    minimumHeight: 525
    visible: true
    Pages {
        id: theModel
    }

    property real widthScale: 1.0
    property real heightScale: 1.0

    // PixelSize ~= PointSize * 1.33
    property real fontScale: 1.0
    property real scriptFontSize: 7 * 1.33 * fontScale
    property real tinyFontSize: 10 * 1.33 * fontScale
    property real smallFontSize: 14 * 1.33 * fontScale
    property real normalFontSize: 18 * 1.33 * fontScale
    property real bigFontSize: 22 * 1.33 * fontScale
    property real largeFontSize: 24 * 1.33 * fontScale
    property real hugeFontSize: 32 * 1.33 * fontScale
    onWidthChanged: {
        widthScale = width / minimumWidth
        fontScale = Math.min(widthScale, heightScale)
    }

    onHeightChanged: {
        heightScale = height / minimumHeight
        fontScale = Math.min(widthScale, heightScale)
    }

    property int currentIndex: 0
    property int previousIndex: 0
    Component.onCompleted: {
        theView.push(Qt.resolvedUrl(theModel.get(0).ref))
        theView.currentItem.focus = true
    }
    function nextPage() {
        if (currentIndex < theModel.count - 1) {
            currentIndex++
            theView.push(Qt.resolvedUrl(theModel.get(currentIndex).ref))
            theView.currentItem.focus = true
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
            theView.push(Qt.resolvedUrl(theModel.get(currentIndex).ref))
            theView.currentItem.focus = true
        }
    }

    StackView {
        id: theView
        antialiasing: true
        smooth: true
        Keys.onEscapePressed: {
            theWindow.close()
        }
        Keys.onTabPressed: {
            if (theWindow.visibility !== ApplicationWindow.FullScreen) {
                theWindow.showFullScreen()
            } else {
                theWindow.showNormal()
            }
        }
        Keys.onReleased: {
            if (event.key === Qt.Key_Left || event.key === Qt.Key_Backspace) {
                if (currentIndex > 0) {
                    currentIndex--
                    theView.pop()
                    theView.currentItem.focus = true
                    event.accepted = true
                }
            } else if (event.key === Qt.Key_Right
                       || event.key === Qt.Key_Return) {
                if (currentIndex < theModel.count - 1) {
                    currentIndex++
                    theView.push(Qt.resolvedUrl(
                                     theModel.get(
                                         currentIndex).ref)).focus = true
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
    }

    // Navigator with preview support
    // FIXME It's terrible!
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
        x: 5 - theWindow.width * -1.35
        y: theWindow.height * 0.34 + 75
        visible: previewBox.visible
        asynchronous: false
        width: theWindow.width
        height: theWindow.height
        onSourceChanged: {
            if (item !== null) {
                item.scale = 0.3
                console.log("transformOrigin ",transformOrigin)
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
