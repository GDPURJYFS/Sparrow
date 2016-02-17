# QQ 侧边栏效果

![](ShotScreen/38.gif)

## MouseArea 鼠标事件的传递

通过设置 `MouseArea::propagateComposedEvents` 为 `true`，可以将鼠标事件向上传递给父级。

## 信号触发顺序

```
MouseArea::pressed -->
MouseArea::realeased -->
MouseArea::clicked -->
...
```

## SwipeArea

继承自 `MouseArea`

```
    property real diff: 1
    property rect startArea: Qt.rect(0,0, width, height)

    signal rightToLeft(int offset)
    signal leftToRight(int offset)
    signal topToBottom(int offset)
    signal bottomToTop(int offset)

    //    Qt.Horizontal 垂直
    //    Qt.Vertical   水平
    property int orientation: Qt.Vertical

    function lockFlickableView(view) {
        view.interactive = false
    }

    function unLockFlickableView(view) {
        view.interactive = true;
    }
```

`diff` ：在鼠标按住且移动时，两点之间的距离差大于 `diff` 就可能触发 `rightToLeft` 等信号。

`startArea` 是手势开始的区域。通过指定 `startArea` 可以有效处理鼠标事件传递（pressed,realeased,clicked）的问题。

`rightToLeft` 等信号的参数 `offset`，意思是滑动的方向和本次滑动的距离 `offset`。

`orientation` 为 `SwipeArea` 关注的方向，`Qt.Horizontal` 为垂直方向，`Qt.Vertical` 为水平方向，`Qt.Horizontal | Qt.Vertical` 为四个方向都关注。

在响应 `rightToLeft` 等信号时，可以使用 `lockFlickableView` 来锁定指定的 `Flickable`，在 `realeased` 时，使用 `unLockFlickableView` 解锁。
