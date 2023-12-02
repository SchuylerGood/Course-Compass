import QtQuick 2.6
import QtQuick.Window 2.15
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3


ApplicationWindow {
    width: screenWidth
    height: screenHeight
    visible: true
    title: qsTr("Dash Dest")
    header: ToolBar {
        RowLayout {
            anchors.fill: parent
            ToolButton {
                text: '...'

                onClicked: {
                    contextMenu.open();
                }
            }

            Label {
                id: title
                text: 'Page NavBar'
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }

            ToolButton {
                text: "Temporary Page Button"
                onClicked: {
                    stackView.push("TemplatePage.qml")
                }
            }

            TextField {
                id: pageNameField
                width: 50
                placeholderText: "Enter page name"
                font.pixelSize: 16
            }

            ToolButton {
                id: deletePageButton
                text: "Delete Page"
                onClicked: {
                    deletePage()
                }

                function deletePage() {
                    for (var i = 0; i < menuItems.count; i++) {
                        if (menuItems.get(i).text === pageNameField.text) {
                            menuItems.remove(i);
                        }
                    }
                }
            }

            ToolButton {
                id: addPageButton
                text: "Add Page"
                onClicked: {
                    menuItems.append({"text": pageNameField.text})
                }
            }
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: "SplashPage.qml"
    }

    ListModel{
        id: menuItems

        ListElement{
            text: "Winter"
        }
        ListElement{
            text: "Fall"
        }
    }

    Menu {
        id: contextMenu

        Instantiator {
           model: menuItems
           MenuItem {
              text: model.text
           }

           onObjectAdded: contextMenu.insertItem(index, object)
           onObjectRemoved: contextMenu.removeItem(object)
       }
    }
}
