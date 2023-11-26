import QtQuick 2.15
import QtQuick.Controls 2.15


Rectangle {
    id: course1
    x: 0
    width: 376
    height: 44
    color: "#e9e9e9"
    radius: 8

    Row {
        id: row1
        y: 0
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 0
        spacing: 24
        leftPadding: 24
        topPadding: 12

        Rectangle {
            id: rectangle5
            width: 24
            height: 24
            color: "#ffbfbf"
            radius: 12
        }

        Text {
            id: text2
            text: qsTr("Geometry")
            font.pixelSize: 15
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.bold: true
        }

        Text {
            id: text3
            text: qsTr("This is the full course title")
            font.pixelSize: 15
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.bold: false
        }
    }
}
