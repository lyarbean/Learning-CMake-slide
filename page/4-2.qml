import QtQuick 2.2
import QtWebKit 3.0
import "../qml"
import "../theme"
Slide {
    headline: "CMake, from A to Z"
    subHeadline: "Flags and Definitions"
    StyleText {
        anchors.fill: contentArea
        text:'add_definitions("-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_LINUX_GUI_")
set(CMAKE_C_FLAGS "-pipe -O2")
set(CMAKE_CXX_FLAGS "-pipe -O3")
set(CMAKE_FORTRAN_FLAGS "${CMAKE_C_FLAGS} -mtune=native -mavx")
set(CMAKE_LINK_LIBRARY_FLAG "--unresolved-symbols=report-all")
'
    }

}
