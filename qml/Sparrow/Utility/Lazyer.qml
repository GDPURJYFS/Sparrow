//~ Lazyer

import QtQuick 2.0
import Sparrow 1.0

/*!
    \qmltype Lazyer
    \inqmlmodule Sparrow
    \since 1.0

    Example:
    \qml
    Lazyer {
        id: lazyer
        Component.onCompleted: {
            lazyer.lazyDo(1000, function(){
                console.log("1000ms")
                lazyer.lazyDo(1000, function(){
                    console.log("1000ms")
                });
            });
        }
    }
    \endqml
*/

QObject {
    id: lazyer

    Component {
        id: timerComponent
        Timer {
            property var callable
            onTriggered: {
                // Only Do Once
                destroy();
                callable();
            }
            function lazyDo(time, callback) {
                interval = time;
                callable = callback;
                start();
            }
        }
    }

    function lazyDo(time, callback) {
        timerComponent.createObject(lazyer).lazyDo(time, callback);
    }
}

