import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

import Sparrow 1.0

import "./Component"

PageStackWindow {

    id: window

    width: 360
    height: 640



    initialPage: MainView {
        id: mainView
        pageStackWindow: window
    }



    Component.onCompleted: {

    }

}




