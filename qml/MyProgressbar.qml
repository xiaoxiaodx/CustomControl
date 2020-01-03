import QtQuick 2.0

import Progressbar0 1.0
import QtQuick.Controls 2.5

Rectangle {
    id:root
    color: "#191919"
    property alias myModel: processbarModel




    ListModel{
        id:processbarModel

    }


    GridView{
        id:gridview1

        model: processbarModel

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
//    Column{
//        width: parent.width
//        height: parent.height
//        Row {
//            spacing: 2
//            height: parent.height/2
//            width: parent.width

//            Rectangle{
//                id:rectprogressbar0
//                width: parent.width/3
//                height: parent.height - sliderRow.height
//                Progressbar0{
//                    id:progressbar0
//                    width: parent.width
//                    height: parent.height
//                    bgColor:"#707070"
//                    fgColor: "#e8989a"
//                    bordColor: "#dc4151"
//                    processtype:0
//                    isClockwise:false
//                    isWave:true
//                    value:70
//                    waveA:5
//                    waveP:0.1
//                    fontColor:"#ffffff"
//                    bordW: 4

//                    //圆属性
//                    isScaleBaer:true
//                    radiusBig:width>height?height/2-4:width/2-4

//                    radiusSmall: radiusBig-bordW - 2
//                    centerX:width/2
//                    centerY: height/2
//                    //矩形属性
//                    mWidth: width-4
//                    mHeight: height-4
//                }

//                Column{
//                    id:sliderRow
//                    width: parent.width

//                    anchors.top:progressbar0.bottom


//                    Slider {
//                        id:sliderWaveA

//                        from: 1
//                        value: 50
//                        to: 100
//                        anchors.horizontalCenter: parent.horizontalCenter
//                        onValueChanged: {

//                            progressbar0.waveA = 10*(value/100)

//                        }
//                    }
//                    Slider {
//                        id:sliderWaveP
//                        from: 1
//                        value: 50
//                        to: 100
//                        anchors.horizontalCenter: parent.horizontalCenter
//                        onValueChanged: {

//                            progressbar0.waveP = 0.2*(value/100)

//                        }
//                    }
//                    Slider {
//                        id:sliderWaveV
//                        from: 1
//                        value: 70
//                        to: 100
//                        anchors.horizontalCenter: parent.horizontalCenter
//                        onValueChanged: {

//                            progressbar0.value = value

//                        }
//                    }
//                    Switch{
//                        anchors.horizontalCenter: parent.horizontalCenter

//                        onCheckedChanged: {
//                            if(checked)
//                                progressbar0.processtype = 1;
//                            else
//                                progressbar0.processtype = 0;
//                        }
//                    }


//                }
//            }

//        }
//    }
}
