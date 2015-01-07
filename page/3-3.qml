import QtQuick 2.3

import "../qml"
Slide {
    headline: "CMake, the right way"
    subHeadline: "Features"

    property var  items: [
            "Only requires a modern C++ compiler",
            "Can manage millions lines of code, e.g. KDE",
            "Can output for gmake, ninja, Xcode and VisualStudio",
            "Work with many languages, e.g. C, C++, Object C/C++, Fortran, Ada, Java",
            "Gives better denpendency resolution",
            "Makes configure step more easier",
            "Being a language, makes you a programmer!"
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
