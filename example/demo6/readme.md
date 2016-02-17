# 仿制 QQ 主界面

![](ShotScreen/39.gif)

## SwipeArea

SwipeArea 的相关文档可以前往 [QQ 侧边栏效果](../demo5/readme.md) 查看

## 粘性控件

粘性控件前往本人的 github 项目 [GooeyEffects.qml](https://github.com/qyvlik/GooeyEffects.qml) 查看。

## 总结

总体来说，需要注意只有嵌套的 `MouseArea` 才可以传递鼠标事件（pressed，realeased，clicked）。

还要处理好 `Flickable` 及其子类的扶动手势和鼠标点击手势的处理。

并列的 `MouseArea` 需要另寻法子。
