import QtQuick 2.0
Column {


    property alias barModel: mymodel

    property int curIndex: 0
    ListModel{
        id:mymodel

    }
    Repeater{
        width: parent.width
        height: parent.height
        model: mymodel
        QmlTabButton{
            //anchors.centerIn: parent
            width: parent.width
            height: 60
            txtColor:"white"
            flagColor:curIndex == index?"red":"#00000000"
            bgColor:"#313131"
            bgColorEnter:"#dd8a8a8a"
            txtStr: model.txtStr
            imgSrc: model.imgSrc
            imgSrcEnter: model.imgSrcEnter
            onClick:{
                curIndex = index

            }
        }


    }
}
