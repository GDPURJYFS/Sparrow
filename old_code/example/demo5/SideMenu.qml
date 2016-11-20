import QtQuick 2.0
import QtQuick.Layouts 1.1

import Sparrow 1.0

import "./Component"

Item {
    id: sideMenu
    
    property Item mainPage
    
    width: parent.width * 0.8
    height: parent.height
    property real moveX: mainPage.x / (mainPage.width * 0.8)
    x: -sideMenu.width * 0.5 + moveX * (sideMenu.width*0.5)
    //z: mainPage.z -2
    property bool isShow: sideMenu.x == 0
    onIsShowChanged: {
        if(isShow) {
            sideMenu.z = mainPage.z + 1
            sideMenu.enabled = true;
        } else {
            sideMenu.z = mainPage.z
            sideMenu.enabled = false;
        }
    }
    
    Column {
        anchors.fill: parent
        anchors {
            top: parent.top
            left: parent.left
            margins: 10
        }
        Image {
            id: image
            width: parent.width * 0.3
            height: this.width
            sourceSize: Qt.size(width, height)
            source: "./images/qyvlik.png"
        }
        // don't use ListView in sideMenu
        // or dynamic set sideMenu z index!
        ListView {
            clip: true
            width: parent.width
            height: parent.height - image.height
            delegate: Rectangle {
                width: parent.width
                height: 100
                opacity: 0.8
                border.color: "black"
                border.width: 1
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        console.log(index)
                    }
                }
                Text {
                    text: index
                    anchors.centerIn: parent
                }
            }
            model: 10
            
        }
    }
}
