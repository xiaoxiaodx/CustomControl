import QtQuick 2.0
import "./button"
Rectangle {


    color: "#191919"
    property alias myModel: txtModel




    ListModel{
        id:txtModel

    }


    GridView{
        id:gridview1

        model: txtModel

       anchors.fill: parent

        cellHeight:parent.height/3
        cellWidth:parent.width/3
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
