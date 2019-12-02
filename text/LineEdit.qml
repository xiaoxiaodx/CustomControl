import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


Rectangle{



    property bool isNeedImg: true
    property int textLeftPadding: 0
    property string txtColor: "white"
    property string txtBgColor: "transparent"
    property alias font: input.font
    property alias placeholderText: input.placeholderText
    property string  placeholderTxtColor
    property alias  text:input.text
    property string selectTxtColor: "white"
    property bool isNeedDoubleClickEdit: true

    property bool isClick: false
    Image {
        id: img
        visible: isNeedImg?true:false
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.verticalCenter: parent.verticalCenter
        source: "qrc:/image/text.png"
    }

    TextField{
        id:input
        width: parent.width - img.width -textLeftPadding
        height: parent.height - 4
        anchors.left: isNeedImg?img.right:parent.left
        anchors.leftMargin: textLeftPadding
        anchors.verticalCenter: parent.verticalCenter
        cursorPosition:10
        activeFocusOnPress: false

        font.pixelSize: 14
        style:TextFieldStyle {
            textColor: txtColor
            placeholderTextColor: placeholderTxtColor
            selectedTextColor: selectTxtColor

            background: Rectangle {
                color: txtBgColor
                implicitWidth: 100
                implicitHeight: 24
                radius: 4
            }
        }

        MouseArea{//这段代码的意义在于解决  双击编辑栏时出现的黑点闪烁bug
            anchors.fill: parent
            onPressed: {
                input.forceActiveFocus()
                mouse.accepted = false
            }
            onReleased: mouse.accepted = true
        }
    }

    MouseArea{
        anchors.fill: parent
        enabled: isNeedDoubleClickEdit
        hoverEnabled: true
        onEntered: lineEdit.border.color = "#1296db"
        onExited: {
            lineEdit.border.color = "white"
            isClick = false
        }
        onPressed: {

            if(isClick)
                mouse.accepted = false
        }
        onClicked:isClick = true
    }

}
