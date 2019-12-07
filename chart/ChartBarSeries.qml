import QtQuick 2.0
import QtQuick 2.0
import QtCharts 2.3

Rectangle {


    border.width: 1
    border.color: "gray"
    color: "transparent"

    ChartView {
        title: "Bar series"
        anchors.fill: parent
        legend.alignment: Qt.AlignBottom
        antialiasing: true
        theme: ChartView.ChartThemeDark
        animationOptions:ChartView.AllAnimations
        animationDuration:3000
        BarSeries {
            id: mySeries
            axisX: BarCategoryAxis { categories: ["2007", "2008", "2009", "2010", "2011", "2012" ] }
            BarSet { label: "Bob"; values: [2, 2, 3, 4, 5, 6] }
            BarSet { label: "Susan"; values: [5, 1, 2, 4, 1, 7] }
            BarSet { label: "James"; values: [3, 5, 8, 13, 5, 8] }
        }
    }
}
