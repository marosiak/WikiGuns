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



