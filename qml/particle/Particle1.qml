import QtQuick 2.12
import QtQuick.Particles 2.12

Rectangle {
    id:root
    border.width: 1
    border.color: "gray"
    color: "black"
    ParticleSystem {
        anchors.fill: parent
        ImageParticle {
            groups: ["A"]
            anchors.fill: parent
            source: "qrc:/image/star.png"
            color:"#FF1010"
            redVariation: 0.8
        }

        Emitter {
            group: "A"
            emitRate: 200
            lifeSpan: 4000
            size: 8
            sizeVariation: 8
            velocity: PointDirection{ x: root.width/4; xVariation: 20 }
            width: 0
            height: root.height/6
        }

        //! [A]
        Affector {
            groups: ["A"]
            x: root.width/3
            width: root.width/3
            height: root.height/3
            once: true
            position: PointDirection { x: 120; }
            acceleration: PointDirection { y: 0; x: 500; }

        }
        //! [A]

        ImageParticle {
            groups: ["B"]
            anchors.fill: parent
            source: "qrc:/image/star.png"
            color:"#10FF10"
            greenVariation: 0.8
        }

        Emitter {
            group: "B"
            emitRate: 200
            lifeSpan: 4000
            size: 8
            sizeVariation: 8
            velocity: PointDirection{ x: 240; xVariation: 60 }
            y: root.height/2
            width: 10
            height: 20
        }

        //! [B]
        Affector {
            groups: ["B"]
            x: root.width/2
            y: root.height/2
            width: 80
            height: root.height/2
            once: true
            velocity: AngleDirection { angleVariation:360; magnitude: 72 }
        }
        //! [B]

        ImageParticle {
            groups: ["C"]
            anchors.fill: parent
            source: "qrc:/image/star.png"
            color:"#1010FF"
            blueVariation: 0.8
        }

//        Emitter {
//            group: "C"
//            y: root.height*3/4
//            emitRate: 100
//            lifeSpan: 2800
//            size: 8
//            sizeVariation: 8
//            velocity: PointDirection{ x: 80; xVariation: 10 }
//            acceleration: PointDirection { y: 10; x: 20; }
//            width: 80
//            height: root.height/4
//        }

        //! [C]
//        Affector {
//            groups: ["C"]
//            x: root.width*3/4
//            y: root.height*3/4
//            width: 80
//            height: root.height/4
//            once: true
//            relative: false
//            acceleration: PointDirection { y: -180; }
//        }

        Emitter {
            group: "C"
            y: root.height*3/4
            emitRate: 300
            lifeSpan: 3500
            size: 8
            sizeVariation: 8
            velocity: PointDirection{ x: 80; xVariation: 10 }
            acceleration: PointDirection { y: 0; x: 20; }
            width: 80
            height: 80
        }

        Affector {
            groups: ["C"]
            x: root.width/2
            y: root.height*3/4
            width: 80
            height: 120
            once: true
            relative: false
            acceleration: PointDirection { y: -100; }
        }

    }
}
