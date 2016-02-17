import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import Sparrow 1.0

import "./Component"

MainPage {

    id: page

    sideMenu.mainPage: mainPage

    Page {
        id: mainPage

        pageStackWindow: page.pageStackWindow

        width: parent.width
        height: parent.height


        clip: false

        topBar: TopBar {
            id: topbar
            RowLayout {
                anchors.fill: parent
                SampleButton {
                    text: qsTr("About")
                    Layout.fillHeight: true
                    Layout.margins: topbar.height * 0.1
                }
            }
        }

        ListView {
            Component.onCompleted: {
                parent.clip = false
            }
            id: view
            model: 10
            delegate: Rectangle {
                width: pageStackWindow.width
                height: 100
                border.color: "black"
                border.width: 1
                Image {
                    width: parent.height * 0.9
                    height: this.width
                    source: "images./qyvlik.png"
                    sourceSize: Qt.size(width, height)
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                }
                SampleButton {
                    text: "index:"+index
                    anchors.centerIn: parent
                    onClicked: {
                        console.log(index)
                    }
                }

//                MouseArea {
//                    anchors.fill: parent
//                    onClicked: {
//                        console.log("ListView Item")
//                    }
//                }
            }
            width: parent.width
            height: parent.height

            SwipeArea {
                id: swipeArea
                width: mainPage.width
                height: mainPage.height
                property bool needAnimation: true

                property Item swipeItem: mainPage

                property bool isShow: false

                startArea: Qt.rect(0, 0,
                                   swipeArea.width*0.2, swipeArea.height)

                // You can remove this Tracker
                //Tracker {}

                NumberAnimation {
                    id: swipeAreaAnimation
                    target: swipeArea
                    property: "x"
                    duration: 200
                }

                NumberAnimation {
                    id: animation
                    target: swipeArea.swipeItem
                    property: "x"
                    duration: 200
                }

                function startAnimation() {
                    if(needAnimation) {
                        animation.start();
                        swipeAreaAnimation.start();
                        if(isShow) {
                            startArea =Qt.rect(0, 0,
                                               swipeArea.width, swipeArea.height)
                        } else {
                            startArea = Qt.rect(0, 0,
                                                swipeArea.width*0.2, swipeArea.height)
                        }
                    }
                }

                onLeftToRight: {
                    lockFlickableView(view);
                    if(swipeArea.swipeItem.x <= swipeArea.swipeItem.width * 0.8) {
                        swipeArea.swipeItem.x += offset;
                        swipeArea.x -= offset;
                        animation.to = swipeArea.swipeItem.width * 0.8;
                        swipeAreaAnimation.to = -swipeArea.swipeItem.width * 0.8;
                        needAnimation = true;
                        isShow = true;
                    } else {
                        needAnimation = false;
                    }

                    //console.log("left to right:", offset)
                }

                onRightToLeft: {
                    lockFlickableView(view);
                    if(swipeArea.swipeItem.x > 0) {
                        if(swipeArea.swipeItem.x - offset < 0) {
                            offset = swipeArea.swipeItem.x;
                        }

                        swipeArea.swipeItem.x -= offset;
                        swipeArea.x += offset;
                        animation.to = 0;
                        swipeAreaAnimation.to = 0;
                        needAnimation = true;
                        isShow = false;
                    } else {
                        needAnimation = false;
                    }

                    //console.log("right to left:", offset)
                }

                onReleased: {
                    unLockFlickableView(view);
                    startAnimation();
                }
            }
        }
    }




}

