import QtQuick 2.2
import QtQuick.Controls 1.2
import "../qml"
import "../qml/theme"

Slide {
    headline: "CMake Project Structure"
    subHeadline: "A Simple Project"
    Rectangle {
        anchors.fill: contentArea
        border.width: 4
        border.color: "orange"
        color: "lightyellow"
        Column {
            anchors {
                left: parent.left
                top: parent.top
                leftMargin: 25
                topMargin: 25
            }
            spacing: 8
            Text { text: "|-- CMakeLists.txt"}
            Text { text: "|-- main.cpp"}
            Text { text: "|-- text.h" }
            Text { text: "|-- text.cpp"}
        }

        MouseArea {
            anchors.fill: parent
            drag.target: parent
        }

    }
}


