import QtQuick 2.3
import "theme"
Rectangle {
    // change width/height to meet your need
    width: 960
    height: 540
    color : 'white'
    antialiasing: true
    smooth: true
    property string headline : ""
    property string subHeadline : ""
    property alias contentArea: contentArea
    property alias footer: footer

    BackGround {
        id: backGround
    }

    Header {
        id: header
    }

    ContentArea {
        id: contentArea
    }

    Footer {
        id: footer
    }



}
