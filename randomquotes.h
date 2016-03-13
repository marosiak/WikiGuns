#ifndef RANDOMQUOTES_H
#define RANDOMQUOTES_H

#include <QObject>
#include <cstdlib>
#include <time.h>

class RandomQuotes : public QObject
{
    Q_OBJECT
public:
    explicit RandomQuotes(QObject *parent = 0);
    Q_PROPERTY(QString quote READ quote)
    Q_INVOKABLE void doQuote();
    QString quote;
    Q_INVOKABLE QString getQuote() const;

signals:

public slots:
};

#endif // RANDOMQUOTES_H
