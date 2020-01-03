import QtQuick 2.12
import QtQuick.Particles 2.12

Rectangle {
    id: root
    border.width: 1
    border.color: "gray"
    color: "black"
    property int score: 0
    Text {
        color: "white"
        anchors.right: parent.right
        text: score
    }

    ParticleSystem {
        id: particles
        anchors.fill: parent
        // ![unlit]
        ParticleGroup {
            name: "unlit"
            duration: 1000
            to: {"lighting":1, "unlit":99}
            ImageParticle {
                source: "qrc:/image/particleA.png"
                colorVariation: 0.1
                color: "#5060160f"
            }
            GroupGoal {
                whenCollidingWith: ["lit"]
                goalState: "lighting"
                jump: true
            }
        }
        // ![unlit]
        // ![lighting]
        ParticleGroup {
            name: "lighting"
            duration: 100
            to: {"lit":1}
        }
        // ![lighting]
        // ![lit]
        ParticleGroup {
            name: "lit"
            duration: 10000
            onEntered: score++;
            TrailEmitter {
                id: fireballFlame
                group: "flame"
                emitRatePerParticle: 48
                lifeSpan: 200
                emitWidth: 8
                emitHeight: 8
                size: 24
                sizeVariation: 8
                endSize: 4
            }

            TrailEmitter {
                id: fireballSmoke
                group: "smoke"
                emitRatePerParticle: 120
                lifeSpan: 2000
                emitWidth: 16
                emitHeight: 16
                velocity: PointDirection {yVariation: 16; xVariation: 16}
                acceleration: PointDirection {y: -16}
                size: 24
                sizeVariation: 8
                endSize: 8
            }
        }

        ImageParticle {
            id: smoke
            anchors.fill: parent
            groups: ["smoke"]
            source: "qrc:///particleresources/glowdot.png"
            colorVariation: 0
            color: "#00111111"
        }
        ImageParticle {
            id: pilot
            anchors.fill: parent
            groups: ["pilot"]
            source: "qrc:///particleresources/glowdot.png"
            redVariation: 0.01
            blueVariation: 0.4
            color: "#0010004f"
        }
        ImageParticle {
            id: flame
            anchors.fill: parent
            groups: ["flame", "lit", "lighting"]
            source: "qrc:/image/particleA.png"
            colorVariation: 0.1
            color: "#00ff400f"
        }

        Emitter {
            height: parent.height/2
            emitRate: 4
            lifeSpan: 4000//TODO: Infinite & kill zone
            size: 24
            sizeVariation: 4
            velocity: PointDirection {x:120; xVariation: 80; yVariation: 50}
            acceleration: PointDirection {y:120}
            group: "unlit"
        }

        Emitter {
            id: flamer
            x: 100
            y: 300
            group: "pilot"
            emitRate: 80
            lifeSpan: 600
            size: 24
            sizeVariation: 2
            endSize: 0
            velocity: PointDirection { y:-100; yVariation: 4; xVariation: 4 }
            GroupGoal {
                groups: ["unlit"]
                goalState: "lit"
                jump: true
                system: particles
                x: -15
                y: -55
                height: 75
                width: 30
                shape: MaskShape {source: "qrc:/image/matchmask.png"}
            }
            // ![groupgoal-pilot]
        }

        GroupGoal {
            groups: ["unlit"]
            goalState: "lighting"
            jump: true
            enabled: ma.pressed
            width: 18
            height: 18
            x: ma.mouseX - width/2
            y: ma.mouseY - height/2
        }

        MouseArea {
            id: ma
            anchors.fill: parent
        }
    }
}
