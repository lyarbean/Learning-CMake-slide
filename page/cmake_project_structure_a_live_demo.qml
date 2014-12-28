import QtQuick 2.4
import QtQuick.Controls 1.2
// import QtQuick.Controls.Styles 1.3

import "../qml"
import "../qml/theme"

Slide {
    headline: "CMake Project Structure"
    subHeadline: "A live Demo"
    focus: true
    // TODO add milliuno.cpp milliuno.h
    function setText(ref) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            console.log("Reading...")
            if (xhr.readyState === XMLHttpRequest.DONE) {
                codeReader.text = xhr.responseText
                console.log("Read done")
            }
        }
        xhr.open("GET", Qt.resolvedUrl(ref))
        xhr.send();
    }

    ScrollView {
        id: codeReader
        x: contentArea.x + 300
        y: contentArea.y
        visible: false
        highlightOnFocus: true
        frameVisible: true
        property string text
        height: 400
        width: 500
        Text {
            x: 5
            y: 5
            textFormat: Text.RichText
            text: codeReader.text

        }
    }


    StyleText {
        x: contentArea.x
        y: contentArea.y
        text: "CMakeLists.txt"
        MouseArea {
            anchors.fill: parent
            drag.target: parent
        }
    }

    StyleText {
        x: contentArea.x + 0
        y: contentArea.y + 100
        text: "milliuno.h"
        MouseArea {
            anchors.fill: parent
            drag.target: parent
        }
    }

    StyleText {
        x: contentArea.x + 0
        y: contentArea.y + 200
        text: "milliuno.cpp"
        MouseArea {
            anchors.fill: parent
            drag.target: parent
        }
    }

    Keys.onReleased: {
        console.log("xxxx")
        if (event.key === Qt.Key_0) {
            codeReader.visible = true
            setText("assets/CMakeLists.html")
            event.accepted = true
        } else if (event.key === Qt.Key_1) {
            setText("assets/milliuno.h.html")
            codeReader.visible = true
            event.accepted = true
        } else if (event.key === Qt.Key_2) {
            setText("assets/milliuno.cpp.html")
            codeReader.visible = true
            event.accepted = true
        }
    }
}


