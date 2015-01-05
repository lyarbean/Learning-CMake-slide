import QtQuick 2.2
import io.thp.pyotherside 1.4

import "../qml"
Slide {
    headline: "CMake, from A to Z"
    subHeadline: "Hello CMake"
    TextEdit {
        id: textEdit
        anchors.fill: contentArea
        activeFocusOnPress: false
        selectByMouse: true
        readOnly: true
        selectedTextColor: "indigo"
        selectionColor: "#eee"
        textFormat: Text.RichText
        font.pointSize: smallFontSize
    }
    Component.onCompleted: {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                textEdit.text = py.call_sync("renderCode.format", [xhr.responseText, "cmake"])
            }
        }
        xhr.open("GET", Qt.resolvedUrl("assets/hellocmake.txt"))
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
