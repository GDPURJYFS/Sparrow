import QtQuick 2.5

Canvas {
    property int bubbleSize: 10
    property var bubblesPosition: [] // {x,y,firstX, firstY}
    // firstX , firstY 用来绘制固定点的

    onPaint: {
        var ctx = getContext("2d");
        ctx.lineWidth = 1;
        ctx.strokeStyle = "red";
        ctx.fillStyle = "red";
        ctx.clearRect(0,0,width, height)
        draw(ctx);
    }

    function draw(context) {
        if(bubblesPosition.length != 0) {
            for(var iter in bubblesPosition) {
                context.beginPath();

                context.arc(bubblesPosition[iter].firstX,
                            bubblesPosition[iter].firstY,
                            bubbleSize/2, 0, Math.PI * 2);
                context.text(iter, bubblesPosition[iter].x,
                             bubblesPosition[iter].y)
                context.fill();

                context.arc(bubblesPosition[iter].x,
                            bubblesPosition[iter].y,
                            bubbleSize, 0, Math.PI * 2);
                context.fill();

                context.text(iter, bubblesPosition[iter].x,
                             bubblesPosition[iter].y)



                drawGooeyDrag(context, bubblesPosition[iter] )
            }
        }
    }

    function drawGooeyDrag(context,bubble) {

        var bigCirclePoint = Qt.point(bubble.x, bubble.y);
        var smallCirclePoint = Qt.point(bubble.firstX, bubble.firstY);
        var bigRadius = bubbleSize;
        var smallRasius = bubbleSize / 2;

        // 两圆心距离
        var distance = centerDistance(bigCirclePoint, smallCirclePoint);

        // 圆心距越大，小圆半径越小
        var k = smallRasius * ((width - distance * 2) / width);

        k = k < 0 ? 0: k;

        // 绘制小圆
        //smallCircle.radius = k;

        // 获取小圆信息
        var x1 = smallCirclePoint.x;
        var y1 = smallCirclePoint.y;
        var r1 = k;

        // 绘制大圆
        //bigCircle.radius = bigRadius;
        // 获取大圆信息
        var x2 = bigCirclePoint.x;
        var y2 = bigCirclePoint.y;
        var r2 = bigRadius ;


        var sinA = (y2 - y1) / distance;
        var cosA = (x2 - x1) / distance;

        var pointA = Qt.point(x1 - sinA*r1, y1 + cosA * r1);
        var pointB = Qt.point(x1 + sinA*r1, y1 - cosA * r1);
        var pointC = Qt.point(x2 + sinA*r2, y2 - cosA * r2);
        var pointD = Qt.point(x2 - sinA*r2, y2 + cosA * r2);

        //  获取控制点，以便画出曲线
        var pointO = Qt.point(pointA.x + distance / 2 * cosA ,
                              pointA.y + distance / 2 * sinA);

        var pointP = Qt.point(pointB.x + distance / 2 * cosA ,
                              pointB.y + distance / 2 * sinA);


        context.lineWidth = 0;
        context.fillStyle = "red";

        // Adds a quadratic bezier curve between the current point and the endpoint (x, y)
        // with the control point specified by (cpx, cpy).
        // quadraticCurveT(real cpx, real cpy, real x, real y)
        // 第一二个是控制点，第三四个是终点。

        context.beginPath();
        context.moveTo(pointA.x, pointA.y);

        context.lineTo(pointB.x, pointB.y);
        context.quadraticCurveTo(pointP.x, pointP.y,
                             pointC.x , pointC.y);

        context.lineTo(pointD.x, pointD.y);

        context.quadraticCurveTo(pointO.x, pointO.y,
                             pointA.x , pointA.y);


        context.fill();


    }

    // 圆心距
    function centerDistance(point0, point1){
        return Math.abs(Math.sqrt(Math.pow(point0.x-point1.x, 2)
                                  +
                                  Math.pow(point0.y-point1.y, 2)));
    }


    Component.onCompleted: {
        bubbleSizeChanged.connect(requestPaint);
        bubblesPositionChanged.connect(requestPaint);
    }

}

