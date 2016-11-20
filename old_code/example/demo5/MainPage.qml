import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

import Sparrow 1.0

import "./Component"

Page {
    id: page
    clip: false



    readonly property alias sideMenu: sideMenu
    property alias backgroundSource: image.source

    background:Image {
        id: image
        anchors.fill: parent
        source: "./images/sidemenu.jpg"
    }

    SideMenu {
        id: sideMenu
    }
}

