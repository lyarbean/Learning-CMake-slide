import QtQuick 2.0
import "."
ListModel {
    ListElement {
        name: "CMake, the easy way"
        ref: "page/front_page.qml"
    }
    ListElement {
        name: "Agenda"
        ref: "page/1.qml"
    }
    // --
    ListElement {
        name: "Build Systems"
        ref: "page/2.qml"
    }
    ListElement {
        name: "Make Tools and Make Generators"
        ref: "page/2-1.qml"
    }
    ListElement {
        name: "Autotools process vs. CMake Process"
        ref: "page/2-2.qml"
    }
    // --
    ListElement {
        name: "CMake, the right way"
        ref: "page/3.qml"
    }
    ListElement {
        name: "Fame"
        ref: "page/3-1.qml"
    }
    ListElement {
        name: "Family"
        ref: "page/3-2.qml"
    }
    ListElement {
        name: "Features"
        ref: "page/3-3.qml"
    }
    // --
    ListElement {
        name: "CMake, from A to Z"
        ref: "page/4.qml"
    }
    ListElement {
        name: "Hello CMake"
        ref: "page/4-1.qml"
    }
    ListElement {
        name: "Flags and Definitions"
        ref: "page/4-2.qml"
    }
    ListElement {
        name: "Finder"
        ref: "page/4-3.qml"
    }
    ListElement {
        name: "Modularized Source Code Layout"
        ref: "page/4-4.qml"
    }
    ListElement {
        name: "Miscellaneous"
        ref: "page/4-5.qml"
    }
    // --
    ListElement {
        name: "Beyond Make"
        ref: "page/5.qml"
    }
    ListElement {
        name: "CTest"
        ref: "page/5-1.qml"
    }
    ListElement {
        name: "Dependency Graph"
        ref: "page/5-2.qml"
    }
    ListElement {
        name: "Doxygen"
        ref: "page/5-3.qml"
    }
    ListElement {
        name: "Port to CMake"
        ref: "page/6.qml"
    }
    ListElement {
        name: "The Root Project"
        ref: "page/6-1.qml"
    }
    ListElement {
        name: "What to do"  // Findxxx.cmake
        ref: "page/6-2.qml"
    }

    ListElement {
        name:  "Reference"
        ref: "page/ref_chapter.qml"
    }
    ListElement {
        name: "Thanks!"
        ref: "page/back_page.qml"
    }
}
