import QtQuick 2.0


/*
  图片文字按钮，带效果：
    1、滑动
    2、选中
    3、波浪
    4、文字点击效果
   注意:选中效果必须独立使用(有选中效果就不应该在有滑动效果)，在使用按下或者滑动效果时应该避免使用选中效果显示
*/
Rectangle {
    id:root

    property string btnBgColor: "#409EFF"
    property string btnPressBgColor: btnBgColor
    property string btnHoverBgColor: btnBgColor

    property alias isNeedWave: wave.haveWave
    property alias waveColor: wave.waveColor

    property bool haveImg: false
    property alias imgX: img.x
    property alias imgY: img.y
    property string imgNorSrc: ""
    property string imgPressSrc: imgNorSrc
    property string imgHoverSrc: imgNorSrc


    property bool haveTxt: false
    property alias textStr: txt.text
    property int txtOffset: 0//文字按下的偏移效果
    property alias txtX: txt.x
    property alias txtY: txt.y
    property int txtFontPixSize: 10
    property string txtNorColor: "white"
    property string txtPressColor: txtNorColor
    property string txtHoverColor: txtNorColor





    signal click();


    WaveButton{
        id:wave
        width: parent.width
        height: parent.height
        waveColor:"#aabbbbbb"
        color: btnBgColor
        timeInter:20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        onLeftClick: click()
        onLeftPressed: {
            objectPosOffset(txt,txtOffset)


            txt.color = txtPressColor
            img.source = imgPressSrc
            wave.color = btnPressBgColor

        }
        onLeftReleased: {
            objectPosOffset(txt,-txtOffset)

            txt.color = txtNorColor
            img.source = imgNorSrc
            wave.color = btnBgColor


        }

        onEnter: {

            txt.color = txtHoverColor
            img.source = imgHoverSrc
            wave.color = btnHoverBgColor


        }

        onExit: {

            txt.color = txtNorColor
            img.source = imgNorSrc
            wave.color = btnBgColor
        }




    }

    Text {
        id: txt
        x:txtX
        y:txtY
        visible: haveTxt
        color:txtNorColor

        font.pixelSize: txtFontPixSize

    }

    Image {
        id: img
        x:imgX
        y:imgY
        visible: haveImg
        source: imgNorSrc
    }

    function objectPosOffset(object,offset){

        object.x += offset
        object.y += offset
    }
}
