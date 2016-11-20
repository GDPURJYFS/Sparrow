import QtQuick 2.0

import Sparrow 1.0

ListView {
    id: view
    anchors.fill: parent
    property int itemHeight: parent.width * 0.3
    property int itemWidth: parent.width
    delegate: Rectangle {
        id: item
        width: view.itemWidth
        height: view.itemHeight
        border.color: "black"
        border.width: 1

        Image {
            anchors.verticalCenter:  parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: item.height * 0.1
            source: "./images/qyvlik.png"
            width: item.height * 0.8
            height: item.height * 0.8
        }

        Rectangle {
            width: parent.width * 0.2
            height: parent.width * 0.2
            radius: parent.width * 0.1
            anchors.centerIn: parent
            color: "blue"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("clicke a list item")
                }
            }
        }
    }

    model: 10

    property real lastContextY: 0

    onContentYChanged: {

        var offset = lastContextY - contentY;
        lastContextY = contentY;

        for(var iter in foo.bubblesPosition) {
            foo.bubblesPosition[iter].y += offset;
            foo.bubblesPosition[iter].firstY += offset;
        }
        foo.bubblesPositionChanged();
    }

    MouseArea {
        anchors.fill: parent
        propagateComposedEvents: true
        property var bubble
        onPressed: {
            bubble = foo.getBubbleAlias(mouse.x, mouse.y);
            if(bubble != null) {
                bubble.firstX = bubble.x;
                bubble.firstY = bubble.y;
            }
        }
        onReleased: {
            view.interactive = true;
            if(bubble != null) {

                bubble.x = bubble.firstX;
                bubble.y = bubble.firstY;

                foo.requestPaint();
            }
        }

        onPositionChanged: {
            if(!pressed ) return;

            if(bubble != null) {
                bubble.x = mouse.x;
                bubble.y = mouse.y;
                view.interactive = false
                foo.bubblesPositionChanged();
            }
        }
    }

    ChatListViewMessageBubbleCanvas {
        id: foo
        anchors.fill: parent

        Component.onCompleted: {
            var index = 0
            while(index < 10) {
                bubblesPosition.push({
                                         x: view.itemWidth-20,
                                         y: (index)*view.itemHeight +
                                            view.itemHeight*0.5,
                                         firstX: view.itemWidth-20,
                                         firstY: (index)*view.itemHeight +
                                                 view.itemHeight*0.5
                                     })
                index++;
            }
        }

        function rectContains(rect, point) {
            return rect.x <= point.x &&
                    point.x <= (rect.x + rect.width)  &&

                    rect.y <= point.y &&
                    point.y <= (rect.y + rect.height) ;
        }

        function getBubbleAlias(x, y) {
            var rect;
            var point
            for(var iter in bubblesPosition) {
                rect = Qt.rect(bubblesPosition[iter].x-bubbleSize,
                               bubblesPosition[iter].y-bubbleSize,
                               bubbleSize*2,
                               bubbleSize*2);
                point = Qt.point(x,y);
                if(rectContains(rect, point)) {
                    return bubblesPosition[iter];
                }
            }
            return null;
        }
    }
}

