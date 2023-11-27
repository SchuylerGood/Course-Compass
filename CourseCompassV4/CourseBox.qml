import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: courseBox
    y: 0
    width: 456
    height: 296
    color: "#ECECEC"
    radius: 32

    Text { //cb = course box
        id: cbHeader
        x: 40
        y: 24
        width: 291
        height: 45
        text: qsTr("Current Courses")
        font.pixelSize: 32
        font.bold: true
    }

    Button {
        id: cbNewCourseButton
        x: 398
        y: 31
        width: 32
        height: 32
        text: qsTr("+")
        spacing: 0
        flat: true
        font.pointSize: 24
        font.bold: true
        onClicked: {
            // Call populateListModel with your data
            courseBox.populateListModel([
                ["CISC 101", "Introduction to Computer Science", "blue"],
                ["CISC 124", "Introduction to Computer Science II", "red"],
                ["CISC 235", "Data Structures", "green"],
                // Add more tuples as needed
            ]);
        }
    }

    Rectangle { // List container
        anchors.top: cbHeader.bottom
        anchors.topMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
        color: "#ECECEC"

        ListModel {
            id: courseListModel
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

                Rectangle {
                   id: courseColorCircle
                   anchors.verticalCenter: parent.verticalCenter
                   anchors.left: parent.left
                   anchors.leftMargin: 10
                   width: 30
                   height: 30
                   radius: 180
                   color: courseColor
                }

                Text {
                    id: courseCodeText
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: courseColorCircle.right
                    anchors.leftMargin: 20
                    text: courseCode
                    font.bold: true
                    font.pixelSize: 16
                }

                Text {
                    id: courseNameText
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.topMargin: 10
                    anchors.left: courseCodeText.right
                    anchors.leftMargin: 20
                    text: courseName
                    font.pixelSize: 14
                }
            }
        }
    }

    function populateListModel(courseArray) {
        for (var i = 0; i < courseArray.length; ++i) {
            var course = courseArray[i];
            courseListModel.append({ "courseCode": course[0], "courseName": course[1], "courseColor": course[2]});
        }
    }
}


