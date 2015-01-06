import QtQuick 2.2
import QtQuick.Controls 1.2
import io.thp.pyotherside 1.4

import "../qml"
Slide {
    headline: "CMake, from A to Z"
    subHeadline: "Modularized Source Code Layout"

    Item {
        id: box
        anchors.fill: contentArea
        Row {
            x: 4
            spacing: 16
            Column {
                id: topLevel
                x: 8
                y: 8
                spacing: 8
                Rectangle {
                    color: Style.lighterRainBow[0]
                    width: childrenRect.width + 8
                    height: childrenRect.height + 8
                    radius: 3
                    StyleText {
                        text: "CMakeLists.txt"
                        x: 4
                        y: 4
                        font.pointSize: smallFontSize
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                showCode(Qt.resolvedUrl("assets/CMakeLists.txt"))
                            }
                        }
                    }
                }
                Repeater{
                    model: ["ComponentA", "ComponentB", "ComponentC", "ComponentD", "autotests", "cmake", "doc"]
                    Rectangle {
                        width: childrenRect.width + 8
                        height: childrenRect.height + 8
                        radius: 3
                        color: Style.lighterRainBow[(index + 1) % 7]
                        StyleText {
                            text: modelData
                            x: 4
                            y: 4
                            font.pointSize: smallFontSize
                            color: Style.rainBowForeGround[(index + 1)% 7]
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    // TODO show codes
                                }
                            }
                        }
                    }
                }
            }
            Rectangle {
                id: showCase
                visible: false
                y: 4
                width: contentArea.width - topLevel.width - 24
                height: contentArea.height - 8
                property string code
                ScrollView {
                    width: parent.width
                    height: parent.height
                    id: codeReader
                    highlightOnFocus: true
                    frameVisible: true
                    TextEdit {
                        width: parent.width
                        height: parent.height
                        activeFocusOnPress: false
                        selectByMouse: true
                        readOnly: true
                        selectedTextColor: "indigo"
                        selectionColor: "#eee"
                        textFormat: Text.RichText
                        text: showCase.code
                        font.pointSize: tinyFontSize
                    }
                }
            }
        }
    }
    function showCode(file) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                showCase.code = py.call_sync("renderCode.format", [xhr.responseText, "cmake"])
                showCase.visible = true
            }
        }
        xhr.open("GET", Qt.resolvedUrl(file))
        xhr.send();
    }
    Python {
        id: py // renderCode.py        
        Component.onCompleted: {
            // Add the directory of this .qml file to the search path
            addImportPath(Qt.resolvedUrl('assets'));
            // Import the main module and load the data
            importModule_sync('renderCode')
        }
    }

    //    ListView {
    //        focus: true
    //        anchors {
    //            leftMargin: 6
    //            topMargin: 6
    //            fill: box
    //        }
    //        snapMode: ListView.SnapToItem
    //        model : [
    //        "|-- CMakeLists.txt",
    //        "|-- src/",
    //        "|       |-- CMakeLists.txt",
    //        "|       |-- main.cpp",
    //        "|       |-- text.h",
    //        "|       |-- text.cpp",
    //        "|-- componentA/",
    //        "|       |-- CMakeLists.txt",
    //        "|       |-- ComponentA1.cpp",
    //        "|       |-- ComponentA1.h",
    //        "|       |-- ComponentA_1/",
    //        "|                |-- CMakeLists.txt",
    //        "|       |-- ... ",
    //        "|       |-- ComponentAn.cpp",
    //        "|       |-- ComponentAn.h",
    //        "|-- componentB/",
    //        "|       |-- CMakeLists.txt",
    //        "|       |-- ComponentB1.cpp",
    //        "|       |-- ComponentB1.h",
    //        "|       |-- ComponentB1_p.cpp",
    //        "|       |-- ... ",
    //        "|       |-- ComponentB_n/",
    //        "|                |-- CMakeLists.txt",
    //        "| ...",
    //        "|-- cmake/",
    //        "|       |-- FindXX.cmake",
    //        "|       |-- FindYY.cmake"
    //        ]
    //        delegate: Text {
    //            focus: true
    //            text: modelData
    //            MouseArea {
    //                hoverEnabled: true
    //                anchors.fill:  parent
    //                onEntered:  color = "blue"
    //                onExited: color = "black"
    //            }
    //        }
    //    }
    // TODO Add KDE project directory
}
