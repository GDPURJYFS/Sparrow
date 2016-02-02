import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4

import Sparrow 1.0
import Sparrow.PopupLayer 1.0

import QtQuick.Dialogs 1.2

Page {
    id: page

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
                text: qsTr("返回")
                onClicked: {
                    stackView.pop()
                }
            }
            CheckBox {
                visible: imageExplorer.selecting
                text: "全选"
                property bool selectAll: true
                onClicked: {
                    imageExplorer.selectAll(selectAll)
                }
            }

            SampleButton {
                text: qsTr("打开文件夹")
                visible: imageExplorer.selecting
                Layout.fillHeight: true
                Layout.margins: topBar.height * 0.15
                Layout.alignment: Qt.AlignRight
                onClicked: {
                    //imageExplorer.selectFinished()
                    fileDialog.open()
                }
            }

        }
    }

    ImageExplorer {
        id: imageExplorer
        anchors.fill: parent
        // windowsxp 后缀 windows7 下需要使用file:/前缀
        //folder: "file:/F:/素材/做视频的图包/001"
        // file:/F:/素材/做视频的图包/002
        onSelect: {
            console.log(fileUrls.length);
        }
        onSelectOne: {
            showImage.showImage(fileUrl);
        }
    }

    FileDialog {
        id: fileDialog
        //visible: true
        //folder: shortcuts.pictures
        selectFolder: true
        onAccepted: {
            imageExplorer.folder = Qt.resolvedUrl(fileDialog.fileUrl);
            console.log( imageExplorer.folder)
        }
        onRejected: {
            fileDialog.close()
        }

    }

    PopupLayer {
        id: showImage

        popupItem.width: page.width
        popupItem.height: page.width < page.height
                          ? page.width * 0.5
                          : page.height * 0.3

        Item {
            anchors.fill: parent
            Image {
                id: image
                fillMode: Image.PreserveAspectFit
                anchors.fill: parent
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    showImage.close();
                }
            }
        }

        function showImage(url) {
            showImage.open();
            image.source = url;
        }
    }

}

