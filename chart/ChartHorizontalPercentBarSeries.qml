import QtQuick 2.0
import QtCharts 2.3
Rectangle {


    border.width: 1
    border.color: "gray"
    color: "transparent"
    ChartView {
        title: "Horizontal Percent Bar series"
        anchors.fill: parent
        legend.alignment: Qt.AlignBottom
        theme: ChartView.ChartThemeDark
        antialiasing: true
        animationOptions:ChartView.AllAnimations
        animationDuration:3000
        HorizontalPercentBarSeries {
            axisY: BarCategoryAxis { categories: ["2007", "2008", "2009", "2010", "2011", "2012" ] }
            BarSet { label: "Bob"; values: [2, 2, 3, 4, 5, 6] }
            BarSet { label: "Susan"; values: [5, 1, 2, 4, 1, 7] }
            BarSet { label: "James"; values: [3, 5, 8, 13, 5, 8] }
        }
    }
}
