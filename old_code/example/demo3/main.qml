
import QtQuick 2.0
import QtQuick.Layouts 1.1

import Sparrow 1.0
import Sparrow.PopupLayer 1.0

import BusinessPage 1.0 as BR

PageStackWindow {

    id: mainWindow

    initialPage: Page {

        id: mainView

        pageStackWindow: mainWindow

        topBar: TopBar {
            id: topbar
            RowLayout {
                anchors.fill: parent

                SampleButton {
                    text: qsTr("关于")
                    Layout.fillHeight: true
                    Layout.margins: topbar.height * 0.1
                    Layout.alignment: Qt.AlignRight
                    onClicked: {
                        about.switchState()
                    }
                }
            }
        }

        SampleButton {
            text: qsTr("FirstPage")
            anchors.centerIn: parent
            onClicked: {
                //! [0]
                mainView.__PushPage(BR.R.firstPage)
                //! [0]
            }
        }

        PopupLayer {
            id: about
            parent: mainView
            SampleButton {
                text: qsTr("大魔王")
                anchors.centerIn: parent
                onClicked: Qt.openUrlExternally("https://github.com/GDPURJYFS/Sparrow")
            }
        }

    }
}

