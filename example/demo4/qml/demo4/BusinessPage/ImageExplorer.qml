import QtQuick 2.5
import QtQuick.Controls 1.2

import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2

import Qt.labs.folderlistmodel 2.1

import Sparrow 1.0

Page {
    id: page
    focus: true

    signal select(var fileUrls)
    signal selectOne(url fileUrl)

    property int rowCellCount: 3
    property bool selecting: true
    property alias folder: folderModel.folder

    property size cellSize: Qt.size(page.width/rowCellCount, page.width/rowCellCount)

    function selectAll(yes) {
        helperModel.selectAll(yes);
    }

    function selectFinished() {
        var iter = 0, fileUrls = [];
        for(iter; iter<folderModel.count; iter++) {
            if(helperModel.get(iter).checked) {
                fileUrls.push(folderModel.get(iter, "fileURL"));
            }
        }
        select(fileUrls);
    }

    FolderListModel {
        id: folderModel
        showDirs: false
        sortField: FolderListModel.Time
        nameFilters:
            ["*.bmp","*.gif","*.jpg",
            "*.jpeg","*.png","*.pbm"
            ,"*.pgm","*.ppm", "*.xbm",
            "*.xpm", "*.svg"]

        onFolderChanged: {
            var iter = 0;
            helperModel.clear();
            while(iter++ < count) {
                helperModel.append({"checked": false});
            }
        }

        onCountChanged: {
            var iter = 0;
            helperModel.clear();
            while(iter++ < count) {
                helperModel.append({"checked": false});
            }
        }
    }

    ListModel {
        id: helperModel
        function selectAll(flag) {
            for(var iter=0; iter < helperModel.count; iter++) {
                helperModel.setProperty(iter, "checked", flag);
            }
        }
    }


    Component {
        id: imageDelegate

        Rectangle {
            width: cellSize.width
            height: cellSize.height
            color: "#eee"
            border.width: 2
            border.color: "#ccc"
            clip: true
            GridView.delayRemove: true

            Image {
                Layout.leftMargin: 10
                width: cellSize.width - parent.border.width
                height: cellSize.height - parent.border.width
                sourceSize: Qt.size(width*0.7, height*0.7)
                fillMode: Image.PreserveAspectCrop
                asynchronous: true
                anchors.centerIn: parent
                source: fileURL
                cache: true

                BusyIndicator {
                    anchors.centerIn: parent
                    running: parent.status == Image.Loading
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        selectOne(fileURL);
                    }
                }
                CheckBox {
                    id: checkBox
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.margins: 10
                    visible: selecting
                    checked: helperModel.get(index).checked
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            helperModel.setProperty(index, "checked", !checkBox.checked)
                        }
                    }
                }
            }
        }

    }   // imageDelegate

    GridView {
        id: gridView
        anchors.fill: parent
        focus: true
        cellWidth: cellSize.width
        cellHeight: cellSize.height
//        cacheBuffer: cellHeight * ApplicationSettings.gridViewBufferBlock
//        displayMarginBeginning: cellHeight * 10
//        displayMarginEnd: cellHeight * 10

        model: folderModel
        delegate: imageDelegate
    }
}

