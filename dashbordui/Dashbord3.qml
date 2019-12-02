import QtQuick 2.0
import Dashbord3 1.0
import "../Button"
import QtQuick.Controls 2.5
Rectangle {

    border.width: 1
    border.color: "gray"
    color: "transparent"
    Dashbord3{
        id:dashbord3
        width: parent.width
        height: parent.height
        firstColor: "#0cdeb6"    //第一阶段颜色
        sencondColor: "#f4ea2a"  //第二阶段颜色
        thirdColor: "#ee7a87"   //第三阶段颜色
        indicatorColor:"#f84c74"     //指示器颜色
        outRingColor:"#424242"    //外圆环的颜色
        mindleRingColor:"#323232"          //中间圆环的颜色
        innerRadiuColor:"#505050" //和内圆的颜色
        fontColor:"#dddddd"      //刻度和刻度值的颜色
        isClockwise:true        //是否顺时针
        isReflective:true       //是否镜面反射
        centerX: width/2        //圆心的坐标
        centerY: height/2       //圆心的坐标
        outerRingBigRadius:width>height?height/2-5:width/2-5  //外圆环的外圈半径
        outerRingSmallRadius:outerRingBigRadius - 10            //外圆环的内圈半径
        innerRadius:outerRingSmallRadius/2 +20               //内圆的半径

        scaleW: 2               //刻度的宽度
        scaleNumber:100          //多少个刻度
        maxValue: 100           //显示的最大值
        value: 30               //刻度的值
        MouseArea{
            anchors.fill: parent
            onClicked: {
                dashbord3.value += 10
                dashbord3.update();
            }

            onDoubleClicked:{
                dashbord3.isClockwise = !dashbord3.isClockwise
                dashbord3.update();}
        }
    }
}
