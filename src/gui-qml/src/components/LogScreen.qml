import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    property string log

    header: ToolBar {
        RowLayout {
            anchors.fill: parent

            ToolButton {
                icon.source: "/images/icons/menu.png"
                onClicked: drawer.open()
            }

            Label {
                text: qsTr("Log")
                elide: Label.ElideRight
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }
        }
    }

    ScrollView {
        anchors.fill: parent
        clip: true
        padding: 6

        Label {
            anchors.fill: parent
            text: log
            textFormat: Text.RichText
        }
    }
}
