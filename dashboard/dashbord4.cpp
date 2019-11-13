
#include "Dashbord4.h"




Dashbord4::Dashbord4()
{

    setAcceptedMouseButtons(Qt::LeftButton
                            | Qt::RightButton
                            | Qt::MiddleButton);
    setFlag(QQuickItem::ItemHasContents);


    minAngle = 120;
    maxAngle = 420;

}


void Dashbord4::paint(QPainter *painter)
{

    painter->setRenderHint(QPainter::Antialiasing);


    painter->translate(m_centerX,m_centerY);

    drawBg(painter);
    drawIndicator(painter);

}


//以中心为原点，水平正方向为正轴，且X轴为0度，顺时针反向为角度增加的反向
void Dashbord4::drawBg(QPainter *painter)
{


    QFont font;
    font.setPixelSize(15);
    painter->setFont(font);
    painter->setPen(QPen(QBrush(QColor(m_fontColor)),m_scaleW));
    QFontMetrics fm(font);
    QRect rect = fm.boundingRect(QString::number(100));
    qreal fontRectSize = rect.width()>rect.height()?rect.width():rect.height();

    int degreeNum = (maxAngle - minAngle)/3;//每段的弧度数  单位：度
    qreal scaleAngle = (maxAngle - minAngle)/m_scaleNumber;


    QPainterPath circlePath;
    //绘制圆环
    QLinearGradient linearGradient(0, m_outerRingBigRadius, 0, -m_outerRingBigRadius);
    linearGradient.setColorAt(0, m_linearColor1);
    linearGradient.setColorAt(1.0, m_linearColor2);
    gradientArc1(painter,m_outerRingBigRadius,0,360,m_outerRingBigRadius-m_outerRingSmallRadius,linearGradient);

    QLinearGradient linearGradient1(0, m_outerRingSmallRadius, 0, -m_outerRingSmallRadius);
    linearGradient1.setColorAt(0, m_linearColor2);
    linearGradient1.setColorAt(1.0, m_linearColor1);
    gradientArc1(painter,m_outerRingSmallRadius,0,360,(m_outerRingSmallRadius-fontRectSize),linearGradient1);


    qreal valuePerAngle = m_maxValue/(maxAngle - minAngle);


    QLinearGradient linearGradient2(0, fontRectSize, 0, -fontRectSize);
    linearGradient2.setColorAt(0, m_linearColor1);
    linearGradient2.setColorAt(1.0, m_linearColor2);
    gradientArc1(painter,fontRectSize,0,360,(fontRectSize),linearGradient2);

    //画刻度



    qreal scaleRingSmallRadius = m_outerRingBigRadius + 2 ;//刻度所在的外圆的起始半径
    qreal scaleValueRingBigRadis = scaleRingSmallRadius + 10 ;//刻度标示值所在的外圆起始半径
    qreal outerRingLen = scaleValueRingBigRadis - scaleRingSmallRadius;
    for (int deAngle = 0, i=0;deAngle<=(maxAngle-minAngle);i++,deAngle+=scaleAngle) {

        int angle;
        if(m_isClockwise)
            angle =  minAngle + deAngle;
        else
            angle = maxAngle - deAngle;
        qreal anglePi = 3.1415926*angle/180;
        qreal x1 = (scaleRingSmallRadius)*cos(anglePi);
        qreal y1 = (scaleRingSmallRadius)*sin(anglePi);

        qreal x2,y2;
        if(i%10 == 0){
            x2 = (scaleValueRingBigRadis)*cos(anglePi);
            y2 = (scaleValueRingBigRadis)*sin(anglePi);


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
            x2 = (scaleValueRingBigRadis-outerRingLen/2)*cos(anglePi);
            y2 = (scaleValueRingBigRadis-outerRingLen/2)*sin(anglePi);
        }
        painter->drawLine(QPointF(x1,y1),QPointF(x2,y2));

    }


}


void Dashbord4::drawIndicator(QPainter *painter)
{
    painter->setBrush(QBrush(QColor(m_indicatorColor)));
    painter->setPen(Qt::NoPen);

    qreal mValueAngle ;
    int angleOffset = (maxAngle-minAngle)*m_value/m_maxValue;
    if(m_isClockwise)
        mValueAngle = minAngle + angleOffset ;
    else
        mValueAngle = maxAngle - angleOffset ;


    //    QFont font;
    //    font.setPixelSize(20);
    //    painter->setFont(font);
    //    QFontMetrics fm(font);
    //    QRect rect = fm.boundingRect(QString::number(100));


    drawText1(painter,20,0,-3,"#000000",QString::number(m_value),m_scaleW);


    qreal indicatorTipRadius = m_outerRingSmallRadius - 10;

    //假设指示器是一个边长为10的等边三角形
    qreal indicatorTriangleLen = 10;

    qreal radius1 = sqrt((indicatorTipRadius-indicatorTriangleLen)*(indicatorTipRadius-indicatorTriangleLen) + indicatorTriangleLen*indicatorTriangleLen/4);

    qreal halfAngle = asin(indicatorTriangleLen*sin(30)/radius1)*180/pi;

    qreal angle1 = mValueAngle - halfAngle;
    qreal angle2 = mValueAngle + halfAngle;

    QPainterPath painterPath;

    qreal pointTipX = indicatorTipRadius * cos(3.1415926*mValueAngle/180);
    qreal pointTipY = indicatorTipRadius * sin(3.1415926*mValueAngle/180);

    qreal point1X = radius1 * cos(3.1415926*angle1/180);
    qreal point1Y = radius1 * sin(3.1415926*angle1/180);

    qreal point2X = radius1 * cos(3.1415926*angle2/180);
    qreal point2Y = radius1 * sin(3.1415926*angle2/180);

    painterPath.moveTo(pointTipX,pointTipY);
    painterPath.lineTo(point1X,point1Y);
    painterPath.lineTo(point2X,point2Y);
    painterPath.lineTo(pointTipX,pointTipY);

    painter->drawPath(painterPath);


}




void Dashbord4::mousePressEvent(QMouseEvent* event)
{


    if(event->button() == Qt::LeftButton){


    }else if(event->button() == Qt::RightButton){



    }
}

void Dashbord4::mouseMoveEvent(QMouseEvent *event)
{


}

void Dashbord4::mouseReleaseEvent(QMouseEvent *event)
{

}

void Dashbord4::wheelEvent(QWheelEvent *event)
{


}
