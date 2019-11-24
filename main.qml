import QtQuick 2.12
import QtQuick.Window 2.12

import QtQuick.Controls 2.5
Window {

    id: main;
    flags:Qt.FramelessWindowHint |
          Qt.WindowMinimizeButtonHint |
          Qt.Window
    property bool isobjectContent: false
    property bool isSpecilState: false      //窗口在最大化的时候调用最小化 会出现特例（窗口还原后大小不再是最大化了）
    visible: true

    width:1200
    height:800

    visibility : "Windowed"


    HomeTitleBar{
        id:mTitleBar
        width: parent.width
        height: 60

        color: "black"
        z:1
        onWinMin:{
            if(main.visibility === 4)
                isSpecilState = true;

            main.visibility = "Minimized"

        }

        onWinMax: {
            if(main.visibility === 2)

                main.visibility = "Maximized"

            else if(main.visibility === 4)
                main.visibility = "Windowed"

        }

        onWinClose:Qt.quit()
        onDragPosChange:main.setDlgPoint(main,tx,ty);


    }
    Rectangle{
        id:recttabbarBtn
        height: parent.height - mTitleBar.height
        width: 150

        anchors.top: mTitleBar.bottom

        color: "#313131"

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

        height: parent.height- mTitleBar.height
        width: parent.width - recttabbarBtn.width
        anchors.left: recttabbarBtn.right
        anchors.top: mTitleBar.bottom
        currentIndex: tabbarBtn.curIndex
        orientation:Qt.Vertical
        interactive:false



        MyButton{
            id:myButton

            Component.onCompleted: {
                myButton.myModel.append({qmlSrc:"qrc:/Button/Button0.qml"})

            }
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



    function setDlgPoint(object,dlgX ,dlgY)
    {
        //设置窗口拖拽不能超过父窗口
        if(object.x + dlgX < 0)
        {
            object.x = 0
        }
        else if(object.x + dlgX > Screen.desktopAvailableWidth - object.width)
        {
            object.x = Screen.desktopAvailableWidth - object.width
        }
        else
        {
            object.x = object.x + dlgX
        }
        if(object.y + dlgY < 0)
        {
            object.y = 0
        }
        else if(object.y + dlgY >  Screen.desktopAvailableHeight - object.height)
        {
            object.y =  Screen.desktopAvailableHeight - object.height
        }
        else
        {
            object.y = object.y + dlgY
        }
    }

}
