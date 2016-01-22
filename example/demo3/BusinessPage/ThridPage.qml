
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

    SampleButton {
        anchors.centerIn: parent
        text: qsTr("ThridPage")
    }
}


