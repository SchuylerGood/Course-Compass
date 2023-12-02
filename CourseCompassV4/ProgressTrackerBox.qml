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
        id: progressTrackerBoxWhite
        anchors.top: cbHeader.bottom
        anchors.topMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter
        width: 300
        height: 200
        color: "white"
        radius: 32

        Column {
            id: separateProgress
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

            Shape {
                width: 200
                height: 200
                scale: 0.7
                anchors.centerIn: progressTrackerBoxWhite
                //Enable multisampled rendering
                layer.enabled: true
                layer.samples: 4

                ShapePath {
                    fillColor: "transparent"
                    strokeColor: "gray"
                    strokeWidth: 20
                    capStyle: ShapePath.RoundCap
                    PathAngleArc {
                        centerX: 100; centerY: 100
                        radiusX: 100-20/2; radiusY: 100-20/2
                        startAngle: 135
                        sweepAngle: 270
                    }
                }

                ShapePath {
                    fillColor: "transparent"
                    strokeColor: "blue"
                    strokeWidth: 20
                    capStyle: ShapePath.RoundCap
                    PathAngleArc {
                        centerX: 100; centerY: 100
                        radiusX: 100-20/2; radiusY: 100-20/2
                        startAngle: 135
                        sweepAngle: 180
                    }
                }
            }
        }

        Text {
            id: complete
            text: "Completed"
            font.pixelSize: 16
            color: "blue"
            x: 180
            y: 80
            anchors.verticalCenter: Shape
        }

        Text {
            text: "To Do"
            font.pixelSize: 16
            color: "gray"
            x: 180
            y: 120
        }
    }


}
