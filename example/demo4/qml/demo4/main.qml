import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4

import Sparrow 1.0

import "./Component"

PageStackWindow {
    id: mainWindow
    title: qsTr("Translucent System Bar")

    initialPage: MainView {

    }
}




