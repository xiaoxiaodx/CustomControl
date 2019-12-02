import QtQuick 2.0


Rectangle {


    color: "#191919"
    property alias myModel: dashbordModel




    ListModel{
        id:dashbordModel

    }


    GridView{
        id:gridview1

       model: dashbordModel

       anchors.fill: parent

        cellHeight:parent.height/2
        cellWidth:parent.width/2
        delegate: Rectangle{
            id:gridviewitem
            color: "transparent"
            width: gridview1.cellWidth
            height: gridview1.cellHeight

            Loader{

                x:0
                y:0
                width: parent.width
                height: parent.height
                source : qmlSrc
            }
        }

    }

}
//import Dashbord0 1.0
//import Dashbord1 1.0
//import Dashbord2 1.0
//import Dashbord3 1.0
//import Dashbord4 1.0

//Rectangle {
//    id:root
//    Column{
//        width: parent.width
//        height: parent.height
//        Row {
//            spacing: 2
//            height: parent.height/2
//            width: parent.width
//            Dashbord0{
//                id:dashbord0
//                width: parent.width/3
//                height: parent.height
//                colorEdge: "#000000"    //边颜色
//                colorRadius: "#555555"  //圆内的背景颜色
//                colorScale: "#ff0000"   //刻度的颜色
//                isClockwise:true        //是否顺时针
//                centerX: width/2        //圆心的坐标
//                centerY: height/2       //圆心的坐标
//                radius:width/4         //圆心的半径
//                scaleW: 2               //刻度的宽度
//                scaleNumber:30          //多少个刻度
//                maxValue: 100           //显示的最大值
//                value: 30               //刻度的值

//                MouseArea{
//                    anchors.fill: parent
//                    onClicked: {
//                        dashbord0.value += 10
//                        dashbord0.update();
//                    }
//                }
//            }

//            Dashbord1{

//                id:dashbord1
//                width: parent.width/3
//                height: parent.height
//                firstColor: "#0cdeb6"    //第一阶段颜色
//                sencondColor: "#20aa09"  //第二阶段颜色
//                thirdColor: "#e54193"   //第三阶段颜色
//                indicatorColor:"#aaaaaa"     //指示器颜色
//                fontColor:"#2f7ac2"
//                isClockwise:true        //是否顺时针
//                centerX: width/2        //圆心的坐标
//                centerY: height/2       //圆心的坐标
//                bigRadius:(height>width)?(width/2 - 2):(height/2-2)         //外圆半径
//                arcHeight: 20
//                smallRadius: bigRadius -arcHeight   //内圆半径

//                scaleW: 2               //刻度的宽度
//                scaleNumber:10          //多少个刻度
//                maxValue: 100           //显示的最大值
//                value: 30               //刻度的值
//                MouseArea{
//                    anchors.fill: parent
//                    onClicked: {
//                        dashbord1.value += 10
//                        dashbord1.update();
//                    }

//                    onDoubleClicked:{
//                        dashbord1.isClockwise = !dashbord1.isClockwise
//                        dashbord1.update();}
//                }
//            }

//            Dashbord2{
//                id:dashbord2
//                width: parent.width/3
//                height: parent.height
//                firstColor: "#884eefee"    //第一阶段颜色
//                sencondColor: "#881ffa14"  //第二阶段颜色
//                thirdColor: "#88ea8309"   //第三阶段颜色
//                indicatorColor:"#f84c74"     //指示器颜色
//                outRingColor:"#707070"    //外圆环和内圆的颜色
//                mindleRingColor:"#000000"
//                fontColor:"#dddddd"
//                isClockwise:true        //是否顺时针
//                centerX: width/2        //圆心的坐标
//                centerY: height/2       //圆心的坐标
//                outerRingBigRadius:width>height?height/2-20:width/2-20
//                outerRingSmallRadius:outerRingBigRadius - 10
//                innerRadius:outerRingSmallRadius-20


//                scaleW: 2               //刻度的宽度
//                scaleNumber:50          //多少个刻度
//                maxValue: 100           //显示的最大值
//                value: 30               //刻度的值
//                MouseArea{
//                    anchors.fill: parent
//                    onClicked: {
//                        dashbord2.value += 10
//                        dashbord2.update();
//                    }

//                    onDoubleClicked:{
//                        dashbord2.isClockwise = !dashbord2.isClockwise
//                        dashbord2.update();}
//                }
//            }
//        }

//        Row {
//            spacing: 2
//            height: parent.height/2
//            width: parent.width

//            Dashbord3{
//                id:dashbord3
//                width: parent.width/3
//                height: parent.height
//                firstColor: "#0cdeb6"    //第一阶段颜色
//                sencondColor: "#f4ea2a"  //第二阶段颜色
//                thirdColor: "#ee7a87"   //第三阶段颜色
//                indicatorColor:"#f84c74"     //指示器颜色
//                outRingColor:"#424242"    //外圆环的颜色
//                mindleRingColor:"#323232"          //中间圆环的颜色
//                innerRadiuColor:"#505050" //和内圆的颜色
//                fontColor:"#dddddd"      //刻度和刻度值的颜色
//                isClockwise:true        //是否顺时针
//                isReflective:true       //是否镜面反射
//                centerX: width/2        //圆心的坐标
//                centerY: height/2       //圆心的坐标
//                outerRingBigRadius:width>height?height/2-5:width/2-5  //外圆环的外圈半径
//                outerRingSmallRadius:outerRingBigRadius - 10            //外圆环的内圈半径
//                innerRadius:outerRingSmallRadius/2 +20               //内圆的半径

//                scaleW: 2               //刻度的宽度
//                scaleNumber:100          //多少个刻度
//                maxValue: 100           //显示的最大值
//                value: 30               //刻度的值
//                MouseArea{
//                    anchors.fill: parent
//                    onClicked: {
//                        dashbord3.value += 10
//                        dashbord3.update();
//                    }

//                    onDoubleClicked:{
//                        dashbord3.isClockwise = !dashbord3.isClockwise
//                        dashbord3.update();}
//                }
//            }

//            Dashbord4{
//                id:dashbord4
//                width: parent.width/3
//                height: parent.height

//                indicatorColor:"#707070"     //指示器颜色
//                linearColor1:"#efefef"    //渐变色1
//                linearColor2:"#808080"          //渐变色2
//                fontColor:"#808080"      //刻度和刻度值的颜色
//                isClockwise:true        //是否顺时针

//                centerX: width/2        //圆心的坐标
//                centerY: height/2       //圆心的坐标
//                outerRingBigRadius:width>height?height/2-40:width/2-40  //外圆环的外圈半径
//                outerRingSmallRadius:outerRingBigRadius - 15            //外圆环的内圈半径
//                innerRadius:outerRingSmallRadius/2 +20               //内圆的半径

//                scaleW: 2               //刻度的宽度
//                scaleNumber:100          //多少个刻度
//                maxValue: 100           //显示的最大值
//                value: 30               //刻度的值
//                MouseArea{
//                    anchors.fill: parent
//                    onClicked: {
//                        dashbord4.value += 10
//                        dashbord4.update();
//                    }

//                    onDoubleClicked:{
//                        dashbord4.isClockwise = !dashbord4.isClockwise
//                        dashbord4.update();}
//                }
//            }
//        }

//    }

//}
