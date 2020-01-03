import QtQuick 2.0
Row {


    property alias barModel: mymodel

    property int curIndex: 0


    property string txtSelectColor: ""


    ListModel{
        id:mymodel
    }
    Repeater{
        width: parent.width
        height: parent.height
        model: mymodel
        Rectangle{
            width: parent.width/3
            height: parent.height
            ImgTxtButton{

                id:btn
                width: parent.width
                height: parent.height
                anchors.left: parent.left
                anchors.top: parent.top

                isNeedWave: false
                waveColor: "#353535"

                btnBgColor: "#313131"
                btnHoverBgColor: "#272727"
                btnPressBgColor: "#252525"

                haveTxt:true
                textStr:txtStr
                txtX: 20
                txtY:20
                txtFontPixSize: 20
                txtOffset: 1
                txtNorColor: "white"
                txtHoverColor:"#eeeeee"
                txtPressColor: "#cccccc"

                haveImg: true
                imgX: 70
                imgY: 15
                imgNorSrc:imgSrc
                imgHoverSrc: imgSelect
                onClick:{
                    curIndex = index

                }
            }

            Rectangle{
                id:line
                width:parent.width
                height: 4
                color: curIndex===index?lineColor:"#000000ff"
                anchors.bottom: parent.bottom
            }
        }


    }
}
