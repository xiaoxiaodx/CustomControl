import QtQuick 2.0

/*
    开关动画按钮
*/
Rectangle {


    border.width: 1
    border.color: "gray"
    color: "transparent"
    SwitchButton{
        id:btn
        width: 60
        height: 30
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 20
        checked: false
        bgColor: "#409EFF"
        onCheckedChange: console.debug("SwitchButton    "+checked)
    }

    MyCheckBox {
        id:checkShowImg
        checked: true
        text: qsTr("是否包围")
        txtColorNor:"#8a8a8a"
        txtColorSelect: "#409EFF"
        font.pixelSize: 20
        spacing: 10
        checkedSrc:"qrc:/image/select.png"
        uncheckedSrc: "qrc:/image/unselect.png"

        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 20
        onCheckedChanged: {
            if(checkShowImg.checked){
                btn.isSurround = true

            }else{
                btn.isSurround = false

            }
        }
    }
}
