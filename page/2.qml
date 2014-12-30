import QtQuick 2.3
import "../qml"
import "../theme"


Slide {
    headline: "Build Systems"
    subHeadline: ""
    focus: true
    Image {
        id: autotools
        focus: true
        anchors.centerIn: contentArea
        fillMode: Image.PreserveAspectFit
        source: Qt.resolvedUrl("images/build-system-evolution13.png")
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                autotools.scale = fontScale * 0.8
            }
            onExited: {
                autotools.scale = 1.0
            }
        }
    }
}

