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
    ListView {
        id: items
        x: contentArea.x
        y: contentArea.y
        width: contentArea.width * 0.25
        height: contentArea.height
        model: ["Boost", "GTK2", "Lua", "wxWidgets", "Perl", "Python", "Protobuf", "Cairo", "SWIG", "Xerces-c"]
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
                    showCode("assets/" + modelData + ".txt")
                }
            }
        }

    }

    ScrollView {
        anchors {
            left: items.right
            leftMargin: 16
            top: items.top
        }

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

    function showCode(file) {
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
