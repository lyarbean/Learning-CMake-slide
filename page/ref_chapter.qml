import QtQuick 2.0
import "../qml"

Slide {
    headline: "References"
    Column {
        anchors.fill: contentArea
        spacing: normalFontSize
        StyleText {
            text: "http://www.elpauer.org/stuff/learning_cmake.pdf"
        }
        StyleText{
            text: "http://trilinos.org/oldsite/events/kitware_cmake_workshop_2009/presentations/SandiaTrilinosMay2009.pdf"
        }
        StyleText {
            text: "https://sitweb.oca.eu/IMG/pdf/slides.pdf"
        }
    }
}
