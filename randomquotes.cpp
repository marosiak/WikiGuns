#include "randomquotes.h"

RandomQuotes::RandomQuotes(QObject *parent) : QObject(parent){

}

void RandomQuotes::doQuote(){
    srand (time(NULL));
    int size = 7;
    QString quotes[size] = {
        "I changed my car horn to gun shot sound.. People move out of the way much faster now.",
        "If guns kill people, then pencils misspell words, cars make people drive drunk and spoons made Rosie O'Donnel fat.",
        "I sleep with my gun on my bedside table. I live alone; It is my protection and makes me feel safer. \n\n Alana Stewart",
        "All you need for happiness is a good gun, a good horse, and a good wife. \n\n Daniel Boone",
        "If guns were banned, I'd sure think twice before using one to commit a crime, said no criminal ever.",
        "I have a very strict gun control policy: \n If there's a gun around, I want to be in control of it. \n\n Clint Eastwood",
        "A gun in the hand is better than a cop on the phone."
    };
    int x = rand() % size;
    quote = quotes[x];
}

QString RandomQuotes::getQuote() const{
    return quote;
}
