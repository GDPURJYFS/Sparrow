import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.3

ApplicationWindow {
    id: pageStackWindow
    width: 360
    height: 640
    visible: true
    color: "#ebebeb"

    style: ApplicationWindowStyle {
        background: Rectangle {
            width: pageStackWindow.width
            height: pageStackWindow.height
            color: pageStackWindow.color
        }
    }

    property alias stackView: __stackView
    property alias initialPage: __stackView.initialItem
    property alias focus: __stackView.focus
    readonly property alias currentItem: __stackView.currentItem
    readonly property alias depth: __stackView.depth
    readonly property alias busy: __stackView.busy

    StackView {
        id: __stackView
        anchors.fill: parent
        focus: visible
    }

    onInitialPageChanged: {
        if(initialPage.stackView === null) {
            initialPage.stackView = pageStackWindow.stackView
        }
    }

    function clear() { __stackView.clear(); }
    function push(item) { return  __stackView.push(item); }
    function pop(item) { return  __stackView.pop(item); }
}

