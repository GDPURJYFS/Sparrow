# 加载其他的业务页面

本例子需要注意的是，使用 `Page::__PushPage(url, properites)` 进行页面加载时，传入的 `url` 必须是绝对路径。使用 `Qt.resolvedUrl(url)` 进行处理即可。

## 跳转到其他页面

在 `main.qml`

```
mainView.__PushPage(Qt.resolvedUrl("./BusinessPage/FirstPage.qml"))
```

注意，压入页面的路径时候必须使用 `Qt.resolvedUrl` 进行处理。

## 返回上一级页面

在 `BusinessPage\FirstPage.qml` 中直接触发 `stackView.pop()` 即可返回上一页面。

> 注意，本项目文档转载请注明出处，作者是 qyvlik。
