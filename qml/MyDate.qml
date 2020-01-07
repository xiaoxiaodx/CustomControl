import QtQuick 2.0

Rectangle {


    color: "#191919"
    property alias myModel: dateModel




    ListModel{
        id:dateModel
    }

    GridView{
        id:gridview1

       model: dateModel

       anchors.fill: parent

        cellHeight:parent.height/2
        cellWidth:parent.width/2
        delegate: Rectangle{
            id:gridviewitem
            color: "transparent"
            width: gridview1.cellWidth
            height: gridview1.cellHeight

            Loader{

                x:0
                y:0
                width: parent.width
                height: parent.height
                source : qmlSrc
            }
        }

    }
}
