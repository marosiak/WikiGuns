#include "randomquote.h"

RandomQuote::RandomQuote(QObject *parent) : QObject(parent){

}
QPROPERTY(QString myTest);

RandomQuote::metodaA(){
    qDebug() << "test";
    myTest = "test";
}
