import QtQuick 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "../button"
Rectangle {
    id: rect
    anchors.fill: parent

    color: "black"
    border.width: 1
    border.color: "gray"

    signal s_yearChange(var value)
    signal s_mouthChange(var value)
    signal s_dayChange(var value)

    Calendar{
        id:the_calendar
        width: parent.width -80
        height: parent.height - bottomRect.height -60

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
       // anchors.margins: 2
        style: CalendarStyle {
            gridColor: "transparent"
            //gridVisible: false

            background: Rectangle{
                id:background
                anchors.fill: parent
                color:"#191919"
            }

            //标题年月
            navigationBar:Item{
                height: 39
                ImgTxtButton {
                    id: yearPre
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 16
                    btnBgColor:"#191919"
                    haveTxt: false
                    haveImg: true
                    isNeedWave: false
                    width: 11
                    height: 11
                    imgNorSrc: "qrc:/image/yearpre.png"
                    imgPressSrc: "qrc:/image/yearpre_p.png"
                    imgHoverSrc: "qrc:/image/yearpre_p.png"

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            control.showPreviousYear()

                            s_yearChange(""+the_calendar.visibleYear + (the_calendar.visibleMonth+1)+"00000000")
                        }
                    }
                }

                ImgTxtButton {
                    id: yearNext
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 16

                    btnBgColor:"#191919"
                    haveTxt: false
                    haveImg: true
                    isNeedWave: false

                    width: 11
                    height: 11
                    imgNorSrc: "qrc:/image/yearnext.png"
                    imgPressSrc:"qrc:/image/yearnext_p.png"
                    imgHoverSrc: imgPressSrc
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            control.showNextYear()
                            s_yearChange(""+the_calendar.visibleYear + (the_calendar.visibleMonth+1)+"00000000")
                        }
                    }
                }
                ImgTxtButton {
                    id: mouthPre
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 38
                    width: 7
                    height: 11
                    btnBgColor:"#191919"
                    haveTxt: false
                    haveImg: true
                    isNeedWave: false
                    imgNorSrc: "qrc:/image/mouthpre.png"
                    imgPressSrc:"qrc:/image/mouthpre_p.png"
                    imgHoverSrc:imgPressSrc
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            control.showPreviousMonth()
                            s_mouthChange(""+the_calendar.visibleYear + (the_calendar.visibleMonth+1)+"00000000")
                        }
                    }
                }

                ImgTxtButton {
                    id: mouthNext

                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 38
                    width: 7
                    height: 11
                    btnBgColor:"#191919"
                    haveTxt: false
                    haveImg: true
                    isNeedWave: false

                    imgNorSrc: "qrc:/image/mouthnext.png"
                    imgPressSrc:"qrc:/image/mouthnext_p.png"
                    imgHoverSrc:imgPressSrc
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            control.showNextMonth()
                            s_mouthChange(""+the_calendar.visibleYear + (the_calendar.visibleMonth+1)+"00000000")
                        }
                    }
                }

                Rectangle{

                    id:dateShowRect
                    width: labelYear.width + labelMonth.width
                    height: parent.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "transparent"
                    Label {
                        id: labelYear
                        anchors.verticalCenter: parent.verticalCenter

                        //text: the_calendar.selectedDate.getFullYear()+qsTr('年')
                        text:control.visibleYear+qsTr('年')
                        //elide: Text.ElideRight
                        horizontalAlignment: Text.AlignLeft
                        font.pixelSize: 14
                        font.family: "Microsoft Yahei"
                        color: "white"
                    }

                    Label {
                        id: labelMonth
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: labelYear.right
                        anchors.leftMargin: 10
                        //注意Date原本的月份是0开始
                        text: (control.visibleMonth+1)+qsTr('月')
                        //elide: Text.ElideRight
                        horizontalAlignment: Text.AlignRight
                        font.pixelSize: 14
                        font.family: "Microsoft Yahei"
                        color: "white"
                    }
                }


                Rectangle{
                    width: parent.width
                    height: 1
                    anchors.bottom: parent.bottom
                    color: Qt.rgba(255,255,255,0.09)
                }
            }
            //星期
            dayOfWeekDelegate: Item{
                //color: "transparent"
                height: the_calendar.height/8
                Label {
                    text: control.__locale.dayName(styleData.dayOfWeek, control.dayOfWeekFormat)
                    anchors.centerIn: parent
                    color: "white"
                    font.pixelSize: 14
                    //font.family: "SimSun"
                }
            }

            dayDelegate: Rectangle {
                //选中-当月未选中-其他
                //                color: styleData.selected
                //                       ?Qt.rgba(52/255,142/255,145/255,1)
                //                       : (styleData.visibleMonth && styleData.valid
                //                          ?Qt.rgba(6/255,45/255,51/255,1)
                //                          : Qt.rgba(3/255,28/255,35/255,1));
                //color: styleData.selected?"#409EFF":((styleData.visibleMonth && styleData.valid)?(calendarEventModel.getDateEvent(styleData.date)):"#191919")
                color: (styleData.visibleMonth && styleData.valid)?(calendarEventModel.getDateEvent(styleData.date)):"#191919"
                border.width: 2
                border.color: styleData.selected?"#21e9cc":"transparent"
                Label {
                    text: styleData.date.getDate()
                    anchors.centerIn: parent
                    font.pixelSize: 14
                    font.family: "SimSun"
                    //                    color: styleData.valid
                    //                           ?Qt.rgba(197/255,1,1,1)
                    //                           : Qt.rgba(16/255,100/255,100/255,1)
                    color: styleData.today?"red":((styleData.visibleMonth && styleData.valid)?"white":Qt.rgba(255,255,255,0.25))
                    //color:styleData.visibleDay?"red":"white"
                }
            }

        }
    }


    Rectangle{
        id:bottomRect
        width: parent.width
        height: 40
        color: "transparent"
        anchors.bottom: parent.bottom
        Text {
            id: txtToday
            anchors.left: parent.left
            anchors.leftMargin: 16
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 10
            color: "white"
            text: Qt.formatDate(the_calendar.selectedDate,"yyyy-MM-dd")
        }

        ImgTxtButton{
            width: 44
            height: 22

            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 16


            haveImg: false

            haveTxt: true

            txtY:5
            txtX:5

            btnBgColor:"#409EFF"
            btnPressBgColor: "#cc409EFF"
            btnHoverBgColor: "#cc409EFF"


            textStr: qsTr("ensure")
            onClick: {
                s_dayChange(Qt.formatDate(the_calendar.selectedDate,"yyyyMMdd000000"))

            }
        }

    }
}
