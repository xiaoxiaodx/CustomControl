import QtQuick 2.0
import Dashbord1 1.0
import "../Button"
import QtQuick.Controls 2.5
Rectangle {

    border.width: 1
    border.color: "gray"
    color: "transparent"

    Dashbord1{

        id:dashbord1
        width: parent.width
        height: parent.height
        firstColor: "#0cdeb6"    //第一阶段颜色
        sencondColor: "#20aa09"  //第二阶段颜色
        thirdColor: "#e54193"   //第三阶段颜色
        indicatorColor:"#aaaaaa"     //指示器颜色
        fontColor:"#2f7ac2"
        isClockwise:true        //是否顺时针
        centerX: width/2        //圆心的坐标
        centerY: height/2       //圆心的坐标
        bigRadius:(height>width)?(width/2 - 2):(height/2-2)         //外圆半径
        arcHeight: 20
        smallRadius: bigRadius -arcHeight   //内圆半径

        scaleW: 2               //刻度的宽度
        scaleNumber:10          //多少个刻度
        maxValue: 100           //显示的最大值
        value: 30               //刻度的值
        MouseArea{
            anchors.fill: parent
            onClicked: {
                dashbord1.value += 10
                dashbord1.update();
            }

            onDoubleClicked:{
                dashbord1.isClockwise = !dashbord1.isClockwise
                dashbord1.update();}
        }
    }
}
