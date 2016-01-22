
import QtQuick 2.0
import QtQuick.Layouts 1.1

import Sparrow 1.0
import Sparrow.PopupLayer 1.0

import BusinessPage 1.0 as BR

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
                    //! [0]
                    stackView.pop();
                    //! [0]
                }
            }
        }
    }

    ColumnLayout {
        id: mainLayout

        anchors.fill: parent
        anchors.margins: parent.width * 0.05
        spacing: parent.width * 0.05

        SampleButton {
            Layout.fillWidth: true
            text: qsTr("SecondPage")
            onClicked: {
                //! [0]
                 __PushPage(BR.R.secondPage)
                //! [0]
            }
        }
    }
}


