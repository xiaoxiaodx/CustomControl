import QtQuick 2.0

import Progressbar0 1.0
import QtQuick.Controls 2.5
Rectangle {
    id:root

    Column{
        width: parent.width
        height: parent.height
        Row {
            spacing: 2
            height: parent.height/2
            width: parent.width

            Rectangle{
                id:rectprogressbar0
                width: parent.width/3
                height: parent.height - sliderRow.height
                Progressbar0{
                    id:progressbar0
                    width: parent.width
                    height: parent.height
                    bgColor:"#707070"
                    fgColor: "#e8989a"
                    bordColor: "#dc4151"
                    processtype:0
                    isClockwise:true
                    isWave:true
                    value:70
                    waveA:5
                    waveP:0.1
                    fontColor:"#ffffff"


                    //圆属性
                    isScaleBaer:true
                    radiusBig:width>height?height/2-4:width/2-4
                    bordW: 4
                    radiusSmall: radiusBig-bordW - 2
                    centerX:width/2
                    centerY: height/2
                    //矩形属性
                    mWidth: width-4
                    mHeight: height-4
                }

                Column{
                    id:sliderRow
                    width: parent.width

                    anchors.top:progressbar0.bottom


                    Slider {
                        id:sliderWaveA

                        from: 1
                        value: 50
                        to: 100
                        anchors.horizontalCenter: parent.horizontalCenter
                        onValueChanged: {

                            progressbar0.waveA = 10*(value/100)

                        }
                    }
                    Slider {
                        id:sliderWaveP
                        from: 1
                        value: 50
                        to: 100
                        anchors.horizontalCenter: parent.horizontalCenter
                        onValueChanged: {

                            progressbar0.waveP = 0.2*(value/100)

                        }
                    }
                    Slider {
                        id:sliderWaveV
                        from: 1
                        value: 70
                        to: 100
                        anchors.horizontalCenter: parent.horizontalCenter
                        onValueChanged: {

                            progressbar0.value = value

                        }
                    }


                }
            }

        }
    }
}
