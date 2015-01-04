import QtQuick 2.3
import "../qml"

Slide {
    headline: "Build Systems"
    subHeadline: ""
    focus: true
    Image {
        id: im
        focus: true
        height: contentArea.height
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        fillMode: Image.PreserveAspectFit
        source: Qt.resolvedUrl("images/build-system-evolution13.png")
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

}

