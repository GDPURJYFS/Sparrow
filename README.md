# Sparrow

> 注意，本项目文档转载请注明出处，作者是 qyvlik。

`Sparrow` 是 `QtQuick` 开发安卓等手机应用的轻量级框架，包括一个纯 `qml` 模块和一个 `c++` 拓展模块。

## 目录介绍

### qml 模块

打开 `qml/Sparrow` 

```
| qmldir
| + +android
| | UI.js
| PageStackWindow.qml
| TopBar.qml
| Bottom.qml
| Page.qml
| ApplicationSettings.qml
| SampleLabel.qml
| QObject.qml
| UI.js
| ...
```

`UI.js` 以及带有 `+` 的文件夹是进行平台适配的常量。

其他控件介绍查看[简单易用的页面栈框架](doc/readme.md)

### c++ 模块

打开 `Sparrow`

```
| Sparrow.pri
| ... *.h
| ... *.cpp
```

有若干头文件和源文件。是 Sparrow 模块的 c++ 部分，这部分可以不用编译。只是用于增强。

打开 `android`

直接到 `src/org/GDPURJYFS/Sparrow/QtNativeForAndroid.java`。这个是 Sparrow `c++` 模块中安卓平台的代码。在安卓项目中，将  `src/org/GDPURJYFS/Sparrow/QtNativeForAndroid.java` 直接复制到适合的位置。

> Qt on Android 项目中一般可以由 QtCreator 生成一个 `andorid` 目录，直接将 `src/org/GDPURJYFS/Sparrow/QtNativeForAndroid.java` 复制到 `android` 中对应的路径下。

## 如何使用

### QtQuick UI 项目

新建一个 `qmlproject` 项目。修改 `qmlproject` 文件如下：

```qml
/* File generated by Qt Creator */

import QmlProject 1.1

Project {
    mainFile: "main.qml"

    /* Include .qml, .js, and image files from current directory and subdirectories */
    QmlFiles {
        directory: "."
    }
    JavaScriptFiles {
        directory: "."
    }
    ImageFiles {
        directory: "."
    }

    Files {
        directory: "."
        filter: "*qmldir*"
    }

    /* List of plugin directories passed to QML runtime */
    importPaths: [ "." ]
}
```

将本项目中的 `qml` 目录下的 `Sparrow` 文件夹整个复制到项目的根目录下。

### QtQuick Application 项目

将 `qml`  目录下的 `Sparrow` 复制到项目中适当位置。

将 `Sparrow` 复制到项目的根目录下。

> `Sparrow` 的 `qml` 模块可以用于其他项目中，与 `Sparrow` 的 `c++` 模块相互独立。

---

在项目的 `pro` 文件中添加这么一句：

```pro
include(Sparrow/Sparrow.pri)
```

> `Sparrow` 的 `c++` 模块可以用于其他项目中，与 `Sparrow` 的 `qml` 模块相互独立。

在 `main.cpp` 中，使用 `QQmlEngine` 或者 `QQmlApplicationEngine` 的 `addImportPath(const QString& dir)` 函数导入模块路径。

也可以参照 `qml/Sparrow/qmldir` 中的命令手写注册函数。

参考 [`StandardQtOnAndroid`](https://github.com/GDPURJYFS/StandardQtOnAndroid/)。

# TODO

现阶段的 Sparrow 的 QML 模块处于 1.0 阶段。

在 1.1 阶段

1. 支持沉浸式（安卓 5.0 及以上支持，IOS 默认支持）

    需要对 `Page` 以及 `PageStackWindow` 控件重新设计。

2. 支持沉浸式和全屏的切换.

3. 提供良好的输入框。

    由于 Qt 在安卓上的输入框有些许问题，直到 Qt 官方解决 Qt 应用窗体大小调整时闪烁的问题。预计版本或许是 Qt 5.7 解决吧，毕竟 Qt 5.7 是在 2016 年 Q2 放出。

4. 提供一个简易的 Qt3D 支持控件，`Room3D` 和 `Page3D`。

    其中，`Room3D` 包含一个最简单的场景和摄像头，必要的灯光。 `Page3D` 提供普通的 QML 元素和 `Qt3D::Entity` 的交互，例如动画。等至 Qt 5.7 正式放出 `Qt3D` 的时候，就可以有更多的支持了。

4. 将提供良好的 C++ 扩展模块，例如 `I/O` 设备，更强大的网络套件(Sparrow.Network)。

    由于 QML 中的 `XMLHttpRequest` 不能很好的处理 `Cookie`，好吧，其实是根本不能处理，既不能接受来自服务器的 `Cookie` 也不能设置 `Cookie`。所以将 Qt 的网络模块通过封装后，在 QML 中使用，Qt C++ 的网络模块本身是异步的，就不用担心阻塞 GUI 线程了。

    另一个是将 `QIODevice` 及其子类进行封装，注册到 QML 中，这一个模块对 QML 的 GUI 线程是阻塞的，所以提供的功能会注意裁剪，毕竟这个模块是 `Sparrow.Network` 的附属模块。

5. 提供更加良好的多线程及并发模块。

     这一块要研究好久，就放到 Sparrow 2.0 模块吧。
     
---

> 注意，本项目文档转载请注明出处，作者是 qyvlik。