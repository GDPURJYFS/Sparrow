import QtQuick 2.0
import QtQuick.Window 2.0

Rectangle {
    id: sideBarArea
    color: "transparent"
    z: 10

    property Window window

    width: window.width
    height: window.height
    state: "hide"

    property Component sideBar: null

    states:[
        State {
            name: "show"
            PropertyChanges {
                target: sideBarArea
                x: 0
            }
        },
        State {
            name: "hide"
            PropertyChanges {
                target: sideBarArea
                x: -window.width
            }
        }
    ]
    transitions: Transition {
        NumberAnimation {
            target: sideBarArea
            properties: "x"
            duration: 250
            easing.type: Easing.Linear
        }
    }

    Loader {
        id: sideBarLoader
        width: parent.width / 2
        height: parent.height
        sourceComponent: sideBar
    }

    Rectangle {
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: Loader.Ready == sideBarLoader.status ? sideBarLoader.right : parent.right
        color: "#ccc"
        opacity: 0.3
        MouseArea {
            anchors.fill: parent
            onClicked: sideBarArea.state = "hide"
            onPositionChanged: sideBarArea.state = "hide"
        }
    }



}

