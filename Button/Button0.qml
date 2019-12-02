import QtQuick 2.0
/*
  图片文字按钮，带效果：
    1、滑动
    2、选中
    3、波浪
    4、文字点击效果
*/
Rectangle {



    border.width: 1
    border.color: "gray"
    color: "transparent"
    ImgTxtButton{

        id:btn
        width: 100
        height: 40
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 20

        isNeedWave: true
        waveColor: "#1296db"

        haveTxt:true
        textStr: qsTr("测试")
        txtX: 15
        txtY:10
        txtFontPixSize: 20
        txtOffset: 1
        txtHoverColor:"#bbbbbb"

        haveImg: true
        imgX: 60
        imgY: 5
        imgNorSrc:"qrc:/image/btnTest.png"
    }


    Column {
        id:column
        anchors.right: parent.right
        anchors.rightMargin: 70
        anchors.top: parent.top
        anchors.topMargin: 10
        width: 100
        spacing: 10
        MyCheckBox {
            id:checkShowTxt

            text: qsTr("是否显示文字")
            txtColorNor:"#8a8a8a"
            txtColorSelect: "#409EFF"
            font.pixelSize: 20

            spacing: 10
            checkedSrc:"qrc:/image/select.png"
            uncheckedSrc: "qrc:/image/unselect.png"
            checked: true
            onCheckedChanged: {
                if(checkShowTxt.checked)
                    btn.haveTxt = true
                else
                    btn.haveTxt = false
            }
        }

        MyCheckBox {
            id:checkShowImg
            checked: true
            text: qsTr("是否显示图片")
            txtColorNor:"#8a8a8a"
            txtColorSelect: "#409EFF"
            font.pixelSize: 20
            spacing: 10
            checkedSrc:"qrc:/image/select.png"
            uncheckedSrc: "qrc:/image/unselect.png"
            onCheckedChanged: {
                if(checkShowImg.checked)
                    btn.haveImg = true
                else
                    btn.haveImg = false
            }
        }
        MyCheckBox {
            id:checkShowWave
            checked: true
            text: qsTr("是否需要波浪")
            txtColorNor:"#8a8a8a"
            txtColorSelect: "#409EFF"
            font.pixelSize: 20
            spacing: 10
            checkedSrc:"qrc:/image/select.png"
            uncheckedSrc: "qrc:/image/unselect.png"
            onCheckedChanged: {
                if(checkShowWave.checked)
                    btn.isNeedWave = true
                else
                    btn.isNeedWave = false
            }
        }

    }
}
