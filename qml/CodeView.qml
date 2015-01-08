import QtQuick 2.2
import QtQuick.Controls 1.2

ScrollView {
    property string resolvedUrl: ""
    property string lexer: "cmake"
    highlightOnFocus: true
    focus: true
    Column {
        id: resizer
        Text {
            font.pointSize: hugeFontSize
            text: "+"
            MouseArea {
                anchors.fill: parent
                onClicked: codeText.font.pointSize *= 1.25
            }
        }
        Text {
            font.pointSize: hugeFontSize
            text: "-"
            MouseArea {
                anchors.fill: parent
                onClicked: codeText.font.pointSize *= 0.8
            }
        }
    }
    TextEdit {
        id: codeText
        x: resizer.width
        activeFocusOnPress: false
        selectByMouse: true
        readOnly: true
        selectedTextColor: "black"
        selectionColor: "#eee"
        textFormat: Text.RichText
        font.pointSize: smallFontSize
        onSelectedTextChanged: {
            if (selectedText !== "") {
                for (var n in notes) { // external notes
                    if (n === selectedText) {
                        noteEdit.visible = true
                        noteEdit.text = selectedText + "\n" + notes[n] 
                    } 
                }
            }
        }
    }
    onResolvedUrlChanged: {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                codeText.text = py.call_sync("renderCode.format", [xhr.responseText, lexer])
            }
        }
        xhr.open("GET", Qt.resolvedUrl(resolvedUrl))
        xhr.send();
    }
}
