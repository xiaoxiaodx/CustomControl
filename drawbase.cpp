#include "drawbase.h"

DrawBase::DrawBase()
{

}


/*
 * 请参考  gradientArc，次函数画一个纯色的圆环而不是渐变色
*/
void DrawBase::normalArc(QPainter *painter, int radius, int startAngle, int angleLength, int arcHeight, QColor color)
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



/*
 * radius：圆环半径
 * startAngle：起始角度。单位为度（根据坐标系的不同 ，角度递增的方向不同，有时为顺有时为逆）
 * angleLength：旋转的角度。单位为度
 * arcHeight：沿着半径方向的圆环高度，圆环都是内向缩减的高度
 * color：圆环的颜色，会自动生成一个白色到color 的渐变色
*/
void DrawBase::gradientArc(QPainter *painter, int radius, int startAngle, int angleLength, int arcHeight, QColor color)
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

/*
 * 请参考  gradientArc，此处传参数为渐变色
*/
void DrawBase::gradientArc1(QPainter *painter, int radius, int startAngle, int angleLength, int arcHeight, QGradient gradient)
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
/*
 * 绘制文本
 * size：文字的大小
 * tX：文本的正中心X坐标
 * tY：文本的正中心Y坐标
 * colorStr：颜色，例如   "#ff00000"代表红色
 * str:显示的文本
 * penSize：画笔笔痕的宽度
*/

void DrawBase::drawText1(QPainter *painter,int size,qreal tX,qreal tY,QString colorStr,QString str,int penSize)
{

    painter->save();
    QFont font;
    font.setPixelSize(size);
    painter->setFont(font);

    QFontMetrics fm(font);
    QRect rect = fm.boundingRect(str);

    painter->setPen(QPen(QBrush(QColor(colorStr)),penSize));
    painter->drawText(tX-rect.width()/2,tY+rect.height()/2,str);
    painter->restore();
}

void DrawBase::drawReflective(QPainter *painter,int tradius)
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

/*
 * 在圆形里面绘制一个带波浪的进度条
 *
 * 默认圆心位置为控件的中心，切Y正方形向下
 *
 * radius：圆半径
 * valueY：由上往下，进度条的值所在的Y值
 * A：正弦波浪的振幅
 * W：正弦波浪的周期
 * P1：正弦波浪的相位
 * P2：正弦波浪的相位
 * color:所绘制图形的颜色
 *
*/
void DrawBase::drawRadiusWave(QPainter *painter,qreal radiusCenterX,qreal radiusCenterY,qreal radius,qreal valueY,qreal A,qreal W,qreal P1,qreal P2,QString color)
{

    painter->save();
    qreal valueX1 = sqrt(radius*radius - valueY*valueY);//正半轴
    qreal valueX2 = -valueX1;

    qreal angle1 = asin(valueY/radius)*180/pi;//正半轴的角度
    qreal angle2 ;
    if(valueY>0)
        angle2 = 180 - angle1;
    else
        angle2 =  - 180 - angle1;;



        QPainterPath wave1; //波浪区域
        wave1.moveTo(valueX2,valueY);
        if(valueY<=0)
            wave1.arcTo(-radius,-radius,radius*2,radius*2,-angle2,180+2*abs(angle1));
        else
            wave1.arcTo(-radius,-radius,radius*2,radius*2,-angle2,angle2-angle1);

        for(int x = radius; x >= -radius; x-=1)  //x从0~w的值而改变，从而得到正弦曲线
        {
            qreal waveY = (double)(A * sin(W * x + P1))-A ;// waveY随着x的值改变而改变，从而得到正弦曲线
            qreal actualY = waveY+valueY;
            if((x*x + actualY*actualY)>(radius*radius)){//不在园内不加入绘制路径
                continue;
            }
            wave1.lineTo(x, actualY);   //从上一个绘制点画一条线到（x，waveY
        }
        painter->setBrush(QColor(color));
        painter->drawPath(wave1);      //绘制出图形



        QPainterPath wave2; //波浪区域
        wave2.moveTo(valueX2,valueY);
        if(valueY<=0)
            wave2.arcTo(-radius,-radius,radius*2,radius*2,-angle2,180+2*abs(angle1));
        else
            wave2.arcTo(-radius,-radius,radius*2,radius*2,-angle2,angle2-angle1);

        for(int x = radius; x >= -radius; x-=1)  //x从0~w的值而改变，从而得到正弦曲线
        {
            qreal waveY = (double)(A * sin(W * x + P2))-A ;// waveY随着x的值改变而改变，从而得到正弦曲线
            qreal actualY = waveY+valueY;
            if((x*x + actualY*actualY)>(radius*radius)){//不在园内不加入绘制路径
                continue;
            }
            wave2.lineTo(x, actualY);   //从上一个绘制点画一条线到（x，waveY
        }
        QString tmpColor = color.insert(1,"77");
        painter->setBrush(QColor(tmpColor));
        painter->drawPath(wave2);
        painter->restore();
}

/*
 * 在矩形里面绘制一个带波浪的进度条
 *
 * 默认坐标的位置为
 *
 * startX：矩形起始位置X
 * startY：矩形起始位置Y
 * w:矩形宽度
 * h:矩形高度
 * valueY:值所在的Y值坐标
 * A：正弦波浪的振幅
 * W：正弦波浪的周期
 * P1：正弦波浪的相位
 * P2：正弦波浪的相位
 * color:所绘制图形的颜色
 *
*/
void DrawBase::drawRectWave(QPainter *painter,qreal startX,qreal startY,qreal w,qreal h,qreal valueY,qreal A,qreal W,qreal P1,qreal P2,QString color)
{

    painter->save();
    painter->setPen(Qt::NoPen);


    QPainterPath wave1; //波浪区域

    wave1.moveTo(startX,valueY);
    for(int x = startX; x <= (startX+w); x+=1)  //x从0~w的值而改变，从而得到正弦曲线
    {
        qreal waveY = (double)(A * sin(W * x + P1))-A ;// waveY随着x的值改变而改变，从而得到正弦曲线
        qreal actualY = waveY+valueY;

        wave1.lineTo(x, actualY);   //从上一个绘制点画一条线到（x，waveY
    }
    wave1.lineTo(startX+w, startY+h);
    wave1.lineTo(startX,startY+h);
    painter->setBrush(QColor(color));
    painter->drawPath(wave1);      //绘制出图形



    QPainterPath wave2; //波浪区域
    wave2.moveTo(startX,valueY);
    for(int x = startX; x <= (startX+w); x+=1)  //x从0~w的值而改变，从而得到正弦曲线
    {
        qreal waveY = (double)(A * sin(W * x + P2))-A ;// waveY随着x的值改变而改变，从而得到正弦曲线
        qreal actualY = waveY+valueY;

        wave2.lineTo(x, actualY);   //从上一个绘制点画一条线到（x，waveY
    }
    wave2.lineTo(startX+w, startY+h);
    wave2.lineTo(startX,startY+h);
    QString tmpColor = color.insert(1,"77");
    painter->setBrush(QColor(tmpColor)); //填充绿色
    painter->drawPath(wave2);      //绘制出图形
    painter->restore();
}
