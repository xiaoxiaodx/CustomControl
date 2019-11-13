#ifndef Dashbord4_H
#define Dashbord4_H

#include <QObject>
#include <QPointF>
#include <QDebug>
#include <QPolygon>
#include <QTimer>

#include "drawbase.h"
#include "util.h"
/*
 * 绘制一个圆环仪表盘
*/



class Dashbord4 : public DrawBase
{
    Q_OBJECT
public:
    Dashbord4();

    QML_PROPERTY(qreal,centerX);
    QML_PROPERTY(qreal,centerY);
    QML_PROPERTY(qreal,outerRingBigRadius);
    QML_PROPERTY(qreal,outerRingSmallRadius);
    QML_PROPERTY(qreal,innerRadius);



    QML_PROPERTY(QString,linearColor1);
    QML_PROPERTY(QString,linearColor2);

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


    int minAngle ;
    int maxAngle;

};

#endif // Dashbord0_H
