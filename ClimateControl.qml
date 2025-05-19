import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Page{
    padding: 10

    header: Label{
        text: qsTr("Climate Control")
        color: "white"
        font.pixelSize: 42
        padding:10
    }

    background:null

    ColumnLayout{
        anchors.fill: parent
        spacing: 10


        ZoneControl{
            id: zone1

            zoneName: "zone1"
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        ZoneControl{
            id: zone2
            zoneName: "zone2"
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
