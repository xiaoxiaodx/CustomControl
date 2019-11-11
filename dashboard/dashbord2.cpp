
#include "Dashbord2.h"
#include "math.h"



Dashbord2::Dashbord2()
{

    setAcceptedMouseButtons(Qt::LeftButton
                            | Qt::RightButton
                            | Qt::MiddleButton);
    setFlag(QQuickItem::ItemHasContents);


    minAngle = 120;
    maxAngle = 420;

}


void Dashbord2::paint(QPainter *painter)
{

    painter->setRenderHint(QPainter::Antialiasing);


    painter->translate(m_centerX,m_centerY);

    drawBg(painter);
    drawIndicator(painter);

}


//以中心为原点，水平正方向为正轴，且X轴为0度，顺时针反向为角度增加的反向
void Dashbord2::drawBg(QPainter *painter)
{


    QFont font;
    font.setPixelSize(12);
    painter->setFont(font);


    int degreeNum = (maxAngle - minAngle)/3;//每段的弧度数  单位：度
    qreal scaleAngle = (maxAngle - minAngle)/m_scaleNumber;

    QPainterPath circlePath;


    //绘制圆环
    int firstStart = maxAngle- degreeNum;
    QString tmpFirstColor,tmpthirdColor,tmpSecondColor;


    normalArc(painter,m_outerRingBigRadius,0,360,(m_outerRingBigRadius-m_outerRingSmallRadius),m_outRingColor);
    normalArc(painter,m_outerRingSmallRadius,0,360,(m_outerRingSmallRadius-m_innerRadius),m_mindleRingColor);
    normalArc(painter,m_innerRadius,0,360,(m_innerRadius),m_outRingColor);




    //画刻度
    qreal valuePerAngle = m_maxValue/(maxAngle - minAngle);
    painter->setPen(QPen(QBrush(QColor(m_fontColor)),m_scaleW));

    qreal diffOuterRingInnerRight = m_outerRingSmallRadius - m_innerRadius;

    for (int deAngle = 0, i=0;deAngle<=(maxAngle-minAngle);i++,deAngle+=scaleAngle) {

        int angle;
        if(m_isClockwise)
            angle =  minAngle + deAngle;
        else
            angle = maxAngle - deAngle;
        qreal anglePi = 3.1415926*angle/180;
        qreal x1 = (m_outerRingSmallRadius)*cos(anglePi);
        qreal y1 = (m_outerRingSmallRadius)*sin(anglePi);

        qreal x2,y2;
        if(i%5 == 0){
            x2 = (m_outerRingSmallRadius-diffOuterRingInnerRight)*cos(anglePi);
            y2 = (m_outerRingSmallRadius-diffOuterRingInnerRight)*sin(anglePi);


            int deAngle ;
            if(m_isClockwise)
                deAngle = angle - minAngle;
            else
                deAngle = maxAngle - angle;

            int num = deAngle *valuePerAngle;

            QFontMetrics fm(font);
            QRect rect = fm.boundingRect(QString::number(num));

            qreal x3 = (m_innerRadius-20)*cos(anglePi);
            qreal y3 = (m_innerRadius-20)*sin(anglePi);

            painter->setPen(QPen(QBrush(QColor(m_fontColor)),m_scaleW));
            painter->drawText(x3-rect.width()/2,y3+rect.height()/2,QString::number(num));


        }else {
            x2 = (m_outerRingSmallRadius-2*diffOuterRingInnerRight/3)*cos(anglePi);
            y2 = (m_outerRingSmallRadius-2*diffOuterRingInnerRight/3)*sin(anglePi);
        }
        painter->drawLine(QPointF(x1,y1),QPointF(x2,y2));


    }
}

void Dashbord2::normalArc(QPainter *painter, int radius, int startAngle, int angleLength, int arcHeight, QColor color)
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

void Dashbord2::gradientArc(QPainter *painter, int radius, int startAngle, int angleLength, int arcHeight, QColor color)
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

void Dashbord2::gradientArc1(QPainter *painter, int radius, int startAngle, int angleLength, int arcHeight, QGradient gradient)
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

void Dashbord2::drawIndicator(QPainter *painter)
{
    painter->setBrush(QBrush(QColor(m_indicatorColor)));
    painter->setPen(Qt::NoPen);

    qreal mValueAngle ;
    int angleOffset = (maxAngle-minAngle)*m_value/m_maxValue;
    if(m_isClockwise)
        mValueAngle = minAngle + angleOffset ;
    else
        mValueAngle = maxAngle - angleOffset ;


    QPainterPath painterPath;

    //三角形3个点 假设为等边
    int triangleLen = 10;//三角形边长
    qreal point1X = triangleLen * cos(3.1415926*(mValueAngle-30)/180);
    qreal point1Y = triangleLen * sin(3.1415926*(mValueAngle-30)/180);

    qreal point2X = triangleLen * cos(3.1415926*(mValueAngle+30)/180);
    qreal point2Y = triangleLen * sin(3.1415926*(mValueAngle+30)/180);

    qreal pointTipX = (m_innerRadius-30) * cos(3.1415926*mValueAngle/180);
    qreal pointTipY = (m_innerRadius-30) * sin(3.1415926*mValueAngle/180);

    painterPath.moveTo(0,0);
    painterPath.lineTo(point1X,point1Y);
    painterPath.lineTo(pointTipX,pointTipY);
    painterPath.lineTo(point2X,point2Y);
    painterPath.lineTo(0,0);
    painter->drawPath(painterPath);

    normalArc(painter,triangleLen,0,360,triangleLen,m_indicatorColor);
    normalArc(painter,triangleLen+5,0,360,10,"#88f84c74");

    drawText1(painter,30,0,(m_innerRadius-20),"#ffffff",QString::number(m_value));

    //一段颜色都有3种颜色渐变
     qreal diffOuterRingInnerRight = m_outerRingSmallRadius - m_innerRadius;
    int startAngle;
    QConicalGradient gradient;
    gradient.setAngle(-60);
    gradient.setCenter(0,0);



    if(m_isClockwise){
        startAngle = 360 - mValueAngle;
        gradient.setColorAt(0,m_thirdColor);
        gradient.setColorAt(0.27,m_sencondColor);
        gradient.setColorAt(0.55,m_firstColor);
    }else{
        gradient.setAngle(-60);
        gradient.setColorAt(0,m_firstColor);
        gradient.setColorAt(0.27,m_sencondColor);
        gradient.setColorAt(0.55,m_thirdColor);
        startAngle = 360 - maxAngle;

    }
    //画圆弧时是逆时针方向来的
    normalArc(painter,m_outerRingSmallRadius - diffOuterRingInnerRight/3,startAngle,angleOffset,diffOuterRingInnerRight/3,"#dddddddd");
    gradientArc1(painter,m_outerRingSmallRadius,startAngle,angleOffset,diffOuterRingInnerRight,gradient);


}

void Dashbord2::drawText1(QPainter *painter,int size,qreal tX,qreal tY,QString colorStr,QString str)
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

void Dashbord2::mousePressEvent(QMouseEvent* event)
{


    if(event->button() == Qt::LeftButton){


    }else if(event->button() == Qt::RightButton){



    }
}

void Dashbord2::mouseMoveEvent(QMouseEvent *event)
{


}

void Dashbord2::mouseReleaseEvent(QMouseEvent *event)
{

}

void Dashbord2::wheelEvent(QWheelEvent *event)
{


}
