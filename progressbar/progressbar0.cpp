
#include "Progressbar0.h"
#include "math.h"


Progressbar0::Progressbar0()
{

    setAcceptedMouseButtons(Qt::LeftButton
                            | Qt::RightButton
                            | Qt::MiddleButton);
    setFlag(QQuickItem::ItemHasContents);





    m_offset = 0; //初相位，初值该值不一样，获得waveY也不一样，可试验该值为不同值的时候，曲线的起始点的区别
    m_offset2 = pi;
    connect(&timer,SIGNAL(timeout()),this,SLOT(slot_timeout()));
    timer.start(70);
}


void Progressbar0::slot_timeout(){


    m_offset += 1;
    m_offset2 -=1;
    update();
}
//在这里设置原点坐标是因为在构造函数没结束之前，控件的几何信息还未定


void Progressbar0::paint(QPainter *painter)
{

    painter->setRenderHint(QPainter::Antialiasing);

    drawBg(painter);
    drawValue(painter);
}
//以中心为原点，水平正方向为正轴，且X轴为0度，逆时针反向为角度增加的反向
void Progressbar0::drawBg(QPainter *painter)
{

    if(m_processtype == 0){

        painter->translate(m_centerX,m_centerY);

        if(m_isScaleBaer){

            normalArc(painter,m_radiusSmall,0,360,m_radiusSmall,m_bgColor);

        }else {
            normalArc(painter,m_radiusBig,0,360,m_radiusBig,m_bgColor);

        }

    }else if(m_processtype == 1){


    }
}


void Progressbar0::drawValue(QPainter *painter)
{


    qreal kValue = ((qreal)m_value)/100;
    if(m_processtype == 0){
        qreal angleOffset = 360*kValue;
        qreal offsetY = 2*kValue*m_radiusSmall;
        qreal valueY = m_radiusSmall - offsetY;
        qreal valueX1 = sqrt(m_radiusSmall*m_radiusSmall - valueY*valueY);//正半轴
        qreal valueX2 = -valueX1;



        qreal angle1 = asin(valueY/m_radiusSmall)*180/pi;//正半轴的角度
        qreal angle2 ;
        if(valueY>0)
            angle2 = 180 - angle1;
        else
            angle2 =  - 180 - angle1;;
        //qDebug()<<"value    *** "<<valueX1<<"   "<<valueX2<<"   "<<valueY<<"    "<<angle1<<"    "<<angle2;

        if(m_isClockwise)
            normalArc(painter,m_radiusBig,0,angleOffset,m_bordW,m_bordColor);
        else
            normalArc(painter,m_radiusBig,0,-angleOffset,m_bordW,m_bordColor);


        if(m_isWave){

            QPainterPath wave1; //波浪区域
            wave1.moveTo(valueX2,valueY);
            if(valueY<=0)
                wave1.arcTo(-m_radiusSmall,-m_radiusSmall,m_radiusSmall*2,m_radiusSmall*2,-angle2,180+2*abs(angle1));
            else
                wave1.arcTo(-m_radiusSmall,-m_radiusSmall,m_radiusSmall*2,m_radiusSmall*2,-angle2,angle2-angle1);

            for(int x = m_radiusSmall; x >= -m_radiusSmall; x-=1)  //x从0~w的值而改变，从而得到正弦曲线
            {
                qreal waveY = (double)(m_waveA * sin(m_waveP * x + m_offset))-m_waveA ;// waveY随着x的值改变而改变，从而得到正弦曲线
                qreal actualY = waveY+valueY;
                if((x*x + actualY*actualY)>(m_radiusSmall*m_radiusSmall)){//不在园内不加入绘制路径
                    continue;
                }
                wave1.lineTo(x, actualY);   //从上一个绘制点画一条线到（x，waveY
            }
            painter->setBrush(QColor(m_fgColor)); //填充绿色
            painter->drawPath(wave1);      //绘制出图形



            QPainterPath wave2; //波浪区域
            wave2.moveTo(valueX2,valueY);
            if(valueY<=0)
                wave2.arcTo(-m_radiusSmall,-m_radiusSmall,m_radiusSmall*2,m_radiusSmall*2,-angle2,180+2*abs(angle1));
            else
                wave2.arcTo(-m_radiusSmall,-m_radiusSmall,m_radiusSmall*2,m_radiusSmall*2,-angle2,angle2-angle1);

            for(int x = m_radiusSmall; x >= -m_radiusSmall; x-=1)  //x从0~w的值而改变，从而得到正弦曲线
            {
                qreal waveY = (double)(m_waveA * sin(m_waveP * x + m_offset2))-m_waveA ;// waveY随着x的值改变而改变，从而得到正弦曲线
                qreal actualY = waveY+valueY;
                if((x*x + actualY*actualY)>(m_radiusSmall*m_radiusSmall)){//不在园内不加入绘制路径
                    continue;
                }
                wave2.lineTo(x, actualY);   //从上一个绘制点画一条线到（x，waveY
            }
            painter->setBrush(QColor("#77e8989a")); //填充绿色
            painter->drawPath(wave2);      //绘制出图形
        }



        drawText1(painter,100,0,-5,m_fontColor,QString::number(m_value)+"%",10);


    }else if(m_processtype == 1){


    }
}



void Progressbar0::mousePressEvent(QMouseEvent* event)
{


    if(event->button() == Qt::LeftButton){


    }else if(event->button() == Qt::RightButton){



    }
}

void Progressbar0::mouseMoveEvent(QMouseEvent *event)
{


}

void Progressbar0::mouseReleaseEvent(QMouseEvent *event)
{

}

void Progressbar0::wheelEvent(QWheelEvent *event)
{


}
