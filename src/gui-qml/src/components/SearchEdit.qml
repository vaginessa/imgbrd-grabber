import Grabber
import QtQuick
import QtQuick.Controls

TextEdit {
    id: root

    signal enterPressed()
    property alias placeholderText: placeholder.text

    verticalAlignment: Text.AlignVCenter
    font.pixelSize: 14
    inputMethodHints: Qt.ImhPreferLowercase

    Keys.onEnterPressed: {
        Qt.inputMethod.hide()
        root.enterPressed()
        event.accepted = true
    }
    Keys.onReturnPressed: {
        Qt.inputMethod.hide()
        root.enterPressed()
        event.accepted = true
    }

    Text {
        id: placeholder

        anchors.fill: parent
        verticalAlignment: Text.AlignVCenter
        visible: !(parent.text.length || parent.inputMethodComposing)
        font: parent.font
        color: "#666"
    }

    SyntaxHighlighterHelper {
        quickDocument: root.textDocument
    }
}
