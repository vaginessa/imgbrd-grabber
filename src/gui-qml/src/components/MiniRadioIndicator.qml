import QtQuick
import QtQuick.Controls
import QtQuick.Controls.impl

Rectangle {
    property Item control
    property int size: 28

    implicitWidth: size
    implicitHeight: size

    x: control.mirrored ? control.leftPadding : control.width - width - control.rightPadding
    y: control.topPadding + (control.availableHeight - height) / 2

    radius: width / 2
    color: control.down
        ? (control.visualFocus ? "#CCE0FF" : "#F6F6F6") // focusPressedColor / indicatorPressedColor
        : (control.visualFocus ? "#F0F6FF" : "#FFFFFF") // focusLightColor / backgroundColor
    border.width: control.visualFocus ? 2 : 1
    border.color: control.visualFocus ? "#0066FF" : (control.down ? "#808080" : "#909090") // focusColor / indicatorFramePressedColor / indicatorFrameColor
    opacity: enabled ? 1 : 0.3

    Rectangle {
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        width: size - 8
        height: size - 8
        radius: width / 2
        color: control.down ? "#26282A" : "#353637" // textDarkColor / buttonCheckedColor
        visible: control.checked
    }
}
