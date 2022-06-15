import QtQuick 2.15
import QtQuick.Window 2.12

import QtQuick.Controls 2.5
import QtQuick.Layouts 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Organizer")

    Connections {
        target: taskDataRepo
    }

    GridLayout {
        columns: 2

        Text {
            id: taskNameLabel
            text: "Task Name:"
        }

        TextField {
            id: taskNameInput
            text: "New Task"
        }

        Text {
            id: deadlineLabel
            text: "Task Name:"
        }

        TextField {
            id: deadlineInput
            inputMask: "00.00.0000"
            text: "1.11.2022"
            validator: RegularExpressionValidator { regularExpression: /(0?[1-9]|[12]\d|30|31)[^\w\d\r\n:](0?[1-9]|1[0-2])[^\w\d\r\n:](\d{4}|\d{2})/ }
        }

        Text {
            id: progressLabel
            text: qsTr("Task Name:")
        }

        TextField {
            id: progressInput
            text: "0"
            validator: RegularExpressionValidator { regularExpression: /^([1-9]|10)$/ }
        }

        Button {
            id: saveButton
            text: "SAVE"
            onClicked: taskDataRepo.saveData(
                           taskNameInput.text,
                           deadlineInput.text,
                           progressInput.text
                        )
        }

        FancyButton {

        }
    }
}
