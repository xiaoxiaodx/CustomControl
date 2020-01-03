import QtQuick 2.12
import QtQuick.Particles 2.0
Rectangle {
    id: root
    border.width: 1
    border.color: "gray"
    color: "black"

    ParticleSystem {
        id: particles
        anchors.fill: parent
        ImageParticle {
            id: smokePainter
            groups: ['flame']
            source: "qrc:/image/particleA.png"
            color: "#ffffff"
        }

        Emitter{
            x:root.width/2
            y:root.height
            emitRate :3
            lifeSpan: 3000
            group: "flame"
            velocity:PointDirection{y: -100;yVariation:10}

            size: 12
            sizeVariation: 2
            width: 2
            height: 1
        }

        Affector {
            groups: ["flame"]
            anchors.fill: parent
            once: true
            acceleration: PointDirection { y: 20 }
        }
    }


}
