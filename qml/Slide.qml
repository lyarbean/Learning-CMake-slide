import QtQuick 2.3
import "../theme"

Rectangle {
    color : 'white'
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
