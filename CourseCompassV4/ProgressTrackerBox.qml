import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes

Rectangle { // = ptb
    id: progressTrackerBox
    width: (parent.width / 3) - 54
    height: parent.height - 40
    color: "#ECECEC"
    radius: 32

    property real totalProjects: 100
    property real done: 0.6
    property real inProgress: 0.2
    property real notStarted: 0.2

    Text {
        id: ptbHeader
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 30
        text: qsTr("Progress Tracker")
        font.pixelSize: 32
        font.bold: true
    }

    Rectangle{
        id: contentHolder
        anchors.top: ptbHeader.bottom
        anchors.topMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
        color: "white"
        radius: 8

        Rectangle {
            id: canvasHolder
            width: parent.height - 40
            height: parent.height - 40
            anchors.left: parent.left
            anchors.leftMargin: 40
            anchors.top: parent.top
            anchors.topMargin: 20

            Canvas {
                id: canvas
                anchors.fill: parent

                onPaint: {
                    var centerX = width / 2;
                    var centerY = height / 2;
                    var radius = Math.min(width, height) / 2;

                    var ctx = getContext("2d");
                    ctx.clearRect(0, 0, width, height);

                    // Draw completed (green) arc
                    ctx.strokeStyle = "green";
                    ctx.lineWidth = 20;
                    ctx.beginPath();
                    ctx.arc(centerX, centerY, radius - ctx.lineWidth / 2, -Math.PI / 2, -Math.PI / 2 + 2 * Math.PI * done);
                    ctx.stroke();

                    // Draw in progress (yellow) arc
                    ctx.strokeStyle = "yellow";
                    ctx.beginPath();
                    ctx.arc(centerX, centerY, radius - ctx.lineWidth / 2, -Math.PI / 2 + 2 * Math.PI * done, -Math.PI / 2 + 2 * Math.PI * done + 2 * Math.PI * inProgress);
                    ctx.stroke();

                    // Draw not started (blue) arc
                    ctx.strokeStyle = "blue";
                    ctx.beginPath();
                    ctx.arc(centerX, centerY, radius - ctx.lineWidth / 2, -Math.PI / 2 + 2 * Math.PI * done + 2 * Math.PI * inProgress, -Math.PI / 2 + 2 * Math.PI * done + 2 * Math.PI * inProgress + 2 * Math.PI * notStarted);
                    ctx.stroke();
                }
            }

            Rectangle {
                height: 80
                width: 100
                anchors.centerIn: parent
                Text {
                    id: totalValue
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: totalProjects
                    font.pixelSize: 32
                    font.bold: true
                }
                Text {
                    id: totalText
                    anchors.top: totalValue.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Total Assigned"
                    font.pixelSize: 20
                }
            }
        }

        Column {
            width: contentHolder.width / 2 - 40
            height: parent.height
            anchors.left: canvasHolder.right
            anchors.right: parent.right
            spacing: 5
            padding: 20

            Rectangle {
                height: parent.height / 3 - 20
                width: parent.width - 40
                Text {
                    id: doneValue
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: totalProjects * done
                    font.pixelSize: 32
                    font.bold: true
                }
                Text {
                    id: doneText
                    anchors.left: doneValue.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: "Completed"
                    font.pixelSize: 20
                }
            }

            Rectangle {
                height: parent.height / 3 - 20
                width: parent.width - 40
                Text {
                    id: inProgressValue
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: totalProjects * inProgress
                    font.pixelSize: 32
                    font.bold: true
                }
                Text {
                    id: inProgressText
                    anchors.left: inProgressValue.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: "In Progress"
                    font.pixelSize: 20
                }
            }

            Rectangle {
                height: parent.height / 3 - 20
                width: parent.width - 40
                Text {
                    id: notStartedValue
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    text: totalProjects * notStarted
                    font.pixelSize: 32
                    font.bold: true
                }
                Text {
                    id: notStartedText
                    anchors.left: notStartedValue.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    text: "Not Started"
                    font.pixelSize: 20
                }
            }
        }
    }
}
