var isStartTextExits = true;
//
var isMainTextExits = false;

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
function checkRemove(){
    if(isStartTextExits){
        startInfo.destroy();
        isStartTextExits = false;
    }
}

function apply(Name, Ammo, Info, Image){
    checkRemove();
    mainHeader.text = qsTr(Name);
    gunImage.source = qsTr("../imgs/"+Image);
    genaralInfo.text = qsTr("General info");
    genaralInfo_info.text = qsTr(Info);
    mainColumn.height = Screen.width*2;
    mainPlace.contentY = 0;
}
