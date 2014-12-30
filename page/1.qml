import QtQuick 2.3
import "../qml"
import "../theme"

Slide {
    headline: "Agenda"
    focus: true
    ListView {
        focus: true
        x: contentArea.x
        y: contentArea.y
        
        snapMode: ListView.SnapOneItem
        orientation: ListView.Vertical
        spacing: 12
        model: [2, 5, 9, 15, 19] // Pages.qml
        width: 500 * widthScale
        height: childrenRect.height
        delegate: StyleText {
            id : t
            text : (1 + index).toString() + ". " +  theModel.get(modelData).name
            MouseArea {
                hoverEnabled: true
                anchors.fill:  parent
                onClicked:  jumpToIndex(modelData)
            }
            Component.onCompleted: {
                t.font.pointSize = normalFontSize
            }
        }
    }
}
