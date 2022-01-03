import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

Rectangle {
    color: Material.theme == Material.Dark
        ? Qt.rgba(0, 0, 0, 0.5)
        : Qt.rgba(1, 1, 1, 0.5)

    BusyIndicator {
        anchors.centerIn: parent
    }
}
