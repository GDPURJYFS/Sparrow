
import QtQuick 2.0
import QtQuick.Layouts 1.1

import Sparrow 1.0
import Sparrow.PopupLayer 1.0


Page {
    id: page

    topBar: TopBar {
        id: topbar
        RowLayout {
            anchors.fill: parent
            SampleButton {
                text: qsTr("返回")
                Layout.fillHeight: true
                Layout.margins: topbar.height * 0.1
                onClicked: {
                    stackView.pop();
                }
            }
        }
    }

    Rectangle {
        id: item
        width: parent.width * 0.5
        height: parent.width * 0.5

        anchors.centerIn: parent

        NumberAnimation on rotation {
            duration: 2000
            from: 360
            to: 0
            loops: Animation.Infinite
        }


        ColorAnimation on color {
            from: "white"
            to: "black"
            duration: 2000
            loops: Animation.Infinite
        }
    }
}


