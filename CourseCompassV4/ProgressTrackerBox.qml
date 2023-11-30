import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes

Rectangle { // = ptb
    id: progressTrackerBox
    width: 400
    height: 296
    color: "#ECECEC"
    radius: 32

    Text { //cb = course box
        id: cbHeader
        x: 40
        y: 24
        width: 291
        height: 45
        text: qsTr("Progress Tracker")
        font.pixelSize: 32
        font.bold: true
    }

    Rectangle{
        id: progressTrackerBoxWhite
        anchors.centerIn: parent
        anchors.topMargin: 100
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
                        anchors.top: progressTrackerBoxWhite.top
                        anchors.left: progressTrackerBoxWhite.left
                        anchors.bottom: progressTrackerBoxWhite.bottom
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
    }


}
