import QtQuick 2.2
import "../qml"
import "../qml/theme"

Slide {
    headline: "How fast CMake is"
    focus: true
    Image {
        id: im
        x: contentArea.x + 300
        y: contentArea.y + 50
        fillMode: Image.PreserveAspectFit
    }
    ListView {
        x: contentArea.x
        y: contentArea.y
        height: contentArea.height
        width: 300
        focus: true
        model: ["images/conftime.png", "images/buildtime.png", "images/emptytime.png"]
        snapMode: ListView.SnapToItem
        delegate:
            Image {
            height: 100
            fillMode: Image.PreserveAspectFit
            source: Qt.resolvedUrl(modelData)
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    im.source = modelData
                }
            }
        }
    }
    MouseArea {
        anchors.fill: im
        drag.target: im
    }

    Text {
        anchors.centerIn: footer
        text: "http://sourceforge.net/p/meson/wiki/Simple comparison/"
    }
}
