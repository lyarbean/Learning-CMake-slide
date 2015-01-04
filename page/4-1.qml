import QtQuick 2.2
import QtWebKit 3.0
import "../qml"
Slide {
    headline: "CMake, from A to Z"
    subHeadline: "Hello CMake"
    StyleText {
        anchors.fill: contentArea
        text:"// wxPython-src-2.8.12.1/samples/keyboard
project(Keyboard)
cmake_minimum_required(VERSION 3.0)
set(KEYBOARD_SRC keyboard.cpp)
find_package(wxWidgets REQUIRED core base)
include(${wxWidgets_USE_FILE})
add_executable(keyboard ${KEYBOARD_SRC})
target_link_libraries(keyboard ${wxWidgets_LIBRARIES})
        "
    
    }
    // TODO add_library? file?
}
