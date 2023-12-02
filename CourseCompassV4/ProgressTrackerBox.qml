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

        Item {
            width: 200
            height: 200



            Canvas {
                id: canvas
                anchors.fill: parent

                property real done: 0.6
                property real inProgress: 0.1
                property real notStarted: 0.3

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
        }
    }
}
