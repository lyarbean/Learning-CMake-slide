import QtQuick 2.2
import QtQuick.Controls 1.2
import io.thp.pyotherside 1.4

import "../qml"
Slide {
    headline: "Beyond Make"
    subHeadline: "CPack"
    
    ScrollView {
        anchors.fill: contentArea
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
    Component.onCompleted: {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                codeReader.text = py.call_sync("renderCode.format", [xhr.responseText, "cmake"])
            }
        }
        xhr.open("GET", Qt.resolvedUrl("assets/cpack.txt"))
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
