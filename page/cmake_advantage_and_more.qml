import QtQuick 2.2
import "../qml"
import "../qml/theme"

Slide {
    headline: "CMake, the right tool"

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
                itemName : "No more requirement, but a C++ compiler!"   // Easy deploy
                itemNote : "Lives everywhere"
            }
            ListElement {
                itemName : "Multi-target support"
                itemNote : "Make, XCode, VisualStudio, ninja"
            }
            ListElement {
                itemName : "Simple Syntax"           // Quick scripting
                itemNote : "Quick scripting"
            }
            ListElement {
                itemName : "Modularized"              // Code Orgnization
                itemNote : "Code Orgnization"
            }
            ListElement {
                itemName : "Extendable"               // TODO function
                itemNote : "Customized function support"
            }
        }
        delegate: StyleText {
            id : t
            width: parent.width
            font.pointSize: 18
            text : itemName

            MouseArea {
                hoverEnabled: true
                anchors.fill:  parent
                onEntered: {
                    t.text = itemName + "\n" + itemNote  // TODO use a external box!!!!
                    t.opacity = 0.8
                }
                onExited: {
                    t.opacity = 1
                    t.text = itemName
                }
            }
        }
    }
}
