import QtQuick 2.6
import QtQuick.Window 2.15
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3


ApplicationWindow {
    width: 1920
    height: 1080
    visible: true
    title: qsTr("Course Compass")
    header: ToolBar {
        RowLayout {
            anchors.fill: parent
            ToolButton {
                text: '...'

                onClicked: {
                    menu.open();
                }
            }
            Label {
                id: title
                text: 'Course NavBar'
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }
            // ToolButton {
            //     text: '<'

            //     onClicked: {
            //         stack.pop();
            //     }
            // }
            ToolButton {
                text: "Add Course"
            }
        }
    }

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: initialCondition
        pushEnter: StackView.Immediate
        popExit: StackView.Immediate
        transitions: []
    }

    Menu {
        id: menu

        MenuItem {
            text: 'Course 1'
            onClicked: {
               if (stack.currentItem !== initialCondition){
                    //save current contents in the mainLayout to database
                   //reset mainLayout
               }
               title.text = 'Course 1'
               if (stack.currentItem !== firstMainLayout){
                    stack.push(firstMainLayout);
               }
            }
        }
        MenuItem {
            text: 'Course 2'

            onClicked: {
                if (stack.currentItem !== initialCondition){
                     //save current contents in the mainLayout to database
                    //reset mainLayout
                }
                title.text = 'Course 2'
                if (stack.currentItem !== secondMainLayout){
                     stack.push(secondMainLayout);
                }
            }
        }
        MenuItem {
            text: 'Course 3'

            onClicked: {
                if (stack.currentItem !== initialCondition){
                     //save current contents in the mainLayout to database
                    //reset mainLayout
                }
                title.text = 'Course 3'
                if (stack.currentItem !== thirdMainLayout){
                     stack.push(thirdMainLayout);
                }
            }
        }
    }
    ColumnLayout {
        id: firstMainLayout
        anchors.fill: parent
        visible: false
        TemplatePage {}
    }
    ColumnLayout {
        id: secondMainLayout
        anchors.fill: parent
        visible: false
        TemplatePage {}
    }

    ColumnLayout {
        id: thirdMainLayout
        anchors.fill: parent
        visible: false
        TemplatePage {}
    }
    ColumnLayout {
        id: initialCondition
        anchors.fill: parent
        TitleImage {}
    }

}
