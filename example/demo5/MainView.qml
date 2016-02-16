import QtQuick 2.0
import QtQuick.Layouts 1.1

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
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log("ListView Item")
                    }
                }
            }
            width: parent.width
            height: parent.height

            SwipeArea {
                id: swipeArea
                width: mainPage.width
                height: mainPage.height
                property bool needAnimation: true

                property Item swipeItem: mainPage

                // You can remove this Tracker
                Tracker {}

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

