
#include "Dashbord3.h"
#include "math.h"



Dashbord3::Dashbord3()
{

    setAcceptedMouseButtons(Qt::LeftButton
                            | Qt::RightButton
                            | Qt::MiddleButton);
    setFlag(QQuickItem::ItemHasContents);


    minAngle = 120;
    maxAngle = 420;

}


void Dashbord3::paint(QPainter *painter)
{

    painter->setRenderHint(QPainter::Antialiasing);


    painter->translate(m_centerX,m_centerY);

    drawBg(painter);
    drawIndicator(painter);

}


//以中心为原点，水平正方向为正轴，且X轴为0度，顺时针反向为角度增加的反向
void Dashbord3::drawBg(QPainter *painter)
{


    QFont font;
    font.setPixelSize(15);
    painter->setFont(font);


    int degreeNum = (maxAngle - minAngle)/3;//每段的弧度数  单位：度
    qreal scaleAngle = (maxAngle - minAngle)/m_scaleNumber;

    QPainterPath circlePath;


    //绘制外圆环和内圆
    normalArc(painter,m_outerRingBigRadius,0,360,(m_outerRingBigRadius),m_outRingColor);
    normalArc(painter,m_outerRingSmallRadius,0,360,(m_outerRingSmallRadius-m_innerRadius),m_mindleRingColor);
    normalArc(painter,m_innerRadius,0,360,(m_innerRadius),m_innerRadiuColor);


    //绘制彩色圆环刻度
    int firstStart = 360 - maxAngle;
    QString tmpFirstColor,tmpthirdColor,tmpSecondColor;

    if(!m_isClockwise){
        tmpFirstColor = m_firstColor;
        tmpSecondColor = m_sencondColor;
        tmpthirdColor = m_thirdColor;
    }else {
        tmpFirstColor = m_thirdColor;
        tmpSecondColor = m_sencondColor;
        tmpthirdColor = m_firstColor;
    }

    normalArc(painter,m_innerRadius + 20 ,firstStart,(maxAngle-minAngle)*0.1,20,tmpFirstColor);
    normalArc(painter,m_innerRadius + 20,firstStart + (maxAngle-minAngle)*0.1,(maxAngle-minAngle)*0.1,20,tmpSecondColor);
    normalArc(painter,m_innerRadius + 20,firstStart + (maxAngle-minAngle)*0.2,(maxAngle-minAngle)*0.8,20,tmpthirdColor);

    //画刻度
    qreal valuePerAngle = m_maxValue/(maxAngle - minAngle);
    painter->setPen(QPen(QBrush(QColor(m_fontColor)),m_scaleW));


    QFontMetrics fm(font);
    QRect rect = fm.boundingRect(QString::number(100));

    qreal fontRectSize = rect.width()>rect.height()?rect.width():rect.height();

    qreal scaleValueRingBigRadis = m_outerRingSmallRadius - fontRectSize;//刻度标示值所在的外圆半径
    qreal diffOuterRingInnerRight = scaleValueRingBigRadis - m_innerRadius-20;

    for (int deAngle = 0, i=0;deAngle<=(maxAngle-minAngle);i++,deAngle+=scaleAngle) {

        int angle;
        if(m_isClockwise)
            angle =  minAngle + deAngle;
        else
            angle = maxAngle - deAngle;
        qreal anglePi = 3.1415926*angle/180;
        qreal x1 = (scaleValueRingBigRadis)*cos(anglePi);
        qreal y1 = (scaleValueRingBigRadis)*sin(anglePi);

        qreal x2,y2;
        if(i%10 == 0){
            x2 = (scaleValueRingBigRadis-diffOuterRingInnerRight + 4)*cos(anglePi);
            y2 = (scaleValueRingBigRadis-diffOuterRingInnerRight + 4)*sin(anglePi);


            int deAngle ;
            if(m_isClockwise)
                deAngle = angle - minAngle;
            else
                deAngle = maxAngle - angle;

            int num = deAngle *valuePerAngle;

            QFontMetrics fm(font);
            QRect rect = fm.boundingRect(QString::number(num));

            qreal x3 = (scaleValueRingBigRadis+fontRectSize/2)*cos(anglePi);
            qreal y3 = (scaleValueRingBigRadis+fontRectSize/2)*sin(anglePi);

            painter->setPen(QPen(QBrush(QColor(m_fontColor)),m_scaleW));
            painter->drawText(x3-rect.width()/2,y3+rect.height()/2,QString::number(num));


        }else {
            x2 = (scaleValueRingBigRadis-diffOuterRingInnerRight/2)*cos(anglePi);
            y2 = (scaleValueRingBigRadis-diffOuterRingInnerRight/2)*sin(anglePi);
        }
        painter->drawLine(QPointF(x1,y1),QPointF(x2,y2));


    }


}


void Dashbord3::drawIndicator(QPainter *painter)
{
    painter->setBrush(QBrush(QColor(m_indicatorColor)));
    painter->setPen(Qt::NoPen);

    qreal mValueAngle ;
    int angleOffset = (maxAngle-minAngle)*m_value/m_maxValue;
    if(m_isClockwise)
        mValueAngle = minAngle + angleOffset ;
    else
        mValueAngle = maxAngle - angleOffset ;


    QFont font;
    font.setPixelSize(20);
    painter->setFont(font);
    QFontMetrics fm(font);
    QRect rect = fm.boundingRect(QString::number(100));

    qreal indicatorRingBigRadius = rect.width()+5;
    normalArc(painter,indicatorRingBigRadius,0,360,5,m_indicatorColor);
    drawText1(painter,20,0,-5,"#000000",QString::number(m_value),m_scaleW);


    QPainterPath painterPath;

    qreal point1X = indicatorRingBigRadius * cos(3.1415926*(mValueAngle-15)/180);
    qreal point1Y = indicatorRingBigRadius * sin(3.1415926*(mValueAngle-15)/180);

    qreal point2X = indicatorRingBigRadius * cos(3.1415926*(mValueAngle+15)/180);
    qreal point2Y = indicatorRingBigRadius * sin(3.1415926*(mValueAngle+15)/180);

    qreal pointTipX = (m_innerRadius+20) * cos(3.1415926*mValueAngle/180);
    qreal pointTipY = (m_innerRadius+20) * sin(3.1415926*mValueAngle/180);

    painterPath.moveTo(point1X,point1Y);
    painterPath.lineTo(pointTipX,pointTipY);
    painterPath.lineTo(point2X,point2Y);
    painterPath.lineTo(point1X,point1Y);
    painter->drawPath(painterPath);


    if(m_isReflective){

        drawReflective(painter,m_outerRingSmallRadius);
    }
}





void Dashbord3::mousePressEvent(QMouseEvent* event)
{


    if(event->button() == Qt::LeftButton){


    }else if(event->button() == Qt::RightButton){



    }
}

void Dashbord3::mouseMoveEvent(QMouseEvent *event)
{


}

void Dashbord3::mouseReleaseEvent(QMouseEvent *event)
{

}

void Dashbord3::wheelEvent(QWheelEvent *event)
{


}
