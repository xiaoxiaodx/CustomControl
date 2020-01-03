import QtQuick 2.12
import QtQuick.Particles 2.12

Rectangle {
    border.width: 1
    border.color: "gray"
    color: "black"
    ParticleSystem {
        anchors.fill: parent
        ImageParticle {
            groups: ["stars"]
            anchors.fill: parent
            source: "qrc:/image/star.png"
        }
        Emitter {
            group: "stars"
            emitRate: 800
            lifeSpan: 2400
            size: 4
            sizeVariation: 8
            anchors.fill: parent
        }

        // ![0]
        ImageParticle {
            anchors.fill: parent
            source: "qrc:/image/star.png"
            alpha: 0
            alphaVariation: 0.2
            colorVariation: 1.0
        }
        // ![0]

        Emitter {
            anchors.centerIn: parent
            emitRate: 400
            lifeSpan: 2400
            size: 8
            sizeVariation: 8
            velocity: AngleDirection {angleVariation: 180; magnitude: 60}
        }

        Turbulence {
            anchors.fill: parent
            strength: 2
        }
    }
}

