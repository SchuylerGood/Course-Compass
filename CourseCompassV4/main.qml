import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 1920
    height: 1080
    visible: true
    title: qsTr("Course Compass")

    Rectangle {
        id: page
        width: parent.width
        height: parent.height
        color: Constants.backgroundColor

        Column {
            id: paneSeparatorColumn
            width: parent.width
            height: parent.height
            anchors.left: parent.left
            anchors.right: parent.right
            transformOrigin: Item.Center
            spacing: 32
            rightPadding: 32
            leftPadding: 0
            bottomPadding: 32
            topPadding: 32

            Row { // Top part with current courses, and recommended action boxes, progress tracker.
                id: informationRow
                width: parent.width
                height: 296
                topPadding: 0
                rightPadding: 16
                leftPadding: 48
                spacing: 32
                anchors.left: parent.left
                anchors.right: parent.right

                CourseBox {}

                RecommendedActionBox {}

                ProgressTrackerBox {

                }
            }

            ItemPane {}
        }
    }
}
