function openOrClose(boxWidth, boxState, boxLeftMargin) {
    if(boxState == "start"){
        boxState = "wysuniete";
    }
    else{
        if(boxState == "wysuniete" && boxLeftMargin == 0){
            boxState = "zasuniete";
        }
        else{ if(boxState == "zasuniete" && boxLeftMargin == (-boxWidth)){
            boxState = "wysuniete";
            }
        }
    }
    return boxState;
}

function apply(modelName){
    console.debug(modelName);
    if(typeof startInfo !== "undefined"){
        startInfo.destroy();
    }
var newText = Qt.createQmlObject
('import QtQuick 2.0; Text { anchors.top: parent.top; anchors.topMargin: 25; textFormat: Text.RichText; horizontalAlignment: Text.AlignHCenter; anchors.right: parent.right; anchors.rightMargin: 10; anchors.left: parent.left; anchors.leftMargin: 10; width: parent.width; height: 35; font.family: robotoMedium.name; font.pointSize: 24; color: "#727272"}',mainPlace, "dynamicSnippet1");
newText.text = modelName; // tu trzeba zrobić reload

}
