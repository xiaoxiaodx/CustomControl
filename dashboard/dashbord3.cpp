
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
    drawText1(painter,20,0,-5,"#000000",QString::number(m_value));


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


void Dashbord3::drawReflective(QPainter *painter,int tradius)
{


    int radius1R = tradius,radius2R = 1.6*tradius;
    int startAngle1 = 20,endAngle1 = 190;
    int deAngle1 = endAngle1 - startAngle1;


    //正弦定理 k
    qreal sinK = radius2R/sin(pi*(180-deAngle1/2)/180);
    qreal halfdeAngle2 = asin(radius1R/sinK) * 180/pi;
    qreal deAngle2 = 2*halfdeAngle2;
    qreal startAngle2 = startAngle1 + deAngle1/2 - deAngle2/2;
    qreal endAngle2 = startAngle2 + deAngle2;
    //2圆心的距离
    qreal deRadius = sinK * sin(pi*(deAngle1/2 - deAngle2/2)/180);

    //第二个圆的圆心位置-------第一个圆的原点在（0,0）
    int radius2X = 0 + deRadius*cos(pi*(180-deAngle1/2-startAngle1)/180);
    int radius2Y = 0 + deRadius*sin(pi*(180-deAngle1/2-startAngle1)/180);
    QPainterPath path;
    QRectF rect(-tradius, -tradius, tradius *2 , tradius * 2);
    path.arcTo(rect, startAngle1, deAngle1);


   // qDebug()<<" radius2X:"<<radius2X<<"  radius2Y:"<<radius2Y<<"  radius2R:"<<radius2R<<"   deAngle1:"<<deAngle1<<" deAngle2:"<<deAngle2<<" "<<180-deAngle1/2-startAngle1;
    QPainterPath subPath;
    subPath.addEllipse(radius2X - radius2R,radius2Y-radius2R,radius2R*2,radius2R*2);
    // path为扇形 subPath为椭圆
    path -= subPath;

    painter->save();
    painter->setPen(Qt::NoPen);
    painter->setBrush(QBrush(QColor("#44ffffff")));
    painter->drawPath(path);
    painter->restore();
}

void Dashbord3::normalArc(QPainter *painter, int radius, int startAngle, int angleLength, int arcHeight, QColor color)
{
    painter->setBrush(color);

    // << 1（左移1位）相当于radius*2 即：150*2=300
    //QRectF(-150, -150, 300, 300)
    QRectF rect(-radius, -radius, radius << 1, radius << 1);
    QPainterPath path;
    path.arcTo(rect, startAngle, angleLength);

    // QRectF(-120, -120, 240, 240)
    QPainterPath subPath;
    subPath.addEllipse(rect.adjusted(arcHeight, arcHeight, -arcHeight, -arcHeight));

    // path为扇形 subPath为椭圆
    path -= subPath;

    painter->setPen(Qt::NoPen);
    painter->drawPath(path);
}




void Dashbord3::gradientArc(QPainter *painter, int radius, int startAngle, int angleLength, int arcHeight, QColor color)
{
    // 渐变色
    QRadialGradient gradient(0, 0, radius);
    gradient.setColorAt(0, Qt::white);
    gradient.setColorAt(1.0, color);

    painter->setBrush(gradient);

    // << 1（左移1位）相当于radius*2 即：150*2=300
    //QRectF(-150, -150, 300, 300)
    QRectF rect(-radius, -radius, radius << 1, radius << 1);
    QPainterPath path;
    path.arcTo(rect, startAngle, angleLength);

    // QRectF(-120, -120, 240, 240)
    QPainterPath subPath;
    subPath.addEllipse(rect.adjusted(arcHeight, arcHeight, -arcHeight, -arcHeight));

    // path为扇形 subPath为椭圆
    path -= subPath;

    painter->setPen(Qt::NoPen);
    painter->drawPath(path);
}

void Dashbord3::gradientArc1(QPainter *painter, int radius, int startAngle, int angleLength, int arcHeight, QGradient gradient)
{
    painter->setBrush(gradient);

    // << 1（左移1位）相当于radius*2 即：150*2=300
    //QRectF(-150, -150, 300, 300)
    QRectF rect(-radius, -radius, radius << 1, radius << 1);
    QPainterPath path;
    path.arcTo(rect, startAngle, angleLength);

    // QRectF(-120, -120, 240, 240)
    QPainterPath subPath;
    subPath.addEllipse(rect.adjusted(arcHeight, arcHeight, -arcHeight, -arcHeight));

    // path为扇形 subPath为椭圆
    path -= subPath;

    painter->setPen(Qt::NoPen);
    painter->drawPath(path);

}

void Dashbord3::drawText1(QPainter *painter,int size,qreal tX,qreal tY,QString colorStr,QString str)
{

    painter->save();
    QFont font;
    font.setPixelSize(size);
    painter->setFont(font);

    QFontMetrics fm(font);
    QRect rect = fm.boundingRect(str);

    painter->setPen(QPen(QBrush(QColor(colorStr)),m_scaleW));
    painter->drawText(tX-rect.width()/2,tY+rect.height()/2,str);
    painter->restore();
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
