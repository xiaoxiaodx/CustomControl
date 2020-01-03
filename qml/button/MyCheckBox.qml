import QtQuick 2.0
import QtQuick 2.12
 import QtQuick.Controls 2.12
CheckBox {
    id: control

    property string checkedSrc: ""
    property string uncheckedSrc: ""
    property string txtColorNor: ""
    property string txtColorSelect: ""




    indicator: Image {

        x: control.leftPadding
        anchors.verticalCenter: parent.verticalCenter
        source: control.checked ?"qrc:/image/select.png":"qrc:/image/unselect.png"

    }

    font.pixelSize: 20
    contentItem: Text {
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: control.checked ? txtColorSelect : txtColorNor
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + control.spacing
    }
}
