import QtQuick 2.2
import QtWebKit 3.0
import "../qml"
Slide {
    headline: "Not Just Make"
    subHeadline: "Dependency Graph"
    Keys.onReleased: {
        if (event.key === Qt.Key_Minus) {
            im.scale = im.scale * 0.8
            event.accepted = true
        } else if (event.key === Qt.Key_Equal) {
            im.scale = im.scale * 1.25
            event.accepted = true
        } else if (event.key === Qt.Key_Comma) {
            im2.scale = im2.scale * 0.8
            event.accepted = true
        } else if (event.key === Qt.Key_Period) {
            im2.scale = im2.scale * 1.25
            event.accepted = true
        }
    }
    Column {
        anchors.fill: contentArea
        Image {
            id: im
            focus: true
            width: contentArea.width
            fillMode: Image.PreserveAspectFit
            source: Qt.resolvedUrl("images/port/dependency.png")
            MouseArea {
                anchors.fill: parent
                drag.target: parent
            }
        }
        Image {
            id: im2
            focus: true
            width: contentArea.width
            fillMode: Image.PreserveAspectFit
            source: Qt.resolvedUrl("images/port/dependency2.png")
            MouseArea {
                anchors.fill: parent
                drag.target: parent
            }
        }
//  StyleText {
//      MouseArea {
//          anchors.fill: parent
//          drag.target: parent
//      }
//      font.pointSize: smallFontSize
//      text:"
//      GUI/bindings/luabind/CMakeLists.txt
//      GUI/bindings/CMakeLists.txt
//      GUI/libCommonGui/CMakeLists.txt
//      GUI/libCommonUtil/CMakeLists.txt
//      GUI/libWxCommonUtil/CMakeLists.txt
//      SQL/ODBCPP/CMakeLists.txt
//      SQL/CMakeLists.txt
//      SQL/sql_defect/CMakeLists.txt
//      SQL/sql_design/CMakeLists.txt
//      SQL/sql_helpers/CMakeLists.txt
//      SQL/sql_job/CMakeLists.txt
//      SQL/sql_schema/CMakeLists.txt
//      SQL/sql_system/CMakeLists.txt
//      SQL/sql_xml_schema/CMakeLists.txt
//      third_party/linux/breakpad/src/testing/CMakeLists.txt
//      third_party/linux/breakpad/src/testing/gtest/CMakeLists.txt
//      third_party/linux/breakpad/src/third_party/protobuf/protobuf/gtest/CMakeLists.txt
//      util/CMakeLists.txt
//      verify/CMakeLists.txt
//      CMakeLists.txt"
//  }
    }
}
