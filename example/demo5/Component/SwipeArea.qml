import QtQuick 2.5

/**
 \note 使用 SwipeArea 控件，只能顺着父子关系向上传递 `clicked` 信号，不能传递 `pressed`
       以及 `realeased` 信号
*/

MouseArea {

    property real diff: 1
    property rect startArea: Qt.rect(0,0, width, height)


    signal rightToLeft(int offset)
    signal leftToRight(int offset)
    signal topToBottom(int offset)
    signal bottomToTop(int offset)

    //    Qt.Horizontal 垂直
    //    Qt.Vertical   水平
    property int orientation: Qt.Vertical

    propagateComposedEvents: true


    QtObject {
        id: internal
        property bool initOldPoint: false
        property point oldPoint: Qt.point(0, 0)
        property bool moving: false

        function checkHorizontal(newPoint) {
            var offset = internal.oldPoint.x - newPoint.x;
            if(offset < 0 && diff < Math.abs(offset)) {
                leftToRight(Math.abs(offset));
            } else if(offset > 0 && diff < Math.abs(offset)){
                rightToLeft(Math.abs(offset));
            } else {
                //internal.moving = false;
            }
        }

        function checkVertical(newPoint){
            var offset = internal.oldPoint.y - newPoint.y;
            if(offset < 0 && diff < Math.abs(offset)) {
                topToBottom(Math.abs(offset));
            } else if(offset > 0 && diff < Math.abs(offset)) {
                bottomToTop(Math.abs(offset));
            } else {
                //internal.moving = false;
            }
        }

        function rectContains(rect, point) {

            return rect.x <= point.x &&
                    point.x <= (rect.x + rect.width)  &&

                    rect.y <= point.y &&
                     point.y <= (rect.y + rect.height) ;
        }
    }

    onPositionChanged: {

        if(!pressed) return;

        internal.moving = true;

        var newPoint = Qt.point(mouse.x, mouse.y);
        var offset ;
        if(orientation == Qt.Vertical) {
            internal.checkHorizontal(newPoint);
        } else if(orientation == Qt.Horizontal){
            internal.checkVertical(newPoint);
        } else if(orientation == Qt.Horizontal | Qt.Vertical) {
            internal.checkVertical(newPoint);
            internal.checkHorizontal(newPoint);
        } else {
            console.log("orientation isn't valid: ", orientation);
            throw new Error("orientation isn't valid");
        }

        internal.oldPoint = newPoint;
    }

    onReleased: {
        internal.initOldPoint = false;
        // 当不处于 Swipe 动作的时候，传递鼠标事件 `clicked` 到父级。
        if(!internal.moving) {
            propagateComposedEvents = true;
        }
        mouse.accepted = false;
    }

    onPressed: {

        if(!internal.rectContains(startArea, Qt.point(mouse.x, mouse.y))) {
            mouse.accepted = false;
            return;
        }

        if(!internal.initOldPoint) {
            internal.oldPoint = Qt.point(mouse.x,
                                         mouse.y);
            internal.initOldPoint = true;
            mouse.accepted = true;
        }
        internal.moving = false;
        propagateComposedEvents = false;
    }

    function lockFlickableView(view) {
        try {
            view.interactive = false;
        }catch(e) {
            //console.log(e);
        }
    }

    function unLockFlickableView(view) {
        try {
            view.interactive = true;
        } catch(e) {
            //console.log(e);
        }
    }
}
