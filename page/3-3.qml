import QtQuick 2.3

import "../qml"
Slide {
    headline: "CMake, the right way"
    subHeadline: "Features"

    property var  items: [
            "Just works wherever a modern c++ compiler lives",
            "Just works with millions LOC, e.g. KDE",
            "Just works with gmake, ninja, Xcode and VisualStudio",
            "Just works with many languages, e.g. C, C++, Object C/C++, Fortran, Ada, Java",
            "Just gives better denpendency resolution",
            "Just provides easy finders",
            "Just is a macro language with simple syntax and function support, and you are THE programmer!"
        ]

    MouseArea {
        anchors.fill: header
        onClicked:
        if (view.model.count < items.length) {
            view.model.append({"name": items[view.model.count]})
            view.incrementCurrentIndex()
        }
    }
    ListView {
        id: view
        anchors.fill: contentArea
        focus: true
        //height: contentArea.height * 0.8
        snapMode: ListView.SnapToItem
        model: ListModel {}
        spacing: contentArea.height * 0.01
        delegate: Rectangle {
            width: contentArea.width
            height: childrenRect.height + contentArea.width * 0.02
            radius: contentArea.width * 0.01
            color: Style.lighterRainBow[index % 7]
            StyleText {
                x: contentArea.width * 0.01
                y: contentArea.width * 0.01
                width: parent.width * 0.96
                text: name
                color: Style.rainBowForeGround[index % 7]
                font.pointSize: smallFontSize
            }
        }
        add: Transition {
            NumberAnimation { properties: "x,y"; from: 200; duration: 200 }
        }

    }
}
