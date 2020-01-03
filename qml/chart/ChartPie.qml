import QtQuick 2.0
import QtCharts 2.0
import QtCharts 2.3

import "../button"
Rectangle {


    border.width: 1
    border.color: "gray"
    color: "transparent"

    property var  labelName: ""

    ChartView {
        id: chartView
        anchors.fill: parent
        title: "饼行图"
        legend.visible: true
        antialiasing: true
        //animationOptions:ChartView.AllAnimations
        //animationDuration:3000
        backgroundColor:"#77000000"
        animationOptions:ChartView.AllAnimations
      //  theme: ChartView.ChartThemeDark
       // margins:Margins{top: 10;left:10;right: 100;bottom: 100}
       // plotArea:Qt.rect(10,10,400,400)
        PieSeries {
            id: wheelOfFortune
            //holeSize:0.5

            //size:0.5
            PieSlice { label: "一号";labelColor:"black";labelVisible:true; value: 13.5;color: "red" ;borderWidth: 0;exploded:labelName === label;explodeDistanceFactor:0.05}
            PieSlice { label: "二号";labelColor:"black";labelVisible:true;  value: 10.9;color: "blue" ;borderWidth: 0;exploded:labelName === label;explodeDistanceFactor:0.05}
            PieSlice { label: "三号";labelColor:"black";labelVisible:true;  value: 8.6;color: "yellow" ;borderWidth: 0;exploded:labelName === label;explodeDistanceFactor:0.05}


            onHovered: {

                labelName = slice.label
            }
        }

        //        SplineSeries {
        //            id: splineSeries
        //        }

        //        ScatterSeries {
        //            id: scatterSeries
        //        }


    }

//    ImgTxtButton{

//        id:btn
//        width: 100
//        height: 40
//        anchors.right: parent.right
//        anchors.rightMargin: 20
//        anchors.bottom: parent.bottom
//        anchors.bottomMargin: 20

//        isNeedWave: true
//        waveColor: "#1296db"

//        haveTxt:true
//        textStr: qsTr("重置图表")
//        txtX: 10
//        txtY:10
//        txtFontPixSize: 20
//        txtOffset: 1
//        txtHoverColor:"#bbbbbb"

//        haveImg: false
//        imgX: 60
//        imgY: 5
//        imgNorSrc:"qrc:/image/btnTest.png"
//        onClick: chartView.update()
//    }

//    ComBox{

//        width: 200
//        height: 40
//        model: testModel
//        font.pixelSize: 20
//        anchors.left: parent.left
//        anchors.leftMargin: 20
//        anchors.bottom: parent.bottom
//        anchors.bottomMargin: 20
//        onCurrentIndexChanged: {

//            if(currentIndex === 0)
//                chartView.theme = ChartView.ChartThemeLight
//            else if(currentIndex === 1)
//                chartView.theme = ChartView.ChartThemeBlueCerulean
//            else if(currentIndex === 2)
//                chartView.theme = ChartView.ChartThemeDark
//            else if(currentIndex === 3)
//                chartView.theme = ChartView.ChartThemeBrownSand
//            else if(currentIndex === 4)
//                chartView.theme = ChartView.ChartThemeBlueNcs
//            else if(currentIndex === 5)
//                chartView.theme = ChartView.ChartThemeHighContrast
//            else if(currentIndex === 6)
//                chartView.theme = ChartView.ChartThemeBlueIcy
//            else if(currentIndex === 7)
//                chartView.theme = ChartView.ChartThemeQt

//        }
//    }

//    ListModel{
//        id:testModel
//        Component.onCompleted: {
//            testModel.append({showStr:"ChartThemeLight"})
//            testModel.append({showStr:"ChartThemeBlueCerulean"})
//            testModel.append({showStr:"ChartThemeDark"})
//            testModel.append({showStr:"ChartThemeBrownSand"})
//            testModel.append({showStr:"ChartThemeBlueNcs"})
//            testModel.append({showStr:"ChartThemeHighContrast"})
//            testModel.append({showStr:"ChartThemeBlueIcy"})
//            testModel.append({showStr:"ChartThemeQt"})
//        }
//    }
}
