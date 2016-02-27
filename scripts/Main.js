var isStartTextExits = true;
var isMainTextExits = false;
//

function calc(){
    var pistolsCount = pistolsList.count;
    var riflesCount = riflesList.count;
    var heavyCount = heavyList.count;
    pistolsList.height = 50+(32*pistolsCount);
    riflesList.height = 50+(32*riflesCount);
    heavyList.height = 50+(32*heavyCount);
    listFlickable.contentHeight = (50*3)+(50*3)+(32*riflesCount)+(32*pistolsCount)+(32*heavyCount);
    mainPlace.contentHeight = 42+mainHeader.height+imageContainer.height+genaralInfo.height+genaralInfo_info.height;
}

function openOrClose(boxWidth, boxState, boxLeftMargin) {
    calc();
    if(boxState == "start"){
        boxState = "wysuniete";
    }
    else{
        if(boxState == "wysuniete" && boxLeftMargin == 0){
            boxState = "zasuniete";
        }
        else{ if(boxState == "zasuniete" && boxLeftMargin == (-boxWidth)){
            listFlickable.contentY = 0;
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
