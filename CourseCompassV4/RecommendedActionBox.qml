import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Rectangle { // = rab
    id: recommendedActionBox
    width: (parent.width / 3) - 54
    height: 296
    color: "#ECECEC"
    radius: 32

    Column {
        anchors.fill: parent
        spacing: 10

        Text { //cb = course box
            id: cbHeader
            x: 40
            y: 24
            width: 300
            height: 48
            text: qsTr("Recommended Actions")
            font.pixelSize: 32
            font.bold: true
        }

        Rectangle { // Container for the list
            color: "#ECECEC"
            height: 150
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
