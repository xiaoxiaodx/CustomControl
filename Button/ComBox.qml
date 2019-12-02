import QtQuick 2.12
import QtQuick.Controls 2.12


/*
    数据模型为多数据时会显示不正常
    model = [{tes:"ads"},{{tes:"ads"}}]//2个包含个数据的模型可以显示正常
    model = [{tes:"ads",tes1:"ads"},{{tes:"ads",tes1:"ads"}}]//2个包含多个数据的模型可以显示不正常
*/
ComboBox {
    id: control
    //model: [{showStr:"TCP",hello:0},{ showStr:"P2P",hello:2}]

    property string colorNor: "#999999"
    property string colorPressed: "#409EFF"
    property string fontColor: "#BABABA"
    property string bordColor: colorNor
    property string itembordColor: bordColor //子项的边界宽不能设置
    property string itemColorNor: "#272727"
    property string itemColorHoverd: "black"
    property int mRadius: 2
    property int indicatorW: 12
    property int indicatorH: 8


    delegate: ItemDelegate {
        width: control.width
        contentItem: Text {
            text: showStr
            color: fontColor
            font: control.font
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
        }
        highlighted: control.highlightedIndex === index
        background: Rectangle{
            width: parent.width
            height: parent.height
            //border.width: itembordWidth
            color: control.highlightedIndex === index?itemColorHoverd:itemColorNor
        }
    }

    indicator: Canvas {
        id: canvas
        x: control.width - width - control.rightPadding
        y: control.topPadding + (control.availableHeight - height) / 2
        width: indicatorW
        height: indicatorH
        contextType: "2d"

        Connections {
            target: control
            onPressedChanged: canvas.requestPaint()
        }

        onPaint: {
            context.reset();
            context.moveTo(0, 0);
            context.lineTo(width, 0);
            context.lineTo(width / 2, height);
            context.closePath();
            context.fillStyle = control.pressed ? colorPressed :colorNor;
            context.fill();
        }
    }

    contentItem: Text {
        leftPadding: 20
        rightPadding: control.indicator.width + control.spacing
        text: control.displayText
        font: control.font
        color: colorNor
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        implicitWidth: 120
        implicitHeight: 40
        border.color: control.pressed ? colorPressed : bordColor
        border.width: control.visualFocus ? 2 : 1
        color: "transparent"
        radius: mRadius
    }

    popup: Popup {
        y: control.height - 1
        width: control.width
        implicitHeight: contentItem.implicitHeight
        padding: 1

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.popup.visible ? control.delegateModel : null
            //currentIndex: control.highlightedIndex

            ScrollIndicator.vertical: ScrollIndicator { }


        }

        background: Rectangle {

            border.color: itembordColor
           // radius: mRadius
        }
    }
}
