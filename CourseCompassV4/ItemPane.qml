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

        Tabs {}

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
                    itemsListModel.append({ "Course": "CISC 101", "Status": "Not Started","Type":"Assignment","Name":"Assignment 4: Quantom Theory","DueDate":"12/10/23","LatePolicy":"3 Day grace period","Score":"7","GradePercentage":"8" });
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
                            width: 112
                            height: 40
                            color: "red"

                            Text {
                                id: courseTagText
                                anchors.fill: parent
                                text: Course
                            }
                        }

                        Rectangle {
                            id: statusTag
                            anchors.left: courseTag.right
                            width: 112
                            height: 40
                            color: "blue"

                            Text {
                                id: statusTagText
                                anchors.fill: parent
                                text: Status
                            }
                        }

                        Rectangle {
                            id: typeTag
                            anchors.left:statusTag.right
                            width: 112
                            height: 40
                            color: "yellow"

                            Text {
                                id: typeTagText
                                anchors.fill: parent
                                text: Type
                            }
                        }

                        Rectangle {
                            id: nameTag
                            anchors.left:typeTag.right
                            width: 286
                            height: 40
                            color: "purple"

                            Text {
                                id: nameTagText
                                anchors.fill: parent
                                text: Name
                            }
                        }

                        Rectangle {
                            id: dueDateTag
                            anchors.left:nameTag.right
                            width: 168
                            height: 40
                            color: "pink"

                            Text {
                                id: dueDateText
                                anchors.fill: parent
                                text: DueDate
                            }
                        }

                        Rectangle {
                            id: latePolicyTag
                            anchors.left:dueDateTag.right
                            width: 168
                            height: 40
                            color: "red"

                            Text {
                                id: latePolicyText
                                anchors.fill: parent
                                text: LatePolicy
                            }
                        }

                        Rectangle {
                            id: scoreTag
                            anchors.left:latePolicyTag.right
                            width: 112
                            height: 40
                            color: "green"

                            Text {
                                id: scoreText
                                anchors.fill: parent
                                text: Score
                            }
                        }

                        Rectangle {
                            id: gradePercentageTag
                            anchors.left:scoreTag.right
                            width: 112
                            height: 40
                            color: "orange"

                            Text {
                                id: gradePercentageText
                                anchors.fill: parent
                                text: GradePercentage
                            }
                        }
                    }
                }
            }
        }
    }
}
