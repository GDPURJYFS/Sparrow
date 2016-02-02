import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4

import QtQml.Models 2.2

import Sparrow 1.0
import Sparrow.PopupLayer 1.0
import Sparrow.PopupLayer.Delegate 1.0

import QtQuick.Dialogs 1.2

import "./Component"

Page {

//    ColorDialog {
//        id: color
//        visible: true
//    }

    id: page
    // 系统状态栏预留位置
    topBarArea.height: topBar.height + systemStateBarHeight
    topBarArea.color: topBar.backgroundColor

    topBar: TopBar {
        id: topBar
        RowLayout {
            anchors.fill: parent
            SampleButton {
                Layout.fillHeight: true
                Layout.margins: topBar.height * 0.15
                Layout.alignment: Qt.AlignLeft
                text: qsTr("Menu")
                onClicked: {
                    optionsMenu.open()
                }
            }

            SampleButton {
                Layout.fillHeight: true
                Layout.margins: topBar.height * 0.15
                Layout.alignment: Qt.AlignRight
                text: qsTr("About")
            }
        }
    }

    SampleButton {
        text: qsTr("打开")
        anchors.centerIn: parent
        onClicked: {
            __PushPage(Qt.resolvedUrl("./BusinessPage/ImageViewerPage.qml"))
        }
    }


    MainViewSideMenu {
        id: optionsMenu
        parent: page
    }


}

