
#include "dashbord5.h"


Dashbord5::Dashbord5()
{

//    setAcceptedMouseButtons(Qt::LeftButton
//                            | Qt::RightButton
//                            | Qt::MiddleButton);

    preIndex = -1;
    curIndex = -1;
    setAcceptHoverEvents(true);
    setAcceptedMouseButtons(Qt::AllButtons);
    setFlag(ItemAcceptsInputMethod, true);
    setFlag(QQuickItem::ItemHasContents);
}


void Dashbord5::paint(QPainter *painter)
{

    painter->setRenderHint(QPainter::Antialiasing);


    painter->translate(m_centerX,m_centerY);

    drawBg(painter);
    drawIndicator(painter);

}


//以中心为原点，水平正方向为正轴，且X轴为0度，顺时针反向为角度增加的反向
void Dashbord5::drawBg(QPainter *painter)
{


    gradientArc(painter,m_outerRadius,0,360,m_outerRadius-m_innerRadius,m_outerRadiusColor);
    gradientArc(painter,m_innerRadius+10,0,360,m_innerRadius+10,m_innerRadiusColor);

    if(curIndex>-1){
        int deAngle = 360/m_keyNum;
        qreal halfdeAngle = deAngle/2;
        qreal curAngle = 360-deAngle*curIndex;
        //qDebug()<<" curAngle:"<<curAngle<<" "<<curAngle-halfdeAngle<<"  "<<curAngle+halfdeAngle;
        gradientArc(painter,m_outerRadius,curAngle-halfdeAngle,deAngle,m_outerRadius,showKeyBgColor);
    }
    pixmap.load(m_centerImg);
    painter->drawPixmap( - m_innerRadius,-m_innerRadius,2*m_innerRadius,2*m_innerRadius,pixmap);
}


void Dashbord5::drawIndicator(QPainter *painter)
{

    int deAngle = 360/m_keyNum;

    int keyRadius = m_outerRadius-20;


    for (int i=0;i<m_keyNum;i++) {
        if(i == curIndex){
            drawTriangle(painter,keyRadius,m_triAngleLen,i*deAngle,m_selectKeyColor);
        }else
            drawTriangle(painter,keyRadius,m_triAngleLen,i*deAngle,m_keyColor);
    }

}




void Dashbord5::mousePressEvent(QMouseEvent* event)
{

    qDebug()<<" mousePressEvent  ";

    qreal curX = event->x()- m_centerX;
    qreal curY = event->y()- m_centerY;


    qreal hypotenuse = sqrt(curX*curX + curY*curY);

    if(hypotenuse >= m_outerRadius)
        return;

    if(event->button() == Qt::LeftButton){
        showKeyBgColor = m_pressKeyBgColor;
        update();

    }else if(event->button() == Qt::RightButton){



    }
}

void Dashbord5::mouseMoveEvent(QMouseEvent *event)
{

}

void Dashbord5::hoverMoveEvent(QHoverEvent* event) {
       QQuickItem::hoverMoveEvent(event);
    QPoint pt = event->pos();


    qreal curX = pt.rx()- m_centerX;
    qreal curY = pt.ry()- m_centerY;


    qreal hypotenuse = sqrt(curX*curX + curY*curY);

    if(hypotenuse >= m_outerRadius){
        curIndex = -1;
        if(preIndex != curIndex)
            update();
        preIndex = curIndex;

        return;
    }
    qreal angle = abs(180*asin(curY/hypotenuse)/pi);

    if(curX>0 && curY==0)//X正轴
        angle = 0;
    else if(curX > 0 && curY>0)//第一象限
        ;
    else if(curX==0 && curY>0)//Y正轴
        angle = 90;
    else if(curX<0 && curY>0 )//第二象限
        angle = 180 - angle;
    else if(curX<0 && curY==0 )//X负轴
        angle = 180;
    else if(curX<0 && curY<0 )//第三象限
        angle = 180 + angle;
    else if(curX==0 && curY<0 )//Y负轴
        angle = 270;
    else if(curX>0 && curY<0 )//第四象限
        angle = 360 - angle;
    else
        return;

    qreal deAngle = 360/m_keyNum;

    qreal startAngle = 0-deAngle/2;



    if(angle>=(360-deAngle/2) && angle <= 360)
            curIndex = 0;
    else
        curIndex = (angle-startAngle)/deAngle;

    if(curIndex != preIndex){
        showKeyBgColor = m_selectBgColor;
        update();
    }

    preIndex = curIndex;




   // qDebug()<<" mouseMoveEvent  "<<deAngle<<"  "<<(angle-startAngle)<<"  "<<curIndex<<"    "<<360-45*(curIndex)<<"  "<<45*(curIndex);
}

void Dashbord5::mouseReleaseEvent(QMouseEvent *event)
{
    qreal curX = event->x()- m_centerX;
    qreal curY = event->y()- m_centerY;


    qreal hypotenuse = sqrt(curX*curX + curY*curY);

    if(hypotenuse >= m_outerRadius)
        return;

    showKeyBgColor = m_selectBgColor;
    update();
}

void Dashbord5::wheelEvent(QWheelEvent *event)
{


}
