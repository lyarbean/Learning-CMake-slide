import QtQuick 2.3
import "../qml/theme"
FrontPage {
    id : front_page
    focus: true
    presenterName : "Bean Yan"
    slideSubject : "CMake, the easy way"
    MouseArea {
        anchors.fill: parent
        onClicked: {
            nextPage()
        }
    }
}
