
#include "Dashbord0.h"
#include "math.h"


Dashbord0::Dashbord0()
{

    setAcceptedMouseButtons(Qt::LeftButton
                            | Qt::RightButton
                            | Qt::MiddleButton);
    setFlag(QQuickItem::ItemHasContents);



}



//在这里设置原点坐标是因为在构造函数没结束之前，控件的几何信息还未定


void Dashbord0::paint(QPainter *painter)
{

    painter->setRenderHint(QPainter::Antialiasing);

    drawBg(painter);
    drawIndicator(painter);
}
//以中心为原点，水平正方向为正轴，且X轴为0度，逆时针反向为角度增加的反向
void Dashbord0::drawBg(QPainter *painter)
{

    painter->translate(m_centerX,m_centerY);
    painter->scale(1,-1);


    int minAngle = -60;
    int maxAngle = 240;

    qreal scaleAngle = (maxAngle - minAngle)/m_scaleNumber;

    painter->drawPie(-m_radius,-m_radius,m_radius*2,m_radius*2,0,360*16);

    painter->setPen(QPen(m_colorEdge));
    painter->setBrush(QBrush(QColor(m_colorRadius)));
    painter->drawEllipse(-m_radius,-m_radius,m_radius*2,m_radius*2);


    painter->setPen(QPen(QBrush(QColor(m_colorScale)),m_scaleW));
    painter->save();
    painter->setPen(QPen(QBrush(QColor(m_colorEdge)),m_scaleW));

    //qDebug()<<"m_radius "<<m_radius<<" scaleAngle   "<<scaleAngle;


    if(m_isClockwise){
        for(qreal angle = minAngle;angle<=maxAngle;angle += scaleAngle){

            qreal anglePi = 3.1415926*angle/180;
            qreal x1 = (m_radius+4)*cos(anglePi);
            qreal y1 = (m_radius+4)*sin(anglePi);
            qreal x2 = (m_radius+8)*cos(anglePi);
            qreal y2 = (m_radius+8)*sin(anglePi);
            painter->drawLine(QPointF(x1,y1),QPointF(x2,y2));

            //第一个点颜色特殊些
            if(m_isClockwise && angle == minAngle)
                painter->restore();
        }

    }else{

        for(qreal angle = maxAngle;angle>=minAngle;angle -= scaleAngle){

            qreal anglePi = 3.1415926*angle/180;
            qreal x1 = (m_radius+4)*cos(anglePi);
            qreal y1 = (m_radius+4)*sin(anglePi);
            qreal x2 = (m_radius+8)*cos(anglePi);
            qreal y2 = (m_radius+8)*sin(anglePi);

            painter->drawLine(QPointF(x1,y1),QPointF(x2,y2));

            //第一个点颜色特殊些
            if( angle == maxAngle)
                painter->restore();
        }
    }
}

void Dashbord0::drawIndicator(QPainter *painter)
{
    painter->setBrush(QBrush(QColor(m_colorScale)));
    int radusW = 8;
    painter->drawPie(-radusW,-radusW,radusW*2,radusW*2,0,360*16);

    qreal mValueAngle ;
    if(m_isClockwise)
        mValueAngle = -60 + 300*m_value/m_maxValue ;
    else
        mValueAngle = 240 - 300*m_value/m_maxValue ;

    painter->drawLine(QPointF(0,0),QPointF((m_radius-8)*cos(3.1415926*mValueAngle/180),(m_radius-8)*sin(3.1415926*mValueAngle/180)));
}


void Dashbord0::mousePressEvent(QMouseEvent* event)
{


    if(event->button() == Qt::LeftButton){


    }else if(event->button() == Qt::RightButton){



    }
}

void Dashbord0::mouseMoveEvent(QMouseEvent *event)
{


}

void Dashbord0::mouseReleaseEvent(QMouseEvent *event)
{

}

void Dashbord0::wheelEvent(QWheelEvent *event)
{


}
