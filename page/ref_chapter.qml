import QtQuick 2.2
import QtQuick.Controls 1.2
import "../qml"
import "../qml/theme"
Slide {
    headline: "References"
    Rectangle {
        anchors.fill: contentArea
        Column {
            spacing: 13
            StyleText {
                text: "http://www.elpauer.org/stuff/learning_cmake.pdf"
            }
            StyleText{
                width: contentArea.width
                text: "http://trilinos.org/oldsite/events/kitware_cmake_workshop_2009/presentations/SandiaTrilinosMay2009.pdf"

            }
            StyleText {
                text: "https://sitweb.oca.eu/IMG/pdf/slides.pdf"
            }
        }
    }
}
