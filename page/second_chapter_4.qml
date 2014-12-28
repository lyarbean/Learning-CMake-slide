import QtQuick 2.2
import "../qml"
import "../qml/theme"

Slide {
    headline: "DELETEME"
    subHeadline: "Here shows a list of sub chapters, click to follow"

    ListView {
        focus: true
        anchors.fill : parent.contentArea
        cacheBuffer: parent.width
        snapMode: ListView.SnapOneItem
        orientation: ListView.Vertical
        spacing: 12
        model: theModel
        ListModel {
            id : theModel
            ListElement {
                itemName : "Chapter 2.1"
                itemRef : "second_chapter_1.qml"
            }
            ListElement {
                itemName : "Chapter 2.2"
                itemRef : "second_chapter_2.qml"
            }
            ListElement {
                itemName : "Chapter 2.3"
                itemRef : "second_chapter_3.qml"
            }
            ListElement {
                itemName : "Chapter 2.4"
                itemRef : "second_chapter_4.qml"
            }
        }
        delegate: StyleText {
            id : t
            width: parent.width
            font.pointSize: 18
            text : (1 + index).toString() + ". " +  itemName

            MouseArea {
                hoverEnabled: true
                anchors.fill:  parent
                onClicked:  jumpTo(itemRef)
                onEntered: t.opacity = 0.5
                onExited:  t.opacity = 1
            }
        }
    }
}
