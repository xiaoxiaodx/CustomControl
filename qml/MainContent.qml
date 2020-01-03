import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Window 2.12
import QtQml 2.12

import "../homePage"

Rectangle {

    id: main;



    property bool fullscreen: false
    property bool isPress: false

    property int mWindowStates: 4   // 2：正常 4：最大化

    property int preX:0
    property int preY:0
    property int preWidth:0
    property int preHeight:0

    property string toastStr: ""

    property string versionstr: "V 1.1.1"








    color: "black"
    visible: false


    signal winMin1();
    signal winMax1();
    signal winClose1();
    signal dragPosChange1(var mx,var my);

    HomeTitleBar{
        id:mTitleBar
        width: parent.width
        height: 60
        versionStr:versionstr
        color: "black"
        onWinMin: winMin1()

        onWinMax: winMax1()

        onWinClose:winClose1()
        onDragPosChange:dragPosChange1(tx,ty);

    }

    Rectangle{
        id:mhomecontent
        anchors.top: homeMenu.bottom
        anchors.left: parent.left
        width: parent.width
        height: parent.height - mTitleBar.height - homeMenu.height-mhomeStateBar.height
        color: "black"


        HomePage{

           anchors.fill: parent
           color: "#272727"
            z:homeMenu.mCurIndex==-1?1:0

            onSelectIndex: homeMenu.mCurIndex = mindex
        }
        LiveVideo{
            id:livevideo
            anchors.fill: parent
            z:homeMenu.mCurIndex==0?1:0


        }
        PlaybackVideo{
            anchors.fill: parent
            z:homeMenu.mCurIndex==1?1:0
        }

        DeviceManager{
            anchors.fill: parent
            z:homeMenu.mCurIndex==2?1:0
        }



    }


    function dispatchVedio(index2,buff2,len2){

        livevideo.dispatchVedio(index2,buff2,len2)
    }

    Rectangle{
        id:mhomeStateBar
        width: parent.width
        height:50
        anchors.top: mhomecontent.bottom
        color: "black"
    }



}
