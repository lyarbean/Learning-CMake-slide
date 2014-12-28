pragma Singleton
import QtQuick 2.3
QtObject {
    property color dBlue: "#0f238c"
    property color mBlue: "#1c7ddb"
    property color lBlue: "#86cef4"

    property color dGray: "#545454"
    property color mGray: "#8e8e8e"
    property color lGray: "#bcbcbc"

    property color aGreen: "#34b233"
    property color aOrange: "#ff7f45"
    property color aYellow: "#fed100"
    property color aMagenta : "#ee008c"

    property real fontScale: 1.0
    property int tinyFontSize: 12 * fontScale
    property int smallFontSize: 16 * fontScale
    property int normalFontSize: 18 * fontScale
    property int largeFontSize: 24 * fontScale
    property int hugeFontSize: 32 * fontScale
}
