#ifndef Progressbar0_H
#define Progressbar0_H

#include <QObject>
#include <QQuickPaintedItem>
#include <QPainter>
#include <QPointF>
#include <QDebug>
#include <QPolygon>
#include <QTimer>

#include "util.h"
#include "drawbase.h"
/*
 * 绘制一个简单的仪表盘
*/

class Progressbar0 : public DrawBase
{
    Q_OBJECT
public:
    Progressbar0();

    QML_PROPERTY(QString,bgColor)
    QML_PROPERTY(QString,fgColor)
    QML_PROPERTY(QString,bordColor)
    QML_PROPERTY(QString,fontColor)
    QML_PROPERTY(int,processtype)//0：圆形，1：矩形
    QML_PROPERTY(bool,isClockwise)//是否顺时针

    QML_PROPERTY(bool,isWave)//是否使用波浪
    QML_PROPERTY(float,waveA)//波浪的振幅，范围0-1
    QML_PROPERTY(qreal,waveP)//波浪的周期，范围0-1
    QML_PROPERTY(int,value)

    //以下属性，矩形情况下有
    QML_PROPERTY(int,mWidth)
    QML_PROPERTY(int,mHeight)

    //以下属性，圆形情况下有
    QML_PROPERTY(bool,isScaleBaer)
    QML_PROPERTY(int,bordW)
    QML_PROPERTY(int,radiusBig)
    QML_PROPERTY(int,radiusSmall)
    QML_PROPERTY(int,centerX)
    QML_PROPERTY(int,centerY)
public slots:
    void slot_timeout();
protected:
    void paint(QPainter *painter);

    void mousePressEvent(QMouseEvent* event);
    void mouseMoveEvent(QMouseEvent *event);
    void mouseReleaseEvent(QMouseEvent *event);
    void wheelEvent(QWheelEvent *event);




private:
    void drawBg(QPainter *painter);
    void drawValue(QPainter *painter);

    QTimer timer;

    qreal m_offset;
    qreal m_offset2;


};

#endif // Progressbar0_H
