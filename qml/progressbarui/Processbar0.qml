import Progressbar0 1.0
import QtQuick.Controls 2.5
import QtQuick 2.0
Rectangle{
    border.width: 1
    border.color: "gray"
    color: "transparent"

    Progressbar0{
        id:progressbar0
        width: parent.width*2/3
        height: parent.height
        bgColor:"#707070"
        fgColor: "#e8989a"
        bordColor: "#dc4151"
        processtype:0
        isClockwise:false
        isWave:true
        value:70
        waveA:5
        waveP:0.1
        fontColor:"#ffffff"
        bordW: 4

        //圆属性
        isScaleBaer:true
        radiusBig:width>height?height/2-4:width/2-4

        radiusSmall: radiusBig-bordW - 2
        centerX:width/2
        centerY: height/2
        //矩形属性
        mWidth: width-4
        mHeight: height-4
    }

    Column{
        id:sliderRow
        width: parent.width/3

        anchors.top:parent.top
        anchors.left: progressbar0.right


        Slider {
            id:sliderWaveA

            width: parent.width
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
            width: parent.width
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
            width: parent.width
            from: 1
            value: 70
            to: 100
            anchors.horizontalCenter: parent.horizontalCenter
            onValueChanged: {

                progressbar0.value = value

            }
        }
        Switch{
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter

            onCheckedChanged: {
                if(checked)
                    progressbar0.processtype = 1;
                else
                    progressbar0.processtype = 0;
            }
        }


    }
}
