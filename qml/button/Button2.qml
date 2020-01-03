import QtQuick 2.0
/*
    纵向多选一按钮
*/
Rectangle {


    border.width: 1
    border.color: "gray"
    color: "transparent"
    TabBarButtonH{
        id:tabbarBtn
        x:2
        y:2
        width: parent.width
        height: 60


        Component.onCompleted: {

            tabbarBtn.barModel.append({txtStr:qsTr("按钮"),imgSrc:"qrc:/image/Button.png",imgSelect:"qrc:/image/ButtnEnter.png",lineColor:"red"})
            tabbarBtn.barModel.append({txtStr:qsTr("仪表"),imgSrc:"qrc:/image/dashbord.png",imgSelect:"qrc:/image/dashbord.png",lineColor:"red"})
            tabbarBtn.barModel.append({txtStr:qsTr("进度"),imgSrc:"qrc:/image/processBar.png",imgSelect:"qrc:/image/processBar.png",lineColor:"red"})

        }
    }
}
