import QtQuick 2.0

import QtCharts 2.3


Rectangle {


    border.width: 1
    border.color: "gray"
    color: "transparent"

    ChartView {
        title: "Scatters"
        anchors.fill: parent
        antialiasing: true
        theme: ChartView.ChartThemeDark
        animationOptions:ChartView.AllAnimations
        legend.alignment: Qt.AlignBottom
        animationDuration:3000
        ScatterSeries {
            id: scatter1
            name: "Scatter1"
            pointLabelsFormat: scatter1.index
            pointLabelsVisible:true
            XYPoint { x: 1.5; y: 1.5 }
            XYPoint { x: 1.5; y: 1.6 }
            XYPoint { x: 1.57; y: 1.55 }
            XYPoint { x: 1.8; y: 1.8 }
            XYPoint { x: 1.9; y: 1.6 }
            XYPoint { x: 2.1; y: 1.3 }
            XYPoint { x: 2.5; y: 2.1 }
        }
    }
}
