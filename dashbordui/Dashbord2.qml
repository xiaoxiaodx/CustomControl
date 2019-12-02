import QtQuick 2.0
import Dashbord2 1.0
import "../Button"
import QtQuick.Controls 2.5
Rectangle {

    border.width: 1
    border.color: "gray"
    color: "transparent"

    Dashbord2{
        id:dashbord2
        width: parent.width
        height: parent.height
        firstColor: "#884eefee"    //第一阶段颜色
        sencondColor: "#881ffa14"  //第二阶段颜色
        thirdColor: "#88ea8309"   //第三阶段颜色
        indicatorColor:"#f84c74"     //指示器颜色
        outRingColor:"#707070"    //外圆环和内圆的颜色
        mindleRingColor:"#000000"
        fontColor:"#dddddd"
        isClockwise:true        //是否顺时针
        centerX: width/2        //圆心的坐标
        centerY: height/2       //圆心的坐标
        outerRingBigRadius:width>height?height/2-20:width/2-20
        outerRingSmallRadius:outerRingBigRadius - 10
        innerRadius:outerRingSmallRadius-20


        scaleW: 2               //刻度的宽度
        scaleNumber:50          //多少个刻度
        maxValue: 100           //显示的最大值
        value: 30               //刻度的值
        MouseArea{
            anchors.fill: parent
            onClicked: {
                dashbord2.value += 10
                dashbord2.update();
            }

            onDoubleClicked:{
                dashbord2.isClockwise = !dashbord2.isClockwise
                dashbord2.update();}
        }
    }
}

