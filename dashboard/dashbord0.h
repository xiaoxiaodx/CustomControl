#ifndef Dashbord0_H
#define Dashbord0_H

#include <QObject>
#include <QQuickPaintedItem>
#include <QPainter>
#include <QPointF>
#include <QDebug>
#include <QPolygon>
#include <QTimer>

#include "util.h"
/*
 * 绘制一个简单的仪表盘
*/

class Dashbord0 : public QQuickPaintedItem
{
    Q_OBJECT
public:
    Dashbord0();

    QML_PROPERTY(qreal,centerX);
    QML_PROPERTY(qreal,centerY);
    QML_PROPERTY(qreal,radius);
    QML_PROPERTY(QString,colorEdge);
    QML_PROPERTY(QString,colorScale);
    QML_PROPERTY(QString,colorRadius);
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




    //    int m_centerX;
    //    int m_centerY;
    //    int m_radius;
    //   bool isClockwise;//是否顺时针

};

#endif // Dashbord0_H
