import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    width: 1920
    height: 1080
    visible: true
    title: qsTr("Course Compass")

    ColumnLayout {
        id: mainLayout
        anchors.fill: parent

        Rectangle {
            id: tabBarContainer
            Layout.fillWidth: true
            Layout.preferredHeight: tabBar.implicitHeight
            z: 1
            TabBar {
                id: tabBar
                Layout.fillWidth: true
                height: tabBarContainer.height
                bottomInset: 0
            }
        }

        Component {
            id: tabButtonComponent
            TabButton {
                width: 72
            }
        }

        Button {
            text: "Add Page"
            Layout.alignment: Qt.AlignHCenter

            onClicked: {
                if (tabBar.count < 20){
                    var newTabButton = tabButtonComponent.createObject(tabBar, { text: "Tab " + (tabBar.count + 1)})
                    tabBar.addItem(newTabButton)
                }
                else {
                    warningDialog.open()
                    warningDialog.x = (mainLayout.width - warningDialog.width) / 2
                    warningDialog.y = (mainLayoout.height - warningDialog.height) / 2
                }
            }
        }

        Dialog {
            id: warningDialog
            modal: true
            standardButtons: Dialog.Ok
            title: "Warning"

            contentItem: Text {
                text: "Reached maximum of 20 tabs. Cannot add more."
            }
        }

        TemplatePage {}
    }
}
