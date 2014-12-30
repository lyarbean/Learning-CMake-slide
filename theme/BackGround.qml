import QtQuick 2.3
import "."
Item {
    Column {
        x : theWindow.width - 90 * widthScale
        y : 50 * heightScale
        width : 75 * widthScale
        spacing : 4
        StyleText {
            id : slide_page
            width : parent.width
            text : "Slide " + currentIndex
            font.pointSize: 7 * fontScale
            color : Style.dBlue
            horizontalAlignment: Text.AlignRight
        }
        StyleText {
            width : parent.width
            text :  Qt.formatDate(new Date())
            font.pointSize: 7 * fontScale
            color : Style.dBlue
            horizontalAlignment: Text.AlignRight
        }
    }
}
