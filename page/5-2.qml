import QtQuick 2.2
import QtQuick.Controls 1.2
import io.thp.pyotherside 1.4

import "../qml"
Slide {
    headline: "Not Just Make"
    subHeadline: "CPack"
    CodeView {
        anchors.fill: contentArea
        resolvedUrl: Qt.resolvedUrl("assets/cpack.txt")
    }
}
