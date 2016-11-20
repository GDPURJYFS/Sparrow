//~ BusinessPage/R.qml
pragma Singleton

import QtQuick 2.0

QtObject {
    readonly
    property url
    firstPage : Qt.resolvedUrl("./FirstPage.qml")

    readonly
    property url
    secondPage: Qt.resolvedUrl("./SecondPage.qml")

    readonly
    property url
    thridPage: Qt.resolvedUrl("./ThridPage.qml")
}
