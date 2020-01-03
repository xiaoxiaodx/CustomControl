import QtQuick 2.0

Rectangle {


    //外部属性
    property string waveColor: "#ff0000"
    property int timeInter: 0
    property bool haveWave: true
    //内部属性
    property int radius: 0
    property int maxRadius: 0
    property int radiusX: 0
    property int radiusY: 0
    property bool isClick: false

    signal leftPressed()
    signal leftClick()
    signal doubleClick()
    signal rightClick()
    signal leftReleased()
    signal enter()
    signal exit()
    Canvas {
        id: mycanvas
        width: parent.width
        height: parent.height


        // renderStrategy:Canvas.Threaded
        onPaint: {
            var ctx = getContext("2d")
            if(isClick){
                ctx.clearRect(0,0,width,height)
                isClick = false
                return
            }

            if(radius>maxRadius){
                // ctx.eraseRect(0,0,width,height);
                timer.stop();
                radius = 0;
                ctx.clearRect(0,0,width,height)
            }else{
                ctx.fillStyle = waveColor

                ctx.beginPath();
                ctx.arc(radiusX,radiusY,radius,0,Math.PI*2);
                //ctx.stroke();
                ctx.fill();




            }
        }
    }

    MouseArea{
        id:mouse1
        hoverEnabled: true
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: {
            //console.debug("111111111111111111")
            if (mouse.button == Qt.RightButton){
                rightClick()
            }else{
                leftClick()
                if(haveWave){
                    radiusX = mouse1.mouseX
                    radiusY = mouse1.mouseY
                    var radiusW = radiusX>width/2 ?radiusX:width-radiusX
                    var radiusH = radiusY>height/2?radiusY:height-radiusY
                    maxRadius = Math.sqrt(radiusW*radiusW + radiusH*radiusH)
                    isClick = true
                    mycanvas.requestPaint()
                    timer.start();
                    radius = 0
                }
            }
        }
        onDoubleClicked: doubleClick()
        onPressed:leftPressed()
        onReleased: leftReleased()
        onEntered: enter();
        onExited: exit();


    }

    Timer{
        id:timer
        repeat: true
        interval: timeInter

        onTriggered:{
            radius+=10
            mycanvas.requestPaint()
        }


    }
}
