import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: courseBox
    width: (parent.width / 3) - 54
    height: parent.height - 40
    color: "#ECECEC"
    radius: 32

    function generateRandomColor() {
        // Generate random RGB values for the color
        var red = Math.random() * 255;
        var green = Math.random() * 255;
        var blue = Math.random() * 255;
        // Construct and return the color string in "#RRGGBB" format
        return "#" + Math.floor(red).toString(16) + Math.floor(green).toString(16) + Math.floor(blue).toString(16);
    }

    Text { //cb = course box
        id: cbHeader
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 30
        text: qsTr("Current Courses")
        font.pixelSize: 32
        font.bold: true
    }

    Button {
        id: cbNewCourseButton
        anchors.right: parent.right
        anchors.rightMargin: 24
        anchors.top: parent.top
        anchors.topMargin: 24
        width: 32
        height: 32
        text: qsTr("+")
        spacing: 0
        flat: true
        font.pointSize: 24
        font.bold: true
        onClicked: {
            courseListModel.append({ "courseCode": "Code", "courseName": "Name", "courseColor": generateRandomColor()});
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

                // Wrapper for the colour 'button'. Doing it like this prevents click and hover effects
                Rectangle {
                    id: courseColorCircle
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    width: 30
                    height: 30
                    radius: 180
                    color: courseColor

                    // The actual clickable part
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            courseListModel.setProperty(index, "courseColor", generateRandomColor())
                        }
                    }
                }

                // Editable TextField for course code
                TextField {
                    id: courseCodeField
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: courseColorCircle.right
                    anchors.leftMargin: 20
                    width: (parent.width - courseColorCircle.width) / 3 // Adjust width as needed
                    placeholderText: "Enter course code"
                    text: courseCode // Bind to the model data
                    font.bold: true
                    font.pixelSize: 16
                    onTextChanged: {
                        // Update the model data when the text changes
                        courseListModel.setProperty(index, "courseCode", courseCodeField.text)
                    }
                }

                // Editable TextField for course name
                TextField {
                    id: courseNameField
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.topMargin: 10
                    anchors.left: courseCodeField.right
                    anchors.leftMargin: 20
                    width: parent.width - courseCodeField.width - courseColorCircle.width - 100 // Adjust width as needed
                    placeholderText: "Enter course name"
                    text: courseName // Bind to the model data
                    font.pixelSize: 14
                    onTextChanged: {
                       // Update the model data when the text changes
                       courseListModel.setProperty(index, "courseName", courseNameField.text)
                    }
                }

                Rectangle {
                    id: courseDeleteButton
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    anchors.top: parent.top
                    anchors.topMargin: 5
                    width: 30
                    height: 30

                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                        text: qsTr("x")
                        font.pointSize: 20
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (courseListModel.count > 0) {
                                courseListModel.remove(index)
                            }
                        }
                    }
                }
            }
        }
    }
}
