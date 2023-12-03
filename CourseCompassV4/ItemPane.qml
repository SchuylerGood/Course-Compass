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
    anchors.top: informationRow.bottom
    anchors.left: parent.left
    anchors.right: parent. right
    anchors.topMargin: 30
    anchors.leftMargin: 48
    anchors.rightMargin: 48

    Column {
        id: itemsPaneWrapper
        width: parent.width
        height: parent.height
        anchors.left: parent.left
        anchors.right: parent.right

        // Tabs {}

        Rectangle {
            id: itemsPane
            width: parent.width
            height: parent.height
            color: "#ffffff"
            radius: 32
            border.color: "#d9d9d9"
            border.width: 2

            Button {
                id: addNewItemButton
                z: 2
                anchors.right: parent.right
                anchors.rightMargin: 24
                anchors.top: parent.top
                width: 32
                height: 32
                text: qsTr("+")
                spacing: 0
                flat: true
                font.pointSize: 24
                font.bold: true
                onClicked: {
                    itemsListModel.append({ "Course": "CISC 101", "Status": "Not Started","Type":"📄 Assignment","Name":"Assignment 4: Quantom Theory","DueDate":"12/10/23","LatePolicy":"3 Day grace period","Score":"7","GradePercentage":"8" });
                }
            }

            ItemPaneHeaders {}

            Rectangle {
                anchors.fill: parent
                anchors.topMargin: 40
                anchors.leftMargin: 2
                anchors.rightMargin: 2
                anchors.bottomMargin: 2

                ListModel {
                    id: itemsListModel
                }

                ListView {
                    anchors.fill: parent
                    model: itemsListModel
                    clip: true
                    spacing: 5
                    delegate: Rectangle {
                        height: 40
                        width: parent.width

                        Rectangle {
                            id: courseTag
                            anchors.left: parent.left
                            width: itemsPane.width / 9
                            height: 40
                            color: "#FFBFBF"
                            radius: 32

                            TextField {
                                id: courseTagText
                                anchors.centerIn: parent
                                font.pixelSize: 14
                                font.bold: true
                                width: parent.width - 20
                                background: Rectangle {color:courseTag.color}
                                placeholderText: "ex. CISC 101"
                                onTextChanged: {
                                   itemsListModel.setProperty(index, "Course", courseTagText.text)
                                }
                            }

                        }
                        Rectangle {
                            id: statusTag
                            anchors.left: courseTag.right
                            width: itemsPane.width / 9
                            height: 40
                            color: "#F1F0EF"
                            radius: 32

                            TextField {
                                id: statusTagText                                
                                anchors.centerIn: parent
                                font.pixelSize: 14
                                font.bold: true
                                width: parent.width - 20
                                background: Rectangle {color: statusTag.color}
                                placeholderText: "Not Started, In Progress, Completed"
                                onTextChanged: {
                                   itemsListModel.setProperty(index, "Status", statusTagText.text)
                                }
                            }
                        }

                        Rectangle {
                            id: typeTag
                            anchors.left:statusTag.right
                            width: itemsPane.width / 9
                            height: 40
                            color: "#FDECC8"
                            radius: 32

                            TextField {
                                id: typeTagText
                                anchors.centerIn: parent
                                font.pixelSize: 14
                                font.bold: true
                                width: parent.width - 20
                                background: Rectangle {color: typeTag.color}
                                placeholderText: "Ex. Assignment, Quiz, Test"
                                onTextChanged: {
                                   itemsListModel.setProperty(index, "Type", typeTagText.text)
                                }
                            }
                        }

                        Rectangle {
                            id: nameTag
                            anchors.left:typeTag.right
                            width: itemsPane.width / 9 * 2
                            height: 40

                            TextField {
                                id: nameTagText
                                anchors.centerIn: parent
                                font.pixelSize: 14
                                font.bold: true
                                width: parent.width - 20
                                background: Rectangle {}
                                placeholderText: "ex. Assignment 1: Quantom Theory"
                                onTextChanged: {
                                   itemsListModel.setProperty(index, "Name", nameTagText.text)
                                }
                            }
                        }

                        Rectangle {
                            id: dueDateTag
                            anchors.left:nameTag.right
                            width: itemsPane.width / 9
                            height: 40

                            TextField {
                                id: dueDateText
                                anchors.centerIn: parent
                                font.pixelSize: 14
                                font.bold: true
                                width: parent.width - 20
                                background: Rectangle {}
                                placeholderText: "Due date"
                                onTextChanged: {
                                   itemsListModel.setProperty(index, "DueDate", dueDateText.text)
                                }
                            }
                        }

                        Rectangle {
                            id: latePolicyTag
                            anchors.left:dueDateTag.right
                            width: itemsPane.width / 9
                            height: 40

                            TextField {
                                id: latePolicyText
                                anchors.centerIn: parent
                                font.pixelSize: 14
                                font.bold: true
                                width: parent.width - 20
                                background: Rectangle {}
                                placeholderText: "ex. 1 day grace period"
                                onTextChanged: {
                                   itemsListModel.setProperty(index, "LatePolicy", latePolicyText.text)
                                }
                            }
                        }

                        Rectangle {
                            id: scoreTag
                            anchors.left:latePolicyTag.right
                            width: itemsPane.width / 9
                            height: 40

                            TextField {
                                id: scoreText
                                anchors.centerIn: parent
                                font.pixelSize: 14
                                font.bold: true
                                width: parent.width - 20
                                background: Rectangle {}
                                placeholderText: "score"
                                onTextChanged: {
                                   itemsListModel.setProperty(index, "Score", scoreText.text)
                                }
                            }
                        }

                        Rectangle {
                            id: gradePercentageTag
                            anchors.left:scoreTag.right
                            width: itemsPane.width / 9
                            height: 40

                            TextField {
                                id: gradePercentageText
                                anchors.centerIn: parent
                                font.pixelSize: 14
                                font.bold: true
                                width: parent.width - 20
                                background: Rectangle {}
                                placeholderText: "scored %"
                                onTextChanged: {
                                   itemsListModel.setProperty(index, "GradePercentage", gradePercentageText.text)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
