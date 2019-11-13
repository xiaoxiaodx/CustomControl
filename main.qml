import QtQuick 2.12
import QtQuick.Window 2.12

import QtQuick.Controls 2.5
Window {
    visible: true
    width: 1080
    height: 800
    title: qsTr("Hello World")


    Rectangle{
        id:recttabbarBtn
        height: parent.height
        width: 150
        color: "gray"
        z:1
        MyTabBarButton{

            id:tabbarBtn
            width: parent.width
            height: parent.width


            Component.onCompleted: {

                tabbarBtn.barModel.append({txtStr:qsTr("按钮"),imgSrc:"qrc:/image/Button.png",imgSrcEnter:"qrc:/image/ButtnEnter.png"})
                tabbarBtn.barModel.append({txtStr:qsTr("仪表盘"),imgSrc:"qrc:/image/dashbord.png",imgSrcEnter:"qrc:/image/dashbord.png"})
                tabbarBtn.barModel.append({txtStr:qsTr("进度条"),imgSrc:"qrc:/image/processBar.png",imgSrcEnter:"qrc:/image/processBar.png"})



            }
        }
    }


    SwipeView {
        id: view
        z:0
        height: parent.height
        width: parent.width - recttabbarBtn.width
        anchors.left: recttabbarBtn.right
        currentIndex: tabbarBtn.curIndex


        MyButton{

        }
        MyDashBord{
            id:configerneral
            color: "#aabfbfbf"
        }

        MyProgressbar{
            id:myProgressbar
            //color: "red"
        }


    }





}
