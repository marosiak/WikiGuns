import QtQuick 2.0
import QtGraphicalEffects 1.0
import "."


Rectangle {
        property color buttonColor
        property string buttonText
        signal clicked
        signal released
        id: rectangle1
        color: buttonColor
        radius: 2.1
    PaperRipple {
        id: ripple
        radius: 3 * dp
        mouseArea: mouseArea
        }
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: rectangle1.clicked()
        onReleased: rectangle1.released()
    }
    FontLoader {
            id: robotoMedium
            source: "/fonts/Roboto-Medium.ttf"
        }
    Text{
        width: rectangle1.width
        height: rectangle1.height
        color: "#ffffff"
        text: buttonText
        font.family: robotoMedium.name
        font.pointSize: 12
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        textFormat: Text.AutoText
    }
}
