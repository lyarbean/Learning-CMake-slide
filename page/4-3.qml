import QtQuick 2.2
import QtQuick.Controls 1.2
import io.thp.pyotherside 1.4

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
    Row {
        anchors.fill: contentArea
        spacing: contentArea.width * 0.05
        Column {
            spacing: contentArea.height * 0.05
            Repeater {
                model: ["Boost", "GTK2", "Lua", "wxWidgets", "Perl", "Python", "Protobuf"]
                Rectangle {
                    radius: contentArea.height * 0.02
                    height: contentArea.height * 0.1
                    width: contentArea.width * 0.25
                    color: Style.lighterRainBow[index % 7]
                    StyleText {
                        anchors.centerIn: parent
                        text: modelData
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            changeFile("assets/" + modelData + ".txt")
                        }
                    }
                }
            }
        }
        ScrollView {
            width: contentArea.width * 0.7
            height: contentArea.height
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
