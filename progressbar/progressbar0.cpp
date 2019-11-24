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

        if(m_isScaleBaer)
            normalArc(painter,m_radiusSmall,0,360,m_radiusSmall,m_bgColor);
        else
            normalArc(painter,m_radiusBig,0,360,m_radiusBig,m_bgColor);

    }else if(m_processtype == 1){


        painter->setPen(Qt::NoPen);
        painter->setBrush(QColor(m_bgColor));
        painter->drawRect(m_bordW,m_bordW,m_mWidth-m_bordW*2,m_mHeight-m_bordW*2);

    }
}


void Progressbar0::drawValue(QPainter *painter)
{


    qreal kValue = ((qreal)m_value)/100;
    if(m_processtype == 0){
        qreal angleOffset = 360*kValue;
        qreal offsetY = 2*kValue*m_radiusSmall;
        qreal valueY = m_radiusSmall - offsetY;

        if(m_isClockwise)
            normalArc(painter,m_radiusBig,0,angleOffset,m_bordW,m_bordColor);
        else
            normalArc(painter,m_radiusBig,0,-angleOffset,m_bordW,m_bordColor);

        drawRadiusWave(painter,m_centerX,m_centerY,m_radiusSmall,valueY,m_waveA,m_waveP,m_offset,m_offset2,m_fgColor);

        drawText1(painter,100,0,-5,m_fontColor,QString::number(m_value)+"%",10);


    }else if(m_processtype == 1){

        qreal valueY = m_bordW+m_mHeight - m_mHeight*((qreal)m_value)/100;
        drawRectWave(painter,m_bordW,m_bordW,m_mWidth-m_bordW*2,m_mHeight-m_bordW*2, valueY,m_waveA,m_waveP,m_offset,m_offset2, m_fgColor);
        drawText1(painter,100,width()/2,height()/2-5,m_fontColor,QString::number(m_value)+"%",10);
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
