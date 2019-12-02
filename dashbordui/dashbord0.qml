import Dashbord0 1.0
import QtQuick 2.0
Rectangle {

    border.width: 1
    border.color: "gray"
    color: "transparent"

    Dashbord0{
        id:dashbord0
        width: parent.width
        height: parent.height
        colorEdge: "#000000"    //边颜色
        colorRadius: "#555555"  //圆内的背景颜色
        colorScale: "#ff0000"   //刻度的颜色
        isClockwise:true        //是否顺时针
        centerX: width/2        //圆心的坐标
        centerY: height/2       //圆心的坐标
        radius:width/4         //圆心的半径
        scaleW: 1               //刻度的宽度
        scaleNumber:30          //多少个刻度
        maxValue: 100           //显示的最大值
        value: 30               //刻度的值

        MouseArea{
            anchors.fill: parent
            onClicked: {
                dashbord0.value += 10
                dashbord0.update();
            }
        }
    }
}
