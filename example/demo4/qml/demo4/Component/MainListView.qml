import QtQuick 2.4

ListView {
    id: mainView
    focus: true
    clip: true
    preferredHighlightBegin: 0
    preferredHighlightEnd: 0
    highlightMoveDuration: 250
    highlightRangeMode: ListView.StrictlyEnforceRange
    //highlightRangeMode: ListView.ApplyRange            // current Item allow stop 's pos
    snapMode: ListView.SnapOneItem
    orientation: ListView.Horizontal
    onCurrentIndexChanged: forceActiveFocus()

    readonly property alias rightSideBarIsOpen: mainView.__rightSideBarIsOpen
    readonly property alias leftSideBarIsOpen: mainView.__leftSideBarIsOpen
    property bool __rightSideBarIsOpen: false
    property bool __leftSideBarIsOpen: false

    onAtXBeginningChanged: {
        try {
            if(atXBeginning) {
                if( -contentX > headerItem.width) {
                    __leftSideBarIsOpen = true;
                }
            } else {
                __leftSideBarIsOpen = false;
            }
        } catch(e) {    }
    }

    onAtXEndChanged: {
        try {
            if(atXEnd) {
                if( contentX >/* headerItem.width +*/ mainView.width) {
                    __rightSideBarIsOpen = true;
                }
            } else {
                __rightSideBarIsOpen = false;
            }
        } catch (e) {  }
    }
}
