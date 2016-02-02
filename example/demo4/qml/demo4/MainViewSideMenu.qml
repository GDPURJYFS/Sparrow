import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4

import QtQml.Models 2.2

import Sparrow 1.0
import Sparrow.PopupLayer 1.0
import Sparrow.PopupLayer.Delegate 1.0
import Sparrow.Utility 1.0

import QtQuick.Dialogs 1.2

import "./Component"

PopupLayer {

    id: optionsMenu

    popupItem.width: parent.width * 0.8
    popupItem.height: parent.height
    popupItem.color: "#343434"

    delegate: PopupLayerSideMenuDelegate {
        // 必须指定 popupItem 和 maskItem
        popupItem: optionsMenu.popupItem
        maskItem: optionsMenu
    }

    Lazyer { id: lazyer }

    Item {
        id: panel
        anchors.fill: parent

        Image {
            id: fenmian
            width: popupItem.width
            height: popupItem.width * 0.75
            source: "./images/tSTAY_0F78B3AF_0200.JPG"

            Column {
                anchors.fill: parent
                anchors.margins: popupItem.width * 0.1

                CircularImage {
                    id: circularImage
                    imageSource: "./images/日笠阳子 - 苍空のモノローグ.jpg"
                    width: panel.width * 0.4
                    height: panel.width * 0.4
                }

                SampleLabel {
                    color: "#343434"
                    text: qsTr("我也是大魔王好不好")
                }
            }
        }

        ListView {
            id: listview
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: fenmian.bottom
            anchors.bottom: parent.bottom
            anchors.margins: parent.width * 0.1
            clip: true

            model: menuButtonModel
            spacing: parent.width * 0.1
            delegate: Item {
                width: parent.width
                height: button.height
                SampleButton {
                    id: button
                    width: parent.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: buttonText
                    onClicked: {
                        // 打开某页
                        optionsMenu.close();
                        lazyer.lazyDo(250, function() {
                            optionsMenu.parent.__PushPage(Qt.resolvedUrl(gotoUrl));
                        });
                    }
                }
            }
        }

        ListModel {
            id: menuButtonModel
            ListElement {
                buttonText: qsTr("图片浏览")
                gotoUrl: "./BusinessPage/ImageViewerPage.qml"
            }
        }
    }
}

