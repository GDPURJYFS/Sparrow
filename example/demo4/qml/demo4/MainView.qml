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

Page {

    //    ColorDialog {
    //        id: color
    //        visible: true
    //    }

    id: page
    // 系统状态栏预留位置

    focus: true
    Keys.onBackPressed: {
        event.accepted = true;
        optionsMenu.close();
    }

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

    //    background: Image {
    //        anchors.fill: parent
    //        source: "./images/tSTAY_0F78B3AF_0200.JPG"
    //    }

    //    SampleButton {
    //        text: qsTr("打开")
    //        anchors.centerIn: parent
    //        onClicked: {
    //            __PushPage(Qt.resolvedUrl("./BusinessPage/ImageViewerPage.qml"))
    //        }
    //    }

    //    Text {
    //        text: '<font size="5">5</font>
    //<font size="10">10</font>
    //<img src="./images/icon_002.gif" />
    //<img src="./images/tSTAY_0F78B3AF_0200.JPG" />'
    //        textFormat: Text.RichText
    ////        font.pixelSize: 30
    ////        font.family: "微软雅黑"
    //    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: parent.width * 0.05
        Rectangle{
            Layout.fillWidth: true
            Layout.fillHeight: true
            border.color: "black"
            border.width: 1
            clip: true
            TextEdit {
                id: textInput
                anchors.fill: parent
                textFormat: TextEdit.RichText
                font.pointSize: 20
                wrapMode: TextEdit.WrapAtWordBoundaryOrAnywhere
                FontMetrics {
                    id: textMetrics
                    font: textInput.font
                }

                Lazyer { id: lazyer }

                Keys.onPressed: {
                    if(event.key === Qt.Key_A) {
                        event.acceptd = true;
                        textInput.insert(textInput.cursorPosition
                                         ,"<img src='./images/emoji/emoji_340.png' width=%1 height=%2/>".arg(textMetrics.height).arg(textMetrics.height));
//                        lazyer.lazyDo(1, function(){
//                            textInput.remove(textInput.length-1, textInput.length);
//                        });
                    }
                }
            }
        }
        Text {
            id: label
            font.pixelSize: 24
            text: if (1 == 0)
                label.text = "type" + " (default)"
            else
                text: "type"
        }
        SampleButton {
            text: qsTr("insert emoji")
            onClicked: {
                textInput.insert(textInput.positionAt(textInput.x+textInput.width,
                                                      textInput.y+textInput.height)
                                 ,"<img src='./images/emoji/emoji_340.png' />")
            }
        }
    }




    /*
'<font size="5">5</font>
<font size="10">10</font>
<img src="./images/icon_002.gif" />
<img src="./images/tSTAY_0F78B3AF_0200.JPG" />'
*/

    MainViewSideMenu {
        id: optionsMenu
        parent: page
    }
    Component.onCompleted: {

    }
}

