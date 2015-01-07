import QtQuick 2.2
import QtQuick.Controls 1.2

ScrollView {
    property string resolvedUrl: ""
    highlightOnFocus: true
    TextEdit {
        id: codeText   
        activeFocusOnPress: false
        selectByMouse: true
        readOnly: true
        selectedTextColor: "orange"
        selectionColor: "#bbb"
        textFormat: Text.RichText
        font.pointSize: tinyFontSize
    }
    onResolvedUrlChanged: {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                codeText.text = xhr.responseText
            }
        }
        xhr.open("GET", Qt.resolvedUrl(resolvedUrl))
        xhr.send();
    }
}
