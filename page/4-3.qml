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
        width: contentArea.width * 0.25
        height: contentArea.height
        model: ["Boost", "GTK2", "Lua", "wxWidgets", "Perl", "Python", "Protobuf", "Cairo", "Xerces-C"]
        delegate:
        Rectangle {
            radius: 8
            height: contentArea.height * 0.1
            width: parent.width
            color: Style.lighterRainBow[index % 7]
            StyleText {
                anchors.centerIn: parent
                font.pointSize: smallFontSize
                text: modelData
                color: Style.rainBowForeGround[index % 7]
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    codeView.resolvedUrl = Qt.resolvedUrl("assets/" + modelData + ".txt")
                }
            }
        }
    }

    CodeView {
        id: codeView
        anchors {
            left: items.right
            leftMargin: 16
            top: items.top
        }
        width: contentArea.width * 0.7
        height: contentArea.height
    }
}
