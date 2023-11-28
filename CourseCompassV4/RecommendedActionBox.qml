import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Rectangle { // = rab
    id: recommendedActionBox
    width: 456
    height: 296
    color: "#ECECEC"
    radius: 32

    Text { //cb = course box
        id: cbHeader
        x: 40
        y: 24
        width: 291
        height: 45
        text: qsTr("Recommended Action")
        font.pixelSize: 32
        font.bold: true
    }
}
