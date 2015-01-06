import QtQuick 2.2
import QtWebKit 3.0
import "../qml"
import "../theme"
Slide {
    headline: "Port to CMake"
    subHeadline: "Root Project"

    // Issues and solutions
    // Show the file
    // add sidenote
    // There are many customized variables
    // set(xxx ...)
    // There are many definitions
    // There is a buggy definition
    // There is somewhat circle dependencies in sub.mk . But, they static library, not actual (hard) dependencies. Just
    // drop them on compile stage, final link will resolve them.
}
