import QtQuick 2.0
import "../button"
import Dashbord4 1.0
import QtQuick.Controls 2.5
Rectangle {

    border.width: 1
    border.color: "gray"
    color: "transparent"

    Dashbord4{
        id:dashbord4
        width: parent.width
        height: parent.height

        indicatorColor:"#707070"     //指示器颜色
        linearColor1:"#efefef"    //渐变色1
        linearColor2:"#808080"          //渐变色2
        fontColor:"#808080"      //刻度和刻度值的颜色
        isClockwise:true        //是否顺时针

        centerX: width/2        //圆心的坐标
        centerY: height/2       //圆心的坐标
        outerRingBigRadius:width>height?height/2-40:width/2-40  //外圆环的外圈半径
        outerRingSmallRadius:outerRingBigRadius - 15            //外圆环的内圈半径
        innerRadius:outerRingSmallRadius/2 +20               //内圆的半径

        scaleW: 2               //刻度的宽度
        scaleNumber:100          //多少个刻度
        maxValue: 100           //显示的最大值
        value: 30               //刻度的值
        MouseArea{
            anchors.fill: parent
            onClicked: {
                dashbord4.value += 10
                dashbord4.update();
            }

            onDoubleClicked:{
                dashbord4.isClockwise = !dashbord4.isClockwise
                dashbord4.update();}
        }
    }
}


