import QtQuick 2.3
import "../qml"
import "../qml/theme"

Slide {
    headline: "Agenda"
// TODO Get chapter indices from parent
    ListView {
        focus: true
        antialiasing: true
        anchors.fill : contentArea
        snapMode: ListView.SnapOneItem
        orientation: ListView.Vertical
        spacing: 12
        model: theModel
        ListModel {
            id : theModel
            ListElement {
                itemName : "Build systems"
                itemIndex : 2
            }
            ListElement {
                itemName : "CMake and its family"
                itemIndex : 3
            }
            ListElement {
                itemName : "CMake Projects"
                itemIndex : 4
            }
            ListElement {
                itemName : "Bye"
                itemIndex : 11
            }

        }
        delegate: StyleText {
            id : t
            width: parent.width
            text : (1 + index).toString() + ". " +  itemName
            MouseArea {
                hoverEnabled: true
                anchors.fill:  parent
                onClicked:  jumpToIndex(itemIndex)
            }
        }
    }
}
