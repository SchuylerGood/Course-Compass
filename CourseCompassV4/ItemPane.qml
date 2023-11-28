import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: itemsPaneHolder
    x: 48
    y: 340
    width: 1820
    height: 700
    color: "#00ffffff"
    radius: 0
    transformOrigin: Item.Center

    Column {
        id: itemsPaneWrapper
        x: 0
        y: 0
        width: 1824
        height: 700

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

        Rectangle {
            id: itemsPane
            width: 1824
            height: 672
            color: "#ffffff"
            radius: 32
            border.color: "#d9d9d9"
            border.width: 2

            Grid {
                id: columnLabelGrid
                x: 0
                y: 0
                width: 1824
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
            }

            Column {
                id: itemHolder
                x: 0
                y: 39
                width: 1181
                height: 633

                Rectangle {
                    id: rectangle9
                    width: 1181
                    height: 36
                    color: "#ffffff"
                    border.color: "#d9d9d9"
                    border.width: 2

                    Row {
                        id: sampleItem1
                        x: 0
                        y: 0
                        width: 1182
                        height: 36
                        topPadding: 0

                        Rectangle {
                            id: rectangle3
                            width: 96
                            height: 32
                            color: "#ffdebf"
                            radius: 16
                            border.color: "#d9d9d9"
                            border.width: 0
                        }
                    }
                }
            }
        }
    }
}