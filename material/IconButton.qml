import QtQuick 2.0
import QtGraphicalEffects 1.0
import "."

Item {
        signal clicked
        signal released
        id: rectangle1
    PaperRipple {
        id: ripple
        radius: 3 * dp
        mouseArea: mouseArea
        }
    Image {
        id: image
        sourceSize.height: 500
        sourceSize.width: 500
        fillMode: Image.Stretch
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        source: "icons/menu.png"
    }
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: rectangle1.clicked()
        onReleased: rectangle1.released()
    }
}
