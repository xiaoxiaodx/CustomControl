import QtQuick 2.0
import QtCharts 2.3
import "../button"
Rectangle {


    border.width: 1
    border.color: "gray"
    color: "transparent"

    ChartView {
        anchors.fill: parent
        antialiasing: true
        theme: ChartView.ChartThemeDark
        title:"ChartView"
        animationOptions:ChartView.AllAnimations
        animationDuration:3000
        legend.alignment: Qt.AlignRight
        legend.borderColor: "red"
        legend.backgroundVisible:true
        dropShadowEnabled:false
        //backgroundColor:"transparent"
        SplineSeries {
            name: "SplineSeries"
            color: "red"
            pointsVisible:true
            capStyle:Qt.SquareCap
            XYPoint { x: 0; y: 0.0 }
            XYPoint { x: 10; y: 3.2 }
            XYPoint { x: 50; y: 2.4 }
            XYPoint { x: 60; y: 2.1 }
            XYPoint { x: 70; y: 2.6 }
            XYPoint { x: 80; y: 2.3 }
            XYPoint { x: 100; y: 3.1 }
        }

        SplineSeries {
            name: "SplineSeries"
            color: "blue"
            pointsVisible:true
            capStyle:Qt.FlatCap
            XYPoint { x: 0; y: 0.0 }
            XYPoint { x: 10; y: 2.2 }
            XYPoint { x: 50; y: 1.4 }
            XYPoint { x: 60; y: 1.1 }
            XYPoint { x: 70; y: 1.6 }
            XYPoint { x: 80; y: 1.3}
            XYPoint { x: 100; y: 2.1 }
        }

        SplineSeries {
            name: "SplineSeries"
            color: "green"
            pointsVisible:true
            capStyle:Qt.RoundCap
            XYPoint { x: 0; y: 0.0 }
            XYPoint { x: 10; y: 1.7 }
            XYPoint { x: 50; y: 0.9 }
            XYPoint { x: 60; y: 0.6 }
            XYPoint { x: 70; y: 1.1 }
            XYPoint { x: 80; y: 0.7 }
            XYPoint { x: 100; y: 1.6 }
        }
    }


}
