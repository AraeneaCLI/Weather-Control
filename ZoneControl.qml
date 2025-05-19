import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


Pane {
    id:root

    property string zoneName

    background: Rectangle{
        color: "black"
        opacity: 0.5
    }

    RowLayout{
        anchors.fill: parent

        spacing:10

        ColumnLayout{
            spacing:10

            RowLayout{
                spacing: 10

                CheckBox{
                    id: zoneenabledcheckbox
                    checked: true
                    text: qsTr("Enable %1").arg(root.zoneName)

                    onClicked: console.log(`Check Box Clicked ${checkState}`)
                }
            }
        }
        ColumnLayout{
            spacing:10
        }
    }
}
