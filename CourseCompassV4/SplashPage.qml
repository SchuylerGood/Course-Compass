import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    width: screenWidth
    height: screenHeight

    Image {
        anchors.centerIn: parent
        id: dashTestTitle
        source: "Logo.png"
    }
}
