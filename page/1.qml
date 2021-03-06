import QtQuick 2.3
import "../qml"

Slide {
    headline: "Agenda"
    focus: true
    property var pages: [2, 5, 9, 13, 17]
    MouseArea {
        anchors.fill: header
        onClicked:
        if (view.model.count === 0) {
            for (var i in pages) {
                view.model.append(theModel.get(pages[i]))
            }
        }
    }

    ListView {
        id: view
        focus: true
        anchors.fill: contentArea
        snapMode: ListView.SnapToItem
        orientation: ListView.Vertical
        spacing: 12
        height: childrenRect.height
        model: ListModel{}
        delegate: Rectangle {
            width: contentArea.width * 0.8
            height: contentArea.height * 0.1
            radius: 4
            color: Style.lighterRainBow[index % 7]
            StyleText {
                anchors.verticalCenter: parent.verticalCenter
                x: contentArea.width * 0.05
                id : t
                text : name; // theModel.get(modelData).name
                color: Style.rainBowForeGround[index % 7]
                MouseArea {
                    hoverEnabled: true
                    anchors.fill:  parent
                    onClicked:  jumpToIndex(pages[index])
                }
            }
        }
        add: Transition {
            NumberAnimation { properties: "x,y"; from: 200; duration: 200 }
        }
    }
}
