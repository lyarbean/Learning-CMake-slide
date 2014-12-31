import QtQuick 2.0
import "../qml"
import "../theme"

Slide {
    headline: "References"
    Rectangle {
        anchors.fill: contentArea
        Column {
            spacing: normalFontSize
            Text {
                text: "http://www.elpauer.org/stuff/learning_cmake.pdf"
            }
            Text{

                text: "http://trilinos.org/oldsite/events/kitware_cmake_workshop_2009/presentations/SandiaTrilinosMay2009.pdf"

            }
            Text {
                text: "https://sitweb.oca.eu/IMG/pdf/slides.pdf"
            }
        }
    }
}
