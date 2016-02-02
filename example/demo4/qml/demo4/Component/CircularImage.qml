//! [QtQuick之Canvas图像圆角遮罩]
//! (http://blog.csdn.net/esonpo/article/details/37762239)

import QtQuick 2.0

Canvas {
    id: circularImage

    property url imageSource
    property color borderColor: "black"

    onPaint: {
        var ctx = getContext("2d")
        ctx.lineWidth = 4
        // store current context setup
        ctx.save()
        ctx.strokeStyle = borderColor;
        ctx.beginPath()
        ctx.arc(circularImage.width/2,
                circularImage.height/2,
                circularImage.width/2,
                0,
                Math.PI * 2, true);
        ctx.closePath()
        ctx.clip()  // create clip from triangle path
        // drawImage(variant image, real dx, real dy, real dw, real dh)
        ctx.drawImage(imageSource, 0, 0,
                      circularImage.width,
                      circularImage.height)
        ctx.closePath()
        ctx.stroke()
        ctx.restore()
    }

    onRotationChanged: {
        circularImage.requestPaint()
    }

    onImageSourceChanged: {
        loadImage(imageSource)
    }

    onCanvasWindowChanged: {
        circularImage.requestPaint()
    }

    onWidthChanged: {
        circularImage.requestPaint()
    }

    onHeightChanged: {
        circularImage.requestPaint()
    }

    Component.onCompleted: {
        loadImage(imageSource)
    }
}

