import QtQuick 2.0
import QtCharts 2.3

Rectangle {


    border.width: 1
    border.color: "gray"
    color: "transparent"

    ChartView {
        title: "Box Plot series"
        anchors.fill: parent
        theme: ChartView.ChartThemeDark
        //legend.alignment: Qt.AlignBottom
        animationOptions:ChartView.AllAnimations
        animationDuration:3000
        ValueAxis {
            id: valueAxis
            min: 0
            max: 15
            tickCount: 12
            tickInterval:4
            tickType:ValueAxis.TicksFixed
            labelFormat: "%.0f"
        }

        BoxPlotSeries {
            id: plotSeries
            name: "Income"


            axisYRight:valueAxis
            BoxSet { label: "Jan"; values: [3, 4, 5.1, 6.2, 8.5] }
            BoxSet { label: "Feb"; values: [5, 6, 7.5, 8.6, 11.8] }
            BoxSet { label: "Mar"; values: [3.2, 5, 5.7, 8, 9.2] }
            BoxSet { label: "Apr"; values: [3.8, 5, 6.4, 7, 8] }
            BoxSet { label: "May"; values: [4, 5, 5.2, 6, 7] }
        }
    }
}
