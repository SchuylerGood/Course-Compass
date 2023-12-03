import QtQuick 2.15

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
        width: itemsPane.width / 9
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
        width: itemsPane.width / 9
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
        width: itemsPane.width / 9
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
        width: itemsPane.width / 9 * 2
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
        width: itemsPane.width / 9
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
        width: itemsPane.width / 9
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
        width: itemsPane.width / 9
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
        width: itemsPane.width / 9
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
