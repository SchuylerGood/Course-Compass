import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15


Rectangle {
    id: page
    width: screenWidth
    height: screenHeight
    z: 0
    color: Constants.backgroundColor
    Layout.fillWidth: true
    Layout.fillHeight: true

    Row { // Top part with current courses, and recommended action boxes, progress tracker.
        id: informationRow
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        topPadding: 40
        leftPadding: 40
        rightPadding: 40
        spacing: 32
        height: parent.height / 3

        CourseBox {}
        RecommendedActionBox {}
        ProgressTrackerBox {}
    }

    ItemPane {}
}
//}
