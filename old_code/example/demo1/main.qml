
import QtQuick 2.0
import QtQuick.Layouts 1.1

import Sparrow 1.0
import Sparrow.PopupLayer 1.0


PageStackWindow {

    id: mainWindow

    //! [0]
    initialPage: Page {
    //! [0]

        id: mainView

        //! [1]
        pageStackWindow: mainWindow
        //! [1]

        //! [2]
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
        //! [2]

        //! [3]
        SampleButton {
            text: "Hello"
            anchors.centerIn: parent
            onClicked: {
                about.switchState();

            }
        }
        //! [3]

        //! [4]
        PopupLayer {
            id: about
            parent: mainView
            SampleButton {
                text: qsTr("大魔王")
                anchors.centerIn: parent
                onClicked: Qt.openUrlExternally("https://github.com/GDPURJYFS/Sparrow")
            }
        }
        //! [4]
    }
}

