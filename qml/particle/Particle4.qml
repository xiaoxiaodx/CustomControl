import QtQuick 2.12
import QtQuick.Particles 2.12

Rectangle {
    id: root
    border.width: 1
    border.color: "gray"
    color: "black"
    property int score: 0

    ParticleSystem {
        id: particles
        anchors.fill: parent

        ImageParticle {
            source: "qrc:/image/particleA.png"
            colorVariation: 0.1
            color: "#5060160f"
        }


        Emitter{

            x:0
            y:parent.height/2
            emitRate :1
            lifeSpan: 2000
            group: "flame"
            velocity:PointDirection{y: -250;yVariation:10}
            size: 8
            sizeVariation: 4
            width: parent.width
            height: 1




        }
    }


}
