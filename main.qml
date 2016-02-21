import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import "json"
import "material"
import "scripts/Main.js" as MainScript



Window {
    id: mainWindow
    visible: true
    width: 400
    height: 600
    FontLoader {
            id: robotoMedium
            source: "/fonts/Roboto-Medium.ttf"
        }
    Text {
        id: startInfo
        color: "#727272"
        font.family: robotoMedium.name
        anchors.top: topBar.bottom
        anchors.topMargin: 10
        anchors.leftMargin: 10
        anchors.left: parent.left
        anchors.rightMargin: 10
        anchors.right: parent.right
        wrapMode: Text.WordWrap
        textFormat: Text.RichText
        font.pointSize: 15
        width: parent.width/1.3
        height: 10
        horizontalAlignment: Text.AlignHCenter
        text: "Welcome in my app, thanks for downloading, remember to rate!"
    }
    Flickable { // main place
        contentWidth: parent.width
        contentHeight: mainColumn.height+Screen.height
        id: mainPlace
        width: parent.width
        height: parent.height-topBar.height
        anchors.top: topBar.bottom
        anchors.topMargin: 0
        Column{
            id: mainColumn
            spacing: 2
            width: parent.width
        Text {
            id: mainHeader
            anchors.top: startInfo.top
            anchors.topMargin: 3
            textFormat: Text.RichText
            horizontalAlignment: Text.AlignHCenter
            width: parent.width
            font.family: robotoMedium.name
            font.pointSize: 24
            color: "#727272"
        }
        Item{
            id: imageContainer
            width: parent.width/2.5
            height: parent.width/2.5
            anchors.top: mainHeader.bottom
            anchors.topMargin: 1
            anchors.horizontalCenter: parent.horizontalCenter
            Image {
                id: gunImage
                width: parent.width
                height: parent.height
                fillMode: Image.PreserveAspectFit
                //
                anchors.top: mainHeader.bottom
                anchors.topMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter

            }
        }
        Text {
            id: genaralInfo
            width: mainPlace.width
            anchors.top: imageContainer.bottom
            anchors.topMargin: 3
            textFormat: Text.RichText
            horizontalAlignment: Text.AlignHCenter
            font.family: robotoMedium.name
            font.pointSize: 24
            color: "#727272"
        }
        Text {
            id: genaralInfo_info
            width: mainPlace.width-(mainPlace.width/5.5)
            textFormat: Text.RichText
            horizontalAlignment: Text.AlignHCenter
            anchors.top: genaralInfo.bottom
            anchors.topMargin: 27
            anchors.left: parent.left
            anchors.leftMargin: (mainPlace.width/5.5)/2
            anchors.right: parent.right
            anchors.rightMargin: (mainPlace.width/5.5)/2
            font.family: robotoMedium.name
            font.pointSize: 12
            color: "#727272"
            //color: "#FFFFFF"
            wrapMode: Text.Wrap
        }
    }
}
    Rectangle { // Top Bar
            id: topBar
            width: parent.width
            height: 56
            color: "#03A9F4"
            anchors.horizontalCenter: parent.horizontalCenter
            Item {
                id: itemBar
                width: parent.height
                height: parent.height
                anchors.left: parent.left
                anchors.leftMargin: 0
                    Image {
                        id: imageBar
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
                            id: xc
                            width: parent.width
                            height: parent.height
                            onClicked: { box.state = MainScript.openOrClose(box.width, box.state, box.anchors.leftMargin); console.log(MainScript.openOrClose(box.width, box.state, box.anchors.leftMargin))}
                        }
                        PaperRipple{
                            id: ripple
                            radius: 3 * dp
                            mouseArea: xc
                        }
            }
    }
    Rectangle {
        id: box
        state: "start"
        width: 210
        height: parent.height-topBar.height
        color: "#2196F3"
        anchors.top: topBar.bottom
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: -box.width
        NumberAnimation on anchors.leftMargin {
            from: -box.width
            to: 0
            duration: 350
            running: box.state == "wysuniete"
        }
        NumberAnimation on anchors.leftMargin {
            from: 0
            to: -box.width
            duration: 350
            running: box.state == "zasuniete"
        }

        Column {
                spacing: 5
                anchors.fill: parent
                anchors.margins: 5
                anchors.bottomMargin: 0
                width: parent.width

                Text{
                    color: "#ffffff"
                    text: "Pistols"
                    width: parent.width
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 17
                    font.family: robotoMedium.name
                }
                ListView {
                    id: list1
                    width: parent.width
                    height: parent.width/2
                    maximumFlickVelocity: 2502
                    flickDeceleration: 1497
                    boundsBehavior: Flickable.StopAtBounds
                    flickableDirection: Flickable.AutoFlickDirection
                    contentHeight: 69
                    JSONListModel {
                        id: jsonModel1
                        query: "$.guns.pistols[*]"
                        source: "gunsList.txt"
                    }
                    model: jsonModel1.model
                    section.delegate: sectionDelegate
                    section.property: "name"
                    section.criteria: ViewSection.FirstCharacter
                    delegate: Component {
                        Item{
                            width: parent.width
                            height: 30
                            PaperRipple {
                                id: ripple
                                radius: 3 * dp
                                mouseArea: mouseAreaxx
                                }
                            MouseArea {
                                id: mouseAreaxx
                                anchors.fill: parent
                                onClicked: {MainScript.apply(model.name, model.ammo, model.info, model.image);
                                box.state = MainScript.openOrClose(box.width, box.state, box.anchors.leftMargin); console.log(MainScript.openOrClose(box.width, box.state, box.anchors.leftMargin))}
                            }
                            Text {
                                width: parent.width-25
                                height: 30
                                font.pixelSize: 16
                                color: "white"
                                font.family: robotoMedium.name
                                verticalAlignment: Text.AlignVCenter
                                text: model.name
                                anchors.left: parent.left
                                anchors.leftMargin: 36
                            }
                        }
                    }
                }
                Text{
                    color: "#ffffff"
                    text: "Rifles"
                    width: parent.width
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 17
                    font.family: robotoMedium.name
                }
                ListView {
                    id: list2
                    width: parent.width
                    height: parent.height/4
                    boundsBehavior: Flickable.StopAtBounds
                    flickableDirection: Flickable.AutoFlickDirection
                    contentHeight: 69
                    JSONListModel {
                        id: jsonModel2
                        query: "$.guns.rifles[*]"
                        source: "gunsList.txt"
                    }
                    model: jsonModel2.model
                    section.delegate: sectionDelegate
                    section.property: "name"
                    section.criteria: ViewSection.FirstCharacter
                    delegate: Component {

                        Item{
                            width: parent.width
                            height: 30
                            PaperRipple {
                                id: ripple
                                radius: 3 * dp
                                mouseArea: mouseAreaxx
                                }
                            MouseArea {
                                id: mouseAreaxx
                                anchors.fill: parent
                                onClicked: {MainScript.apply(model.name, model.ammo, model.info, model.image);
                                box.state = MainScript.openOrClose(box.width, box.state, box.anchors.leftMargin); console.log(MainScript.openOrClose(box.width, box.state, box.anchors.leftMargin))}
                            }
                            Text {
                                width: parent.width-25
                                height: 30
                                font.pixelSize: 16
                                color: "white"
                                font.family: robotoMedium.name
                                verticalAlignment: Text.AlignVCenter
                                text: model.name
                                anchors.left: parent.left
                                anchors.leftMargin: 36
                            }
                    }
                }
            }
                Text{
                    color: "#ffffff"
                    text: "Heavy Rifles"
                    width: parent.width
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 17
                    font.family: robotoMedium.name
                }
                ListView {
                    id: list3
                    width: parent.width
                    height: parent.height/2
                    boundsBehavior: Flickable.StopAtBounds
                    flickableDirection: Flickable.AutoFlickDirection
                    contentHeight: 69
                    JSONListModel {
                        id: jsonModel3
                        query: "$.guns.heavy_guns[*]"
                        source: "gunsList.txt"
                    }
                    model: jsonModel3.model
                    section.delegate: sectionDelegate
                    section.property: "name"
                    section.criteria: ViewSection.FirstCharacter
                    delegate: Component {

                        Item{
                            width: parent.width
                            height: 30
                            PaperRipple {
                                id: ripple
                                radius: 3 * dp
                                mouseArea: mouseAreaxx
                                }
                            MouseArea {
                                id: mouseAreaxx
                                anchors.fill: parent
                                onClicked: {MainScript.apply(model.name, model.ammo, model.info, model.image);
                                box.state = MainScript.openOrClose(box.width, box.state, box.anchors.leftMargin); console.log(MainScript.openOrClose(box.width, box.state, box.anchors.leftMargin))}
                            }
                            Text {
                                width: parent.width-25
                                height: 30
                                font.pixelSize: 16
                                color: "white"
                                font.family: robotoMedium.name
                                verticalAlignment: Text.AlignVCenter
                                text: model.name
                                anchors.left: parent.left
                                anchors.leftMargin: 36
                            }
                    }
                }
            }
        }
    }
}
