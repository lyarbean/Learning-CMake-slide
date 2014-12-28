import QtQuick 2.3
import "."

Rectangle {
    width: 960
    height: 540
    color : 'white'
    antialiasing: true
    smooth: true

    Item {
        id : contentBody
        x : 45
        y : 85
        width : 960 - 155
        height : 540 - 90
        opacity: 0
    }
    Text {
        anchors.centerIn: contentBody
        font.pointSize: 48
        text: "Thank you!"
        style: Text.Raised
        styleColor: "red"
        color : "green"
        opacity: 1
        z : 1
    }
}
