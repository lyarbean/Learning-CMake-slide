import QtQuick 2.2
import QtQuick.Controls 1.2

ScrollView {
    property string resolvedUrl: ""
    property string lexer: "cmake"
    highlightOnFocus: true
    TextEdit {
        id: codeText
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
