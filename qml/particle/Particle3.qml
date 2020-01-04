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

        Friction {
            groups: ['flame','brust']
            anchors.top: parent.top
            width: parent.width; height: 2
            threshold: 1
            factor: 0.9
        }

        ImageParticle {
            id: flamePainter
            groups: ['flame']
            source: "qrc:/image/star.png"
            alphaVariation: 0.4
            colorVariation: 0.9
        }
        Emitter{
            y:root.height
            emitRate :1
            lifeSpan: 2000
            group: "flame"
            velocity:PointDirection{y: -250;yVariation:10}
            size: 8
            sizeVariation: 4
            width: parent.width
            height: 1
        }

        ImageParticle {
            id: smoke
            groups: ['smoke']
            source: "qrc:/image/glowdot.png"
            color: "#bfbfbf"
            colorVariation: 0.1
        }
        TrailEmitter{
            id:emitFlame
            follow: 'flame'
            group: "smoke"
            emitRatePerParticle: 100
            size: 4
            sizeVariation: 2
            velocity: AngleDirection{angle: 85;angleVariation: 10;magnitude: 50;magnitudeVariation: 10}
            lifeSpan: 500
            endSize: 0
        }


        Affector {
            groups: ["flame","smoke","brust"]
            anchors.fill: parent
            once: true
            acceleration: PointDirection { y: 20 }
        }



        ImageParticle {
            id: brustParticle
            groups: ["brust"]
            source: "qrc:///particleresources/star.png"
            alpha: 0
            colorVariation: 0.2
            entryEffect: ImageParticle.Scale
            rotation: 60
            rotationVariation: 30
            rotationVelocity: 45
            rotationVelocityVariation: 15
        }

        Emitter {
            id: burstEmitter
            group: "brust"
            emitRate: 3000; lifeSpan: 3000;
            size: 30; endSize: 5; sizeVariation:10
            enabled: false
            velocity: CumulativeDirection {
                AngleDirection {angleVariation: 360; magnitudeVariation: 80;}
                PointDirection {y: 20}
            }
            acceleration: PointDirection {y: 10 }
        }

        Affector {
            system: particles
            width: parent.width
            height: 50; y: 10
            once: true
            groups: "flame"
            onAffectParticles: {
                for (var i=0; i<particles.length; i++) {
                    burstEmitter.burst(200, particles[i].x, particles[i].y);
                    brustParticle.color = Qt.rgba(particles[i].red,
                                                  particles[i].green,
                                                  particles[i].blue,
                                                  particles[i].alpha)

                }
            }
        }


    }


}
