import QtQuick 2.0



Rectangle{
    id:root
    property alias txtColor: txt.color
    property alias flagColor: flag.color
    property string imgSrc:""
    property string imgSrcEnter: ""
    property alias txtStr: txt.text
    property color bgColor: "#000000"
    property color bgColorEnter: "#000000"

    signal click()
    color: bgColor

    Rectangle{
        id:flag
        width: 4
        height: parent.height
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 2
    }

    Text {
        id: txt
        x:flag.x + (parent.width - img.width - flag.width -txt.width)/2
        y:(parent.height - txt.height)/2
        font.pixelSize: 20
    }

    Image {
        id: img
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        source: imgSrc
    }

    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onPressed: {
            txt.x = txt.x + 1
            txt.y = txt.y + 1

        }
        onReleased: {
            txt.x = txt.x - 1
            txt.y = txt.y - 1
        }

        onClicked: {
            click()
        }
        onExited: {
            root.color = bgColor
            img.source = imgSrc
        }
        onEntered: {
            root.color = bgColorEnter
            img.source = imgSrcEnter
        }
    }

}
