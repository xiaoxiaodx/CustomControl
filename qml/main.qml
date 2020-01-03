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
                tabbarBtn.barModel.append({txtStr:qsTr("文本"),imgSrc:"qrc:/image/text.png",imgSrcEnter:"qrc:/image/text.png"})
                tabbarBtn.barModel.append({txtStr:qsTr("仪表盘"),imgSrc:"qrc:/image/dashbord.png",imgSrcEnter:"qrc:/image/dashbord.png"})
                tabbarBtn.barModel.append({txtStr:qsTr("进度条"),imgSrc:"qrc:/image/processBar.png",imgSrcEnter:"qrc:/image/processBar.png"})
                tabbarBtn.barModel.append({txtStr:qsTr("图表"),imgSrc:"qrc:/image/chart.png",imgSrcEnter:"qrc:/image/chart.png"})

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
                myButton.myModel.append({qmlSrc:"qrc:/qml/button/Button0.qml"})
                myButton.myModel.append({qmlSrc:"qrc:/qml/button/Button1.qml"})
                myButton.myModel.append({qmlSrc:"qrc:/qml/button/Button2.qml"})
                myButton.myModel.append({qmlSrc:"qrc:/qml/button/Button3.qml"})
                myButton.myModel.append({qmlSrc:"qrc:/qml/button/Button4.qml"})
            }
        }
        MyText{
            id:myText

            Component.onCompleted: {
                myText.myModel.append({qmlSrc:"qrc:/qml/text/Text0.qml"})

            }
        }
        MyDashBord{
            id:myDashBord
            Component.onCompleted: {
                myDashBord.myModel.append({qmlSrc:"qrc:/qml/dashbordui/Dashbord0.qml"})
                myDashBord.myModel.append({qmlSrc:"qrc:/qml/dashbordui/Dashbord1.qml"})
                myDashBord.myModel.append({qmlSrc:"qrc:/qml/dashbordui/Dashbord2.qml"})
                myDashBord.myModel.append({qmlSrc:"qrc:/qml/dashbordui/Dashbord3.qml"})
                myDashBord.myModel.append({qmlSrc:"qrc:/qml/dashbordui/Dashbord4.qml"})
                myDashBord.myModel.append({qmlSrc:"qrc:/qml/dashbordui/Dashbord5.qml"})

            }
        }

        MyProgressbar{
            id:myProgressbar
            Component.onCompleted: {
                myProgressbar.myModel.append({qmlSrc:"qrc:/qml/progressbarui/Processbar0.qml"})


            }
            //color: "red"
        }

        MyChart{
            id:myMyChart
            Component.onCompleted: {
                myMyChart.myModel.append({qmlSrc:"qrc:/qml/chart/ChartPie.qml"})
                myMyChart.myModel.append({qmlSrc:"qrc:/qml/chart/ChartScatterSeries.qml"})
                myMyChart.myModel.append({qmlSrc:"qrc:/qml/chart/ChartLine.qml"})
                myMyChart.myModel.append({qmlSrc:"qrc:/qml/chart/ChartSpline.qml"})
                myMyChart.myModel.append({qmlSrc:"qrc:/qml/chart/ChartArea.qml"})
                myMyChart.myModel.append({qmlSrc:"qrc:/qml/chart/ChartBoxPlot.qml"})
                myMyChart.myModel.append({qmlSrc:"qrc:/qml/chart/ChartBarSeries.qml"})
                myMyChart.myModel.append({qmlSrc:"qrc:/qml/chart/ChartHorizontalBarSeries.qml"})
                myMyChart.myModel.append({qmlSrc:"qrc:/qml/chart/ChartPercentBarSeries.qml"})
                myMyChart.myModel.append({qmlSrc:"qrc:/qml/chart/ChartHorizontalPercentBarSeries.qml"})
                myMyChart.myModel.append({qmlSrc:"qrc:/qml/chart/ChartStackedBarSeries.qml"})
                myMyChart.myModel.append({qmlSrc:"qrc:/qml/chart/ChartHorizontalStackedBarSeries.qml"})


            }
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
