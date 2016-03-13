#ifndef RANDOMQUOTE_H
#define RANDOMQUOTE_H

#include <QObject>
#include <QQuickItem>

class RandomQuote : public QObject{
    Q_OBJECT

public:
    explicit RandomQuote(QObject *parent = 0);

signals:

public slots:
};

#endif // RANDOMQUOTE_H
