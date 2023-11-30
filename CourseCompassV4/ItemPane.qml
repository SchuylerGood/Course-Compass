import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: itemsPaneHolder
    width: parent.width
    height: parent.height / 2.15
    color: "#00ffffff"
    radius: 0
    transformOrigin: Item.Center
    anchors.left: parent.left
    anchors.right: parent. right
    anchors.leftMargin: 48
    anchors.rightMargin: 48

    Column {
        id: itemsPaneWrapper
        width: parent.width
        height: parent.height
        anchors.left: parent.left
        anchors.right: parent.right

        Tabs {}

        Rectangle {
            id: itemsPane
            width: parent.width
            height: parent.height
            color: "#ffffff"
            radius: 32
            border.color: "#d9d9d9"
            border.width: 2

            Grid {
                id: columnLabelGrid
                x: 0
                y: 0
                width: 2000
                height: 672
                rows: 1
                columns: 8

                Rectangle {
                    id: course
                    width: 112
                    height: 40
                    color: "#ffffff"
                    border.color: "#d9d9d9"
                    border.width: 2

                    Text {
                        id: label
                        x: 37
                        y: 12
                        text: qsTr("Course")
                        font.pixelSize: 12
                        font.bold: true
                    }
                }

                Rectangle {
                    id: status
                    width: 112
                    height: 40
                    color: "#ffffff"
                    border.color: "#d9d9d9"
                    border.width: 2

                    Text {
                        id: label1
                        x: 37
                        y: 12
                        text: qsTr("Status")
                        font.pixelSize: 12
                        font.bold: true
                    }
                }

                Rectangle {
                    id: type
                    width: 112
                    height: 40
                    color: "#ffffff"
                    border.color: "#d9d9d9"
                    border.width: 2

                    Text {
                        id: label2
                        x: 37
                        y: 12
                        text: qsTr("Type")
                        font.pixelSize: 12
                        font.bold: true
                    }
                }

                Rectangle {
                    id: name
                    width: 286
                    height: 40
                    color: "#ffffff"
                    border.color: "#d9d9d9"
                    border.width: 2

                    Text {
                        id: label3
                        x: 37
                        y: 12
                        text: qsTr("Name")
                        font.pixelSize: 12
                        font.bold: true
                    }
                }

                Rectangle {
                    id: dueDate
                    width: 168
                    height: 40
                    color: "#ffffff"
                    border.color: "#d9d9d9"
                    border.width: 2

                    Text {
                        id: label4
                        x: 30
                        y: 12
                        text: qsTr("Due Date")
                        font.pixelSize: 12
                        font.bold: true
                    }
                }

                Rectangle {
                    id: latePolicy
                    width: 168
                    height: 40
                    color: "#ffffff"
                    border.color: "#d9d9d9"
                    border.width: 2

                    Text {
                        id: label5
                        x: 26
                        y: 12
                        text: qsTr("Late Policy")
                        font.pixelSize: 12
                        font.bold: true
                    }
                }

                Rectangle {
                    id: score
                    width: 112
                    height: 40
                    color: "#ffffff"
                    border.color: "#d9d9d9"
                    border.width: 2

                    Text {
                        id: label6
                        x: 41
                        y: 12
                        text: qsTr("Score")
                        font.pixelSize: 12
                        font.bold: true
                    }
                }

                Rectangle {
                    id: grade
                    width: 112
                    height: 40
                    color: "#ffffff"
                    border.color: "#d9d9d9"
                    border.width: 2

                    Text {
                        id: label7
                        x: 6
                        y: 12
                        text: qsTr("Grade Percentage")
                        font.pixelSize: 12
                        font.bold: true
                    }
                }

                // Reapeter
                Repeater {
//                    model: columnLabelGrid.rows * columnLabelGrid.columns This generates a whole row of duplicates
                    model: columnLabelGrid.rows

                    Rectangle {
                        id: rectangle3
                        width: 96
                        height: 32
                        color: "#ffdebf"
                        radius: 16
                        border.color: "#d9d9d9"
                        border.width: 0

                        TextField {
                            id: itemNameField
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
                    }
                }
            }

            // TTHIS HOLDS ALL THE ITEMS!!!!
            Column {
                id: itemHolder
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 40
                width: 1181
                height: 633

                // Add Item
                Button {
                    id: itemAdd
                    width: 32
                    height: 32
                    text: qsTr("+")
                    spacing: 0
                    flat: true
                    font.pointSize: 24
                    font.bold: true
                    onClicked: {
                        columnLabelGrid.rows += 1;
                    }
                }
            }
        }
    }
}
