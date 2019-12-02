import QtQuick 2.0

Rectangle {

    ListModel{
        id:testModel
        Component.onCompleted: {
            testModel.append({showStr:"tcp"})
            testModel.append({showStr:"p2p"})
            testModel.append({showStr:"http"})
        }
    }


    border.width: 1
    border.color: "gray"
    color: "transparent"

    ComBox{

        width: 200
        height: 40
        model: testModel
        font.pixelSize: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 20
    }
}
