# 使用资源对象进行页面管理

此次向 `BusinessPage` 路径下添加了两个关键文件。

一个 `qmldir`，一个 `R.qml`。

这个 `R.qml` 的思路是参展安卓的资源对象来设计的。是一个 `qml` 单例。

```
pragma Singleton
import QtQuick  2.0

QtObject{
    readonly property var resouce_id: "..."
}
```

在 `R.qml` 中设定只读属性来储存页面的路径。（PS： 也可以存储图片的路径，或者一些常量）。

在 `main.qml` 中引入模块 `BusinessPage`，然后通过引用 `BusinessPage` 的 `R` 单例对象的属性。

这样做的好处是，可以为以后的热修复提供必要的帮助。

> 注意，本项目文档转载请注明出处，作者是 qyvlik。
