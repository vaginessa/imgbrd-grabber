import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtQuick.Layouts
import Qt.labs.platform as Labs

Page {
    id: root

    signal accepted()
    signal rejected()

    padding: 16

    header: ToolBar {
        RowLayout {
            anchors.fill: parent

            ToolButton {
                icon.source: "/images/icons/back.png"
                onClicked: root.rejected()
            }

            Label {
                text: qsTr("Add new source")
                elide: Label.ElideRight
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }
        }
    }

    Labs.MessageDialog {
        id: errorDialog
        title: qsTr("Error")
        // TODO QT6 icon: StandardIcon.Critical
    }

    ColumnLayout {
        anchors.fill: parent

        Label {
            Layout.fillWidth: true
            text: qsTr("Type")
        }
        ComboBox {
            id: typeField
            Layout.fillWidth: true
            model: backend.sources
        }

        Label {
            Layout.fillWidth: true
            text: qsTr("URL")
        }
        TextField {
            id: urlField
            Layout.fillWidth: true
        }

        CheckBox {
            id: httpsField
            Layout.fillWidth: true
            text: qsTr("HTTPS")
            checked: true
        }

        Item {
            Layout.fillHeight: true
        }
    }

    footer: Button {
        Layout.fillWidth: true
        text: qsTr("Add")

        onClicked: {
            var result = backend.addSite(typeField.currentText, urlField.text, httpsField.checked)
            if (result !== "") {
                errorDialog.text = result
                errorDialog.open()
            } else {
                root.accepted()
            }
        }
    }
}
