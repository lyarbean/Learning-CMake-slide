import QtQuick 2.2
import "../qml"
import "../qml/theme"

Slide {
    headline: "CMake and its family"
    subHeadline: "The Kitware build and test chain"
    NestedList {
        spacing: 18
        model : theModel
        anchors.fill: contentArea
        width: contentArea.width
        itemColor: Style.mBlue
        itemFontFamily: "Arial"
        subItemColor: Style.mBlue
        subItemFontFamily: "Arial"

    }

    ListModel {
        id : theModel
        ListElement {
            itemName : "CTest"
            collapsed : true
            subItems : [
                ListElement { itemName: "Run your tests"}
            ]
        }
        ListElement {
            itemName : "CPack"
            collapsed : true
            subItems :[
                ListElement { itemName: "Pack binaries into product"}
            ]
        }
        ListElement {
            itemName : "CDash"
            collapsed : true
            subItems :[
                ListElement { itemName: "The Dashboard"}
            ]
        }
        ListElement {
            itemName : "CMake"
            collapsed : true
            subItems :[
                ListElement { itemName: "The universal build system"},
                ListElement { itemName: "Very fast"},
                ListElement { itemName: "And more"}

            ]
        }
    }
}
