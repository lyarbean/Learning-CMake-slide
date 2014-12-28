import QtQuick 2.2
import QtQuick.Controls 1.2
import "../qml"
import "../qml/theme"

Slide {
    headline: "CMake Project Structure"
    subHeadline: "A Modularized Project"
    focus: true
    Rectangle {
        z: 3
        x : 440
        y : 400
        radius: 3
        Component.onCompleted: {
            width = childrenRect.width + 12
            height = childrenRect.height + 12
        }
        border.width: 4
        border.color: "orange"
        color: "lightyellow"
        focus: true
        MouseArea {
            anchors.fill: parent
            drag.target: parent
        }
        Text {

            anchors.centerIn: parent
            font.bold: true
            color: "steelblue"
            text: "For big projects, ComponentA lives as a git submodule."
        }
    }

    Rectangle {
        id: box
        anchors.fill: contentArea
        border.width: 4
        border.color: "orange"
        color: "lightyellow"
        focus: true
    }

    ListView {
        focus: true
        anchors {
            leftMargin: 6
            topMargin: 6
            fill: box
        }
        snapMode: ListView.SnapToItem
        model : [
            "|-- CMakeLists.txt",
            "|-- src/",
            "|       |-- CMakeLists.txt",
            "|       |-- main.cpp",
            "|       |-- text.h",
            "|       |-- text.cpp",
            "|-- componentA/",
            "|       |-- CMakeLists.txt",
            "|       |-- ComponentA1.cpp",
            "|       |-- ComponentA1.h",
            "|       |-- ComponentA_1/",
            "|                |-- CMakeLists.txt",
            "|       |-- ... ",
            "|       |-- ComponentAn.cpp",
            "|       |-- ComponentAn.h",
            "|-- componentB/",
            "|       |-- CMakeLists.txt",
            "|       |-- ComponentB1.cpp",
            "|       |-- ComponentB1.h",
            "|       |-- ComponentB1_p.cpp",
            "|       |-- ... ",
            "|       |-- ComponentB_n/",
            "|                |-- CMakeLists.txt",
            "| ...",
            "|-- cmake/",
            "|       |-- FindXX.cmake",
            "|       |-- FindYY.cmake"]
        delegate: Text {
            focus: true
            text: modelData
            MouseArea {
                hoverEnabled: true
                anchors.fill:  parent
                onEntered:  color = "blue"
                onExited: color = "black"
           }
        }
    }

}

