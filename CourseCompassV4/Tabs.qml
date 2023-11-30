import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Row {
    id: courseTabs
    width: 1000
    height: 32
    leftPadding: 32
    spacing: 8

    //This is the first tab
    Button {
        id: allTab
        y: 0
        width: 64
        height: 32
        text: qsTr("ALL")
        background: Rectangle {
            color: "#d8d8d8"
            radius: 2
            border.color: "transparent"
            anchors.fill: parent
        }
    }

    Button {
        id: courseTab1
        y: 0
        width: 96
        height: 32
        text: qsTr("COURSE 1")
        background: Rectangle {
            color: "#FFBFBF"
            radius: 2
            border.color: "transparent"
            anchors.fill: parent
        }
    }

    Button {
        id: courseTab2
        y: 0
        width: 96
        height: 32
        text: qsTr("COURSE 2")
        background: Rectangle {
            color: "#bfc9ff"
            radius: 2
            border.color: "transparent"
            anchors.fill: parent
        }
    }

    Button {
        id: courseTab3
        y: 0
        width: 96
        height: 32
        text: qsTr("COURSE 3")
        background: Rectangle {
            color: "#E3BFFF"
            radius: 2
            border.color: "transparent"
            anchors.fill: parent
        }
    }

    Button {
        id: courseTab4
        y: 0
        width: 96
        height: 32
        text: qsTr("COURSE 4")
        background: Rectangle {
            color: "#FFDEBF"
            radius: 2
            border.color: "transparent"
            anchors.fill: parent
        }
    }
}
