import QtQuick 2.0
import QtQuick.Controls 2.5

Item {
    property color buttonColor: "white"
    property color textColor: "black"
    property string labelText: ""
    property int span: 1

    signal buttonPressed(string text)

    width: span == 2 ? 170 : 80
    height: 80

    Rectangle {
        id: itemBackground
        anchors.fill: parent
        radius: height * 0.5
        color: buttonColor
    }

    Label {
        id: itemText
        anchors.fill: parent
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: "Arial"
        font.pointSize: 25
        text: labelText
        color: textColor
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            buttonPressed(labelText)
        }
    }
}
