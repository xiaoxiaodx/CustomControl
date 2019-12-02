import QtQuick 2.0
/*
    横向多选一按钮
*/
Rectangle {


    border.width: 1
    border.color: "gray"
    color: "transparent"
    TabBarButtonV{
        id:tabbarBtn
        x:2
        y:2
        width: 2*parent.width/5
        height:parent.height


        Component.onCompleted: {

            tabbarBtn.barModel.append({txtStr:qsTr("按钮"),imgSrc:"qrc:/image/Button.png",imgSelect:"qrc:/image/ButtnEnter.png",lineColor:"red"})
            tabbarBtn.barModel.append({txtStr:qsTr("仪表盘"),imgSrc:"qrc:/image/dashbord.png",imgSelect:"qrc:/image/dashbord.png",lineColor:"red"})
            tabbarBtn.barModel.append({txtStr:qsTr("进度条"),imgSrc:"qrc:/image/processBar.png",imgSelect:"qrc:/image/processBar.png",lineColor:"red"})

        }
    }
}
