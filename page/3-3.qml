import QtQuick 2.2
import "../qml"
import "../theme"

Slide {
    headline: "CMake, the right way"
    subHeadline: "Features"
    ListView {
        x: contentArea.x
        y: contentArea.y
        focus: true
        height: contentArea.height * 0.8
        snapMode: ListView.SnapToItem
        model: [
            "Just works wherever a modern c++ compiler lives",
            "Just works with millions LOC, e.g. KDE",
            "Just works with gmake, ninja, Xcode and VisualStudio",
            "Just works with many languages, e.g. C, C++, Object C/C++, Fortran, Ada, Java",
            "Just gives better denpendency resolution",
            "Just provides easy finders",
            "Just is a macro languages with simple syntax and function support, and you are programmer!",
        ]
        spacing: contentArea.height * 0.01
        delegate: Rectangle {
            height: childrenRect.height * 1.2
            width: contentArea.width
            radius: childrenRect.height * 0.08
            color: ["orange", "purple", "steelblue", "darkgreen"][index % 4]
            Text {
                x: height * 0.1
                y: height * 0.1
                width: contentArea.width
                color: "white"
                font.pixelSize: smallFontSize
                wrapMode: Text.WordWrap
                text: modelData
            }
        }

    }
}
