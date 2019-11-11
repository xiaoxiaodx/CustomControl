#ifndef Dashbord2_H
#define Dashbord2_H

#include <QObject>
#include <QQuickPaintedItem>
#include <QPainter>
#include <QPointF>
#include <QDebug>
#include <QPolygon>
#include <QTimer>

#include "util.h"
/*
 * 绘制一个圆环仪表盘
*/

class Dashbord2 : public QQuickPaintedItem
{
    Q_OBJECT
public:
    Dashbord2();

    QML_PROPERTY(qreal,centerX);
    QML_PROPERTY(qreal,centerY);
    QML_PROPERTY(qreal,outerRingBigRadius);
    QML_PROPERTY(qreal,outerRingSmallRadius);
    QML_PROPERTY(qreal,innerRadius);
    QML_PROPERTY(QString,firstColor);
    QML_PROPERTY(QString,sencondColor);
    QML_PROPERTY(QString,thirdColor);
    QML_PROPERTY(QString,outRingColor);
    QML_PROPERTY(QString,mindleRingColor);
    QML_PROPERTY(QString,fontColor);
    QML_PROPERTY(QString,indicatorColor);

    QML_PROPERTY(bool,isClockwise);
    QML_PROPERTY(int,scaleW);
    QML_PROPERTY(int,scaleNumber);
    QML_PROPERTY(qreal,value);
    QML_PROPERTY(qreal,maxValue);
protected:
    void paint(QPainter *painter);

    void mousePressEvent(QMouseEvent* event);
    void mouseMoveEvent(QMouseEvent *event);
    void mouseReleaseEvent(QMouseEvent *event);
    void wheelEvent(QWheelEvent *event);


    void drawBg(QPainter *painter);
    void drawIndicator(QPainter *painter);


private:
    void gradientArc(QPainter *painter, int radius, int startAngle, int angleLength, int arcHeight, QColor color);
    void normalArc(QPainter *painter, int radius, int startAngle, int angleLength, int arcHeight, QColor color);
    void gradientArc1(QPainter *painter, int radius, int startAngle, int angleLength, int arcHeight, QGradient gradient);
    void drawText1(QPainter *painter,int size,qreal tX,qreal tY,QString colorStr,QString str);
    int minAngle ;
    int maxAngle;

};

#endif // Dashbord0_H
