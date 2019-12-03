#ifndef DRAWBASE_H
#define DRAWBASE_H

#include <QObject>
#include <QQuickPaintedItem>
#include <QGradient>
#include <QPainter>
#include <QPointF>
#include "math.h"
#define pi 3.1415926


/*
 * 画图的基类 所有的自定义的绘图类都放在基类
 * 主要放置一些公用的绘图函数，比如写字，画圆，画圆环
**/


class DrawBase: public QQuickPaintedItem
{
public:
    DrawBase();

    void gradientArc(QPainter *painter, int radius, int startAngle, int angleLength, int arcHeight, QColor color);
    void normalArc(QPainter *painter, int radius, int startAngle, int angleLength, int arcHeight, QColor color);
    void gradientArc1(QPainter *painter, int radius, int startAngle, int angleLength, int arcHeight, QGradient gradient);
    void drawText1(QPainter *painter,int size,qreal tX,qreal tY,QString colorStr,QString str,int penSize);
    void drawReflective(QPainter *painter,int tradius);
    void drawRadiusWave(QPainter *painter,qreal radiusCenterX,qreal radiusCenterY,qreal radius,qreal valueY,qreal A,qreal W,qreal P1,qreal P2,QString color);
    void drawRectWave(QPainter *painter,qreal startX,qreal startY,qreal w,qreal h,qreal valueY,qreal A,qreal W,qreal P1,qreal P2,QString color);
    void drawTriangle(QPainter *painter,int radius,int triangleLen,int angle,QString color);
};

#endif // DRAWBASE_H
