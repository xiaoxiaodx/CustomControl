
#include "dashbord1.h"
#include "math.h"


Dashbord1::Dashbord1()
{

    setAcceptedMouseButtons(Qt::LeftButton
                            | Qt::RightButton
                            | Qt::MiddleButton);
    setFlag(QQuickItem::ItemHasContents);


    minAngle = 120;
    maxAngle = 420;

}



//在这里设置原点坐标是因为在构造函数没结束之前，控件的几何信息还未定


void Dashbord1::paint(QPainter *painter)
{

    painter->setRenderHint(QPainter::Antialiasing);

    drawBg(painter);
    drawIndicator(painter);
}


//以中心为原点，水平正方向为正轴，且X轴为0度，逆时针反向为角度增加的反向
void Dashbord1::drawBg(QPainter *painter)
{

    painter->translate(m_centerX,m_centerY);
    QFont font;
    font.setPixelSize(12);
    painter->setFont(font);


    int degreeNum = (maxAngle - minAngle)/3;//每段的弧度数  单位：度
    qreal scaleAngle = (maxAngle - minAngle)/m_scaleNumber;

    QPainterPath circlePath;


    //绘制圆环
    int firstStart = 360- maxAngle;
    QString tmpFirstColor,tmpthirdColor,tmpSecondColor;
    if(m_isClockwise){
        tmpFirstColor = m_firstColor;
        tmpSecondColor = m_sencondColor;
        tmpthirdColor = m_thirdColor;
    }else {
        tmpFirstColor = m_thirdColor;
        tmpSecondColor = m_sencondColor;
        tmpthirdColor = m_firstColor;
    }
    gradientArc(painter,m_bigRadius,firstStart,degreeNum,m_arcHeight,tmpthirdColor);
    gradientArc(painter,m_bigRadius,firstStart + degreeNum,degreeNum,m_arcHeight,tmpSecondColor);
    gradientArc(painter,m_bigRadius,firstStart + degreeNum*2,degreeNum,m_arcHeight,tmpFirstColor);

    //画刻度
    qreal valuePerAngle = m_maxValue/(maxAngle - minAngle);

    for (int deAngle = 0;deAngle<=(maxAngle-minAngle);deAngle+=scaleAngle) {

        int angle ;
        if(m_isClockwise)
            angle = minAngle + deAngle;
        else
            angle = maxAngle - deAngle;

        if(deAngle >= degreeNum*2)
            painter->setPen(QPen(QBrush(QColor(m_thirdColor)),m_scaleW));
        else if(deAngle >= degreeNum)
            painter->setPen(QPen(QBrush(QColor(m_sencondColor)),m_scaleW));
        else if(deAngle >= 0)
            painter->setPen(QPen(QBrush(QColor(m_firstColor)),m_scaleW));

        qreal anglePi = 3.1415926*angle/180;
        qreal x1 = (m_smallRadius)*cos(anglePi);
        qreal y1 = (m_smallRadius)*sin(anglePi);
        qreal x2 = (m_smallRadius-4)*cos(anglePi);
        qreal y2 = (m_smallRadius-4)*sin(anglePi);

        painter->drawLine(QPointF(x1,y1),QPointF(x2,y2));

        int num = deAngle *valuePerAngle;
        QFontMetrics fm(font);
        QRect rect = fm.boundingRect(QString::number(num));
        qreal x3 = (m_smallRadius-20)*cos(anglePi);
        qreal y3 = (m_smallRadius-20)*sin(anglePi);
        painter->setPen(QPen(QBrush(QColor(m_fontColor)),m_scaleW));
        painter->drawText(x3-rect.width()/2,y3+rect.height()/2,QString::number(num));
    }
}


void Dashbord1::gradientArc(QPainter *painter, int radius, int startAngle, int angleLength, int arcHeight, QColor color)
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

void Dashbord1::drawIndicator(QPainter *painter)
{
    painter->setBrush(QBrush(QColor(m_indicatorColor)));
    painter->setPen(Qt::NoPen);

    qreal mValueAngle ;
    if(m_isClockwise)
        mValueAngle = minAngle+ (maxAngle-minAngle)*m_value/m_maxValue ;
    else
        mValueAngle = maxAngle - (maxAngle-minAngle)*m_value/m_maxValue ;

    QPainterPath painterPath;


    //三角形3个点 假设为等边
    int triangleLen = 10;//三角形边长
    qreal zhongxianLen = triangleLen*sin(3.1415926*60/180);
    qreal point1X = (triangleLen/2) * sin(3.1415926*mValueAngle/180);
    qreal point1Y = - (triangleLen/2) * cos(3.1415926*mValueAngle/180);

    qreal point2X = - (triangleLen/2) * sin(3.1415926*mValueAngle/180);
    qreal point2Y =  (triangleLen/2) * cos(3.1415926*mValueAngle/180);

    //指示器尾端（短的一端）
    qreal point3X = -zhongxianLen * cos(3.1415926*mValueAngle/180);
    qreal point3Y = -zhongxianLen * sin(3.1415926*mValueAngle/180);

    //指示器尾端（长的一端）
    qreal pointTipX = (m_smallRadius-30) * cos(3.1415926*mValueAngle/180);
    qreal pointTipY = (m_smallRadius-30) * sin(3.1415926*mValueAngle/180);

    painterPath.moveTo(point1X,point1Y);
    painterPath.lineTo(pointTipX,pointTipY);
    painterPath.lineTo(point2X,point2Y);
    painterPath.lineTo(point3X,point3Y);
    painterPath.moveTo(point1X,point1Y);

    painter->drawPath(painterPath);
}



void Dashbord1::mousePressEvent(QMouseEvent* event)
{


    if(event->button() == Qt::LeftButton){


    }else if(event->button() == Qt::RightButton){



    }
}

void Dashbord1::mouseMoveEvent(QMouseEvent *event)
{


}

void Dashbord1::mouseReleaseEvent(QMouseEvent *event)
{

}

void Dashbord1::wheelEvent(QWheelEvent *event)
{


}
