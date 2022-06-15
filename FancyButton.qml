import QtQuick 2.15
import QtQuick.Controls 2.12

Button {
    id: fancyButton
    text: "Fancy Button"

    contentItem: Text {
        text: fancyButton.text
        font: fancyButton.font
        opacity: enabled ? 1.0 : 0.3
        color: fancyButton.down ? "red" : "black"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 40
        border.color: fancyButton.down ? "white" : "black"
        border.width: 2
        radius: 4
    }
}
