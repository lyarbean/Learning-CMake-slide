import QtQuick 2.2
import "../qml"
import "../qml/theme"


Slide {
    headline: "Build Systems"
    subHeadline: ""
    focus: true
    NestedList {
        spacing: 18
        model : theModel
        x: contentArea.x
        y: contentArea.y
        width: 500
        focus: true
        height: childrenRect.height
        itemColor: Style.mBlue
        itemFontFamily: "Arial"
        subItemColor: Style.mBlue
        subItemFontFamily: "Arial"
        snapMode: ListView.SnapToItem
    }
    Image {
        id: autotools
        x: contentArea.x  + 500
        y: contentArea.y
        fillMode: Image.PreserveAspectFit
        source: Qt.resolvedUrl("images/Autoconf-automake-process.svg.png")
        visible: false

    }
    ListModel {
        id : theModel
        ListElement {
            itemName : "PMake vs. GMake"
            collapsed : true
            subItems : [
                ListElement { itemName: "Just abandon PMake, it's in dust."},
                ListElement { itemName: "GMake is universal Make"},
                ListElement { itemName: "What about ninja"}
            ]
        }
        ListElement {
            itemName : "Plain Makefile"
            collapsed : true
            subItems :[
                ListElement { itemName: "Need I add words?"}
            ]
        }
        ListElement {
            itemName : "Autotools"
            collapsed : true
            subItems : [
                ListElement { itemName: "I know you know m4!"}
            ]
        }
        ListElement {
            itemName : "SCons"
            collapsed : true
            subItems : [
                ListElement { itemName: "A Python based domain specific language"},
                ListElement { itemName: "You build a software to build another software!"},
                ListElement { itemName: "Dependency resolution is painful!"},
                ListElement { itemName: "How to find a library? I mean, in easy way."}
            ]
        }
        ListElement {
            itemName : "..."
            collapsed : true
            subItems :[
                ListElement {
                    itemName : "http://www.scons.org/wiki/SconsVsOtherBuildTools"
                }
            ]
        }
        ListElement {
            itemName : "Then CMake?"
            collapsed : true
        }
    }
    MouseArea {
        anchors.fill: autotools
        drag.target: autotools
    }
    // TODO show Figure by triggering Key_1, Key_2 Key_3 ...
    Keys.onReleased: {
        console.log("oh yeah")
        if (event.key === Qt.Key_1) {
            autotools.visible = !autotools.visible
            event.accepted = true
        }
    }

}

