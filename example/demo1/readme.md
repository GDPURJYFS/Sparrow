# 设置初始化页面

点击查看本示例的 `qml` 文件。代码分为五大部分。

## 第一部分

```

initialPage: Page {

```

这部分代码是指需要为 PageStackWindow 初始化一个栈底页面，主页面。

页面栈与栈的却别有很多，例如需要为页面栈初始化一个栈底页面，而栈不用初始化一个元素到栈。

所以位于栈底的元素无法 `pop`。

## 第二部分

```

pageStackWindow: mainWindow

```

将 `PageStackWindow` 对象设置给 `Page` 对象的 `pageStackWindow`。

## 第三部分

```
topBar: TopBar {
    ...
}
```

为这个页面设置顶部工具栏，有别于 `ToolBar` 或者 `StateBar`，这里直接使用位置来命名 `Bar` 对跨平台是有好处的。

## 第四部分

```
SampleButton {
    text: "Hello"
    ...
}
```

这一部分开始，为正式的页面内容。

## 第五部分

```
PopupLayer {
    ...
    parent: mainView
    ...
}
```

第五部分为弹窗层，不是弹窗。默认表现的模式为模态的。

注意设置的 `parent` 是谁，就会对他的 `parent` 呈现模态。

> 注意，本项目文档转载请注明出处，作者是 qyvlik。
