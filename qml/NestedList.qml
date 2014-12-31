import QtQuick 2.0

ListView {
    property real fontSize : normalFontSize
    property real subFonSize: smallFontSize
    property Component  subDelegate: secondDelegate
    property string itemFontFamily : "monospace"
    property string subItemFontFamily : "monospace"
    property color bulletColor: "steelblue"
    property color itemColor: "black"
    property color subItemColor: "gray"
    id: nl
    //cacheBuffer: parent.width
    snapMode: ListView.SnapOneItem
    orientation: ListView.Vertical
    delegate: firstDelegate

    Component {
        id: firstDelegate
        Column {
            focus: true
            Text {
                id: firstDelegateText
                focus: true
                text: itemName
                color: itemColor
                font.family: itemFontFamily
                font.pixelSize: fontSize
                font.bold: true
                MouseArea {
                    hoverEnabled: true
                    anchors.fill:  parent
                    onClicked:  nl.model.setProperty(index, "collapsed", !collapsed)
                    onEntered:  firstDelegateText.text = itemName + (collapsed ? "  +" : "  -")
                    onExited: firstDelegateText.text = itemName
                }

            }

            spacing: fontSize
            Loader {
                id:  subitemloader
                focus: true
                visible: !collapsed
                property variant subItemModel: subItems
                sourceComponent:  nl.model.collapsed ? null : subDelegate
                onStatusChanged: if (status == Loader.Ready) item.model = subItemModel
            }
        }

    }

    Component {
        id: secondDelegate
        Column {
            property alias model: subItemRepeater.model
            width: nl.width - subFonSize * 4
            spacing: subFonSize
            Repeater {
                id: subItemRepeater
                delegate: Row {
                    focus: true
                    spacing: subFonSize
                    width: nl.width - subFonSize * 5
                    Text {
                        color: bulletColor;
                        font.pixelSize: subFonSize;
                        text: "\u2022"
                    }
                    Text {
                        id: secondDelegateText
                        width: nl.width
                        font.family: subItemFontFamily
                        font.pixelSize: subFonSize
                        text: itemName
                        color: subItemColor
                        MouseArea {
                            hoverEnabled: true
                            anchors.fill: secondDelegateText
                            onEntered: {secondDelegateText.color = "limegreen" }
                            onExited:  {secondDelegateText.color = subItemColor }
                        }
                    }
                }
            }
        }
    }
}
