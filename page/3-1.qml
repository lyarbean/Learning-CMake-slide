import QtQuick 2.2
import "../qml"
import "../theme"

Slide {
    headline: "CMake, the right way"
    subHeadline: "Fame"

    Row {
        spacing: 8
        x: contentArea.x
        y: contentArea.y
        Rectangle {
            width:  childrenRect.width * 1.1
            height:  childrenRect.height * 1.1
            color: "orange"
            Text {
                x : 0.05 * width
                y : 0.05 * height
                font.pixelSize: normalFontSize
                text:"CMake in github"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        im.source = Qt.resolvedUrl("images/cmake_in_github.png")
                    }
                }
            }
        }
        Rectangle {
            width:  childrenRect.width * 1.1
            height:  childrenRect.height * 1.1
            color: "steelblue"
            Text {
                x : 0.05 * width
                y : 0.05 * height
                font.pixelSize: normalFontSize
                text: "KDE projects tree"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        im.source = Qt.resolvedUrl("images/kde_projects.png")
                    }
                }
            }
        }
        Rectangle {
            width:  childrenRect.width * 1.1
            height:  childrenRect.height * 1.1
            color: "limegreen"
            Text {
                x : 0.05 * width
                y : 0.05 * height
                font.pixelSize: normalFontSize
                id: t
                text: "CMake wikipedia"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        im.source = Qt.resolvedUrl("images/cmake_in_wiki.png")
                    }
                }
            }
        }
    }
    Image {
        id: im
        focus: true
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        fillMode: Image.PreserveAspectFit
    }
    MouseArea {
        anchors.fill: im
        drag.target: im
    }
    Keys.onReleased: {
        if (event.key === Qt.Key_Minus) {
            im.scale = im.scale * 0.8
            event.accepted = true
        } else if (event.key === Qt.Key_Equal) {
            im.scale = im.scale * 1.25
            event.accepted = true
        }
    }


    // Users list
    // Statistics from github
    // KDE project tree
    //
}
