import QtQuick 2.2
import QtQuick.Controls 1.2
import "../qml"

Slide {
    headline: "CMake, from A to Z"
    subHeadline: "Finder"
    Text {
        id: st
        anchors.fill: footer
        text: "/usr/share/cmake/Modules/Find*"
        font.pointSize: smallFontSize
    }

    ListView {
        id: items
        x: contentArea.x
        y: contentArea.y
        width: contentArea.width
        height: contentArea.height * 0.1
        orientation: ListView.Horizontal
        spacing: contentArea.width * 0.01
        model: ["Boost", "GTK2", "Lua", "wxWidgets", "Perl", "Python", "Protobuf", "Cairo", "Xerces-C", "Java"]
        delegate:
        Rectangle {
            radius: 8
            height: childrenRect.height + 16
            width: childrenRect.width + 16
            color: Style.lighterRainBow[index % 7]
            StyleText {
                x: 8
                y: 8
                font.pointSize: smallFontSize
                text: codeView.resolvedUrl === Qt.resolvedUrl("assets/" + modelData + ".txt") ? modelData : "    "
                color: Style.rainBowForeGround[index % 7]
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        codeView.resolvedUrl = Qt.resolvedUrl("assets/" + modelData + ".txt")
                    }
                }
            }
        }
    }

    CodeView {
        id: codeView
        x: contentArea.x
        anchors {
            top: items.bottom
        }
        width: contentArea.width
        height: contentArea.height * 0.9
    }
}
