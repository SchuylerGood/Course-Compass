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
        width: Constants.width
        height: Constants.height

        color: Constants.backgroundColor

        Column {
            id: paneSeparatorColumn
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

            Row { // Top part with current courses, and recommended action boxes, progress tracker.
                id: informationRow
                x: 48
                y: 0
                width: 1824
                height: 296
                topPadding: 0
                rightPadding: 16
                leftPadding: 0
                spacing: 32

                CourseBox {}

                RecommendedActionBox {}

                ProgressTrackerBox {}
            }

            ItemPane {}
        }
    }
}
