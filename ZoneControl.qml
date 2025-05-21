import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


Pane {
    id:root

    property string zoneName

    property int celcius: temperatureDial.value
    property int  farhenite: (celcius * 1.8) +32

    readonly property color temperatureColor: {
          if (celcius < 10)
              return Qt.color("lightblue")
          else if ( celcius >= 10 && celcius < 20)
              return Qt.color("cyan")
          else if (celcius >= 20 && celcius < 30)
              return Qt.color("orange")
          else
              return Qt.color("red")
      }

    palette {
        windowText: root.temperatureColor
        dark: root.temperatureColor
      }

    background: Rectangle{
        color: "black"
        opacity: 0.5
    }

    RowLayout{
        anchors.fill: parent

        spacing:10

        ColumnLayout{
            id: leftColumn
            spacing:10

            RowLayout{
                spacing: 10

                CheckBox{
                    id: zoneenabledcheckbox
                    checked: true
                    text: qsTr("Enable %1").arg(root.zoneName)

                    onClicked: console.log(`Check Box Clicked ${checkState}`)
                }

                Switch{
                    id: unitsSwitch

                    text: qsTr("\u00B0 C / \u00B0 F")
                }
            }

            RowLayout{
                enabled: zoneenabledcheckbox.checked
                spacing: 10

                Image {
                    id: coolimage
                    source: "assets/cool.svg"
                    Layout.alignment: Qt.AlignBottom
                }

                Dial{
                    id: temperatureDial
                    from: 0
                    to: 40

                    stepSize: 1
                    snapMode: Dial.SnapAlways

                    onValueChanged:  console.log("Value of Dial", value)
                }

                Image {
                    id: heatimage
                    source: "assets/heat.svg"
                    Layout.alignment: Qt.AlignBottom
                }

            }
        }
        ColumnLayout{
            spacing: 10

            Label{
                text:unitsSwitch.checked ? root.farhenite + "\u00B0 F": root.celcius + "\u00B0 C"
                font{
                    weight: font.ExtraLight
                    pixelSize: 200
                }

                Layout.fillWidth: true
                horizontalAlignment: Qt.AlignRight

                // renderTypeQuality: Text.HighRenderTypeQuality
                renderType: Text.CurveRendering

            }

            RowLayout{
                Image {
                    source: fanSpeedSlider.value > 0 ? Qt.resolvedUrl("assets/fan_outline.svg") :
                                                       Qt.resolvedUrl("assets/fan_off.svg")
                    scale: 0.75
                }

                Slider {
                    id: fanSpeedSlider

                    from: 0
                    to: 100

                    Layout.fillWidth: true
                }

                Image {
                    source: Qt.resolvedUrl("assets/fan_fill.svg")
                    scale: 1.25
                }
            }
        }
    }
}
