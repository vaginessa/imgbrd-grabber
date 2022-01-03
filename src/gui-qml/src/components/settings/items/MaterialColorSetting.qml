import QtQuick.Controls.Material

import ".."

ColorSetting {
    colors: globals.materialColors.map(c => Material.color(c, Material.Shade700))
    values: globals.materialColors
    labels: globals.materialColorsStr
    showLabels: false
}
