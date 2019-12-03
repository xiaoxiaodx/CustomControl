import QtQuick 2.0
import "../Button"
import Dashbord5 1.0
import QtQuick.Controls 2.5
Rectangle {

    border.width: 1
    border.color: "gray"
    color: "transparent"

    Dashbord5{
        id:dashbord5
        width: parent.width/2
        height: parent.height/2
        centerX: width/2
        centerY: height/2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        outerRadius: width>height?height/2:width/2
        innerRadius: 24         //最好设置为图片大小的一半
        outerRadiusColor: "#8a8a8a"
        innerRadiusColor: "#555555"
        selectBgColor: "#cdcdcd"
        selectKeyColor: "#17abe3"
        pressKeyBgColor:"#7dc5eb"
        keyColor:"#707070"
        centerImg:":/image/video.png"
        triAngleLen:10
        keyNum:8


    }
}


