import QtQuick 2.2
import QtQuick.Controls 1.2
import io.thp.pyotherside 1.4

import "../qml"

Slide {
    headline: "CMake, from A to Z"
    subHeadline: "Variables"
    Column{
        anchors.fill: contentArea
        spacing: 8
        Row {
            spacing: 8
            Repeater {
                model: ListModel {
                    ListElement {
                        name: "Locations"
                        txt: "cmakepaths.txt"
                    }
                    ListElement {
                        name: "Flags"
                        txt: "flagsanddefinitions.txt"
                    }
                    ListElement {
                        name: "Properties"
                        txt: "properties.txt"
                    }
                }
                Rectangle {
                    radius: 4
                    height: childrenRect.height + 16
                    width: childrenRect.width + 16
                    color: Style.lighterRainBow[index % 7]
                    StyleText {
                        x: 8
                        y: 8
                        text: name
                        color: Style.rainBowForeGround[index % 7]
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                changeFile("assets/" + txt)
                            }
                        }
                    }
                }
            }
        }
        ScrollView {
            width: contentArea.width
            height: contentArea.height * 0.9
            id: codeReader
            highlightOnFocus: true
            frameVisible: true
            property string text
            TextEdit {
                activeFocusOnPress: false
                selectByMouse: true
                readOnly: true
                selectedTextColor: "indigo"
                selectionColor: "#eee"
                textFormat: Text.RichText
                text: codeReader.text
                font.pointSize: tinyFontSize
            }
        }
    }
    // TODO A listview and use +/- to navigate
    //
    //
    // Boost
    // GTK2
    // SWIG
    // Lua
    // wxWidgets
    // Perl
    // Python
    // Protobuf
    // Qt5
    //
    // PKGCONFIG
    // Cairo
    // MySQL
    // Xerces-c
    // Compiler
    // Fortran

    function changeFile(file) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                codeReader.text = py.call_sync("renderCode.format", [xhr.responseText, "cmake"])
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
}
