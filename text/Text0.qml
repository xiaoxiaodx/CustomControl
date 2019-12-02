import QtQuick 2.0
import "../Button"
Rectangle {

    border.width: 1
    border.color: "gray"
    color: "transparent"




    LineEdit{
        id:lineEdit
        width: 200
        height: 50
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 20
        font.pixelSize: 30
        border.width: 1
        border.color: "white"
        textLeftPadding: 5
        placeholderText: "test"
        placeholderTxtColor: "gray"
        color: "transparent"


    }
    Column {
        id:column
        anchors.right: parent.right
        anchors.rightMargin: 70
        anchors.top: lineEdit.bottom
        anchors.topMargin: 10
        width: 100
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10
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
                    lineEdit.isNeedImg = true
                else
                    lineEdit.isNeedImg = false
            }
        }

        MyCheckBox {
            id:checkShowWave
            checked: true
            text: qsTr("是否需要双击可编辑")
            txtColorNor:"#8a8a8a"
            txtColorSelect: "#409EFF"
            font.pixelSize: 20
            spacing: 10
            checkedSrc:"qrc:/image/select.png"
            uncheckedSrc: "qrc:/image/unselect.png"
            onCheckedChanged: {
                if(checkShowWave.checked)
                    lineEdit.isNeedDoubleClickEdit = true
                else
                    lineEdit.isNeedDoubleClickEdit = false
            }
        }
    }
}
