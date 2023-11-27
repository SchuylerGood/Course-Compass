import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import Custom 1.0

Window {
    width: 1920
    height: 1080
    visible: true
    title: qsTr("Hello World")
    Rectangle {
        id: rectangle4
        width: Constants.width
        height: Constants.height

        color: Constants.backgroundColor

        Column {
            id: column
            x: 0
            y: 0
            width: 1920
            height: 1080
            transformOrigin: Item.Center
            spacing: 32
            rightPadding: 32
            leftPadding: 0
            bottomPadding: 32
            topPadding: 32

            Row {
                id: row
                x: 48
                y: 0
                width: 1824
                height: 296
                topPadding: 0
                rightPadding: 16
                leftPadding: 0
                spacing: 32

                Rectangle {
                    id: rectangle
                    y: 0
                    width: 456
                    height: 296
                    color: "#ffffff"
                    radius: 32

                    Text {
                        id: text1
                        x: 40
                        y: 24
                        width: 291
                        height: 45
                        text: qsTr("Current Courses")
                        font.pixelSize: 32
                        font.bold: true
                    }

                    Button {
                        id: button
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
                            createCourseButtonHandler.handleButtonClick();
                            courseItemLoader.source = "CourseComponent.qml";
                        }
                    }

                    // Use Loader to dynamically load CourseItem.qml
                    Loader {
                        id: courseItemLoader
                        width: 376
                        height: 44
                        // Set anchors, positioning, etc. as required
                    }

                    CreateCourseButtonHandler {
                        id: createCourseButtonHandler
                    }

                    Column {
                        id: column1
                        x: 40
                        y: 81
                        width: 397
                        height: 215
                        spacing: 4

                        CourseComponent {

                        }

                        Rectangle {
                            id: course4
                            x: 0
                            width: 376
                            height: 44
                            color: "#e9e9e9"
                            radius: 8
                            Row {
                                id: row4
                                y: 0
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.top: parent.top
                                anchors.bottom: parent.bottom
                                topPadding: 12
                                spacing: 24
                                leftPadding: 24
                                Rectangle {
                                    id: rectangle8
                                    width: 24
                                    height: 24
                                    color: "#ffbfbf"
                                    radius: 12
                                }

                                Text {
                                    id: text8
                                    text: qsTr("COURSE 1")
                                    font.pixelSize: 15
                                    horizontalAlignment: Text.AlignLeft
                                    verticalAlignment: Text.AlignVCenter
                                    font.bold: true
                                }

                                Text {
                                    id: text9
                                    text: qsTr("This is the full course title")
                                    font.pixelSize: 15
                                    horizontalAlignment: Text.AlignLeft
                                    verticalAlignment: Text.AlignVCenter
                                    font.bold: false
                                }
                                anchors.topMargin: 0
                            }
                        }
                    }
                }

                Rectangle {
                    id: rectangle1
                    width: 456
                    height: 296
                    color: "#ffffff"
                    radius: 32
                }

                Rectangle {
                    id: rectangle2
                    width: 846
                    height: 296
                    color: "#ffffff"
                    radius: 32
                }
            }

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
        }
    }
}
