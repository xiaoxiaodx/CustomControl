import QtQuick 2.0
import QtCharts 2.0
import QtCharts 2.3
Rectangle {


    border.width: 1
    border.color: "gray"
    color: "transparent"

    ChartView {
        title: "NHL All-Star Team Players"
        anchors.fill: parent
        antialiasing: true
        theme: ChartView.ChartThemeDark
        animationOptions:ChartView.AllAnimations
        animationDuration:3000
        // Define x-axis to be used with the series instead of default one
        ValueAxis {
            id: valueAxis
            min: 2000
            max: 2011
            gridVisible: false
            tickCount: 12
            tickInterval:4
            tickType:ValueAxis.TicksFixed
            labelFormat: "%.0f"
        }

        ValueAxis {
            id: valueAxis1
            min: 0
            max: 10
            gridVisible: false
            tickCount: 12
            tickInterval:2
            tickType:ValueAxis.TicksDynamic
            labelFormat: "%.0f"
        }

        AreaSeries {
            name: "China"
            axisX: valueAxis
            axisY: valueAxis1
            color: "yellow"
            borderWidth:0

            upperSeries: LineSeries {
                XYPoint { x: 2000; y: 2 }
                XYPoint { x: 2001; y: 3 }
                XYPoint { x: 2002; y: 4 }
                XYPoint { x: 2003; y: 3 }
                XYPoint { x: 2004; y: 2 }
                XYPoint { x: 2005; y: 1 }
                XYPoint { x: 2006; y: 0 }
                XYPoint { x: 2007; y: 4 }
                XYPoint { x: 2008; y: 5 }
                XYPoint { x: 2009; y: 4 }
                XYPoint { x: 2010; y: 3 }
                XYPoint { x: 2011; y: 2 }
            }
        }


        AreaSeries {
            name: "Russian"
            axisX: valueAxis
            axisY: valueAxis1
            borderWidth:0
            upperSeries: LineSeries {
                XYPoint { x: 2000; y: 1 }
                XYPoint { x: 2001; y: 1 }
                XYPoint { x: 2002; y: 1 }
                XYPoint { x: 2003; y: 1 }
                XYPoint { x: 2004; y: 1 }
                XYPoint { x: 2005; y: 0 }
                XYPoint { x: 2006; y: 1 }
                XYPoint { x: 2007; y: 1 }
                XYPoint { x: 2008; y: 4 }
                XYPoint { x: 2009; y: 3 }
                XYPoint { x: 2010; y: 2 }
                XYPoint { x: 2011; y: 1 }
            }
        }
    }
}
