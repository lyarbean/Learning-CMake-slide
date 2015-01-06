import QtQuick 2.2
import "../qml"

Slide {
    headline: "CMake, the right way"
    //  TODO add the right way figure...
    Text {
        text: "http://www.google.com/trends/explore#q=cmake%2C%20scons%2C%20autotools&cmpt=q"
        anchors.centerIn: footer
    }

    Image {
        id: im
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        width: contentArea.width
        fillMode: Image.PreserveAspectFit
        source: Qt.resolvedUrl("images/google_trends.png")
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
