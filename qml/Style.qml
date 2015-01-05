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

    property variant rainBow : ["red", "orange", "yellow", "green", "blue", "indigo", "violet"]
    property variant lighterRainBow : [Qt.lighter("red", 1.2), Qt.lighter("orange", 1.2), Qt.lighter("yellow", 1.2),
    Qt.lighter("green", 1.2), Qt.lighter("blue", 1.2), Qt.lighter("indigo", 1.2), Qt.lighter("violet", 1.2)]
    property variant darkerRainBow : [Qt.darker("red"), Qt.darker("orange"), Qt.darker("yellow"),
    Qt.darker("green"), Qt.darker("blue"), Qt.darker("indigo"), Qt.darker("violet")]

     property variant rainBowForeGround: ["black", "black", "black", "white", "white", "white", "black"]
}
