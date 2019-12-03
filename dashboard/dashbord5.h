#ifndef Dashbord5_H
#define Dashbord5_H

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



class Dashbord5 : public DrawBase
{
    Q_OBJECT
public:
    Dashbord5();

    QML_PROPERTY(qreal,centerX);
    QML_PROPERTY(qreal,centerY);
    QML_PROPERTY(qreal,outerRadius);
    QML_PROPERTY(qreal,innerRadius);
    QML_PROPERTY(QString,outerRadiusColor);
    QML_PROPERTY(QString,innerRadiusColor);
    QML_PROPERTY(QString,centerImg);
    QML_PROPERTY(int,keyNum);
    QML_PROPERTY(QString,keyColor);
    QML_PROPERTY(QString,selectKeyColor);
    QML_PROPERTY(QString,selectBgColor);
    QML_PROPERTY(QString,pressKeyBgColor);
    QML_PROPERTY(int,triAngleLen);



protected:
    void paint(QPainter *painter);

    void mousePressEvent(QMouseEvent* event);
    void mouseMoveEvent(QMouseEvent *event);
    void mouseReleaseEvent(QMouseEvent *event);
    void wheelEvent(QWheelEvent *event);
    void hoverMoveEvent(QHoverEvent *event);


    void drawBg(QPainter *painter);
    void drawIndicator(QPainter *painter);


private:
    QPixmap pixmap;

    QString showKeyBgColor;
    int curIndex;
    int preIndex;
};

#endif // Dashbord0_H
