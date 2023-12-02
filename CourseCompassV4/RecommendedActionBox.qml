import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Rectangle { // = rab
    id: recommendedActionBox
    width: (parent.width / 3) - 54
    height: parent.height - 40
    color: "#ECECEC"
    radius: 32

    Text {
        id: rabHeader
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 30
        text: qsTr("Recommended Action")
        font.pixelSize: 32
        font.bold: true
    }

    Column {
        width: parent.width
        height: parent.height
        anchors.top: parent.top
        anchors.topMargin: 80
        spacing: 10

        Rectangle { // Container for the list
            color: "#ECECEC"
            height: parent.height - rabHeader.height - 50 // Header margin * 2 plus 10 extra space units
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.9
            radius: 32

            ListModel {
                id: courseListModel
                // Add 10 made-up items
                ListElement { courseColor: "#bfc9ff"; courseCode: "CS101"; item: "Test1" }
                ListElement { courseColor: "#E3BFFF"; courseCode: "MATH201"; item: "Assignment 1" }
                ListElement { courseColor: "#FFDEBF"; courseCode: "PHY301"; item: "Exam" }
                // ... Add more ListElements to make it 10 items in total
            }

            ListView {
                anchors.fill: parent
                model: courseListModel
                clip: true
                spacing: 5

                delegate: Rectangle {
                    height: 50
                    width: parent.width
                    color: "white"
                    radius: 10

                    // Color circle
                    Rectangle {
                        id: courseColorField
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        width: 30
                        height: 30
                        radius: 180
                        color: model.courseColor
                    }

                    // Display course name
                    Text {
                        id: courseCodeField
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: courseColorField.right
                        width: parent.width / 5 // 1/5th of the width
                        text: model.courseCode
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignHCenter
                    }

                    // Display item name
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: courseCodeField.right
                        width: parent.width * 3 / 5 // 3/5ths of the width
                        text: model.item
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
            }
        }
    }
}
