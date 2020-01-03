import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls 2.12
import Qt.labs.platform 1.1
import QtQuick 2.12
import QtQuick.Controls 2.12
import "./button"
Rectangle {

    id:root


    property bool isPress: false
    property string versionStr: qsTr("通用控件库")

    signal winMin();
    signal winMax();
    signal winClose();
    signal dragPosChange(var tx,var ty);


    Rectangle {
        anchors.fill: parent

        color: "transparent"

        Label{

            anchors.left: parent.left
            anchors.leftMargin:15
            anchors.verticalCenter: parent.verticalCenter

            font.family: "arial"
            font.pointSize: 15
            color: "white"
            font.italic:true
            font.bold: true
            text: versionStr
        }


        MouseArea {
            id:mousearea
            property point clickPoint: "0,0"

            anchors.fill: parent
            acceptedButtons: Qt.LeftButton

            onPressed: {
                clickPoint  = Qt.point(mouse.x, mouse.y)
            }
            //双击过程会出现拖拉事件，导致窗口最大化到还原过程出现bug,因此禁掉
            //            onDoubleClicked: {
            //                enabled = false;
            //                winMax();
            //                enabled = true;

            //            }
            onPositionChanged: {

                var offset = Qt.point(mouse.x - clickPoint.x, mouse.y - clickPoint.y)

                dragPosChange(offset.x, offset.y)
            }
        }


        Row{
            id:windowAdjust
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            spacing:10
            height: 36

            ImgTxtButton{
                id:btn
                width: 36
                height: 36

                btnBgColor:"black"

                isNeedWave: false
                haveImg: true
                haveTxt: false
                imgNorSrc:"qrc:/image/wMin.png"
                imgHoverSrc: "qrc:/image/wMin_enter.png"
                onClick: winMin()
            }

            ImgTxtButton{
                width: 36
                height: 36
                btnBgColor:"black"
                isNeedWave: false
                haveTxt: false
                haveImg: true
                imgNorSrc: "qrc:/image/wMax.png"
                imgHoverSrc:  "qrc:/image/wMax_enter.png"


                onClick: winMax()
            }

            ImgTxtButton{
                id:btn1
                width: 36
                height: 36
                btnBgColor:"black"
                isNeedWave: false
                haveImg: true
                haveTxt: false
                imgNorSrc:"qrc:/image/wClose.png"
                imgHoverSrc: "qrc:/image/wClose_enter.png"
                onClick: winClose()
            }


        }

    }


    function strToimg(str){

        return pathMapping[str]

    }

}
