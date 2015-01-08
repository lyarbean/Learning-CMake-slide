import QtQuick 2.2
import "../qml"

Slide {
    headline: "CMake, the right way"
    subHeadline: "Fame and Fans"

    Row {
        spacing: 8
        x: contentArea.x
        y: contentArea.y
        Repeater {
            model: [
            {text: "CMake in github", url: Qt.resolvedUrl("images/cmake_in_github.png"), color: "orange"},
            {text: "KDE projects tree", url: Qt.resolvedUrl("images/kde_projects.png"), color: "steelblue"},
            {text: "CMake wikipedia", url: Qt.resolvedUrl("images/cmake_in_wiki.png"), color: "limegreen"}
            ]

            Rectangle {
                width:  childrenRect.width * 1.1
                height:  childrenRect.height * 1.1
                radius: 0.1 * height
                color: modelData.color
                Text {
                    x : 0.05 * width
                    y : 0.05 * height
                    font.pointSize: smallFontSize
                    // Have to use "==" rather than "==="
                    text: im.source == modelData.url ? modelData.text : "    "
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            im.source = modelData.url
                        }
                    }
                }
            }
        }
    }
    Image {
        id: im
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        fillMode: Image.PreserveAspectFit
        height: contentArea.height
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
        } else if (event.key === Qt.Key_Space) {
            im.source = ""
        }
    }
}
