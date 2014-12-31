import QtQuick 2.3
import "../qml"
import "../theme"

Slide {
    headline: "Agenda"
    focus: true
    ListView {
        focus: true
        anchors.fill: contentArea
        snapMode: ListView.SnapOneItem
        orientation: ListView.Vertical
        spacing: 12
        model: [2, 5, 9, 15, 19] // Pages.qml
        height: childrenRect.height
        delegate: Text {
            id : t
            text : (1 + index).toString() + ". " +  theModel.get(modelData).name
            MouseArea {
                hoverEnabled: true
                anchors.fill:  parent
                onClicked:  jumpToIndex(modelData)
            }
            font.pixelSize: normalFontSize
        }
    }
}
