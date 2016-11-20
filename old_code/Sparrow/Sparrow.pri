QT += core network sql qml

android {
    QT += androidextras
}

HEADERS += \
    #$$PWD/qmlnetworkaccessmanagerfactory.h \
    #$$PWD/notificationclient.h \
    $$PWD/keyboard.h \
    $$PWD/sparrow_global.h \
    #$$PWD/qtnativeforandroid.h \
    $$PWD/qtbridgingandroid.h

SOURCES += \
    #$$PWD/qmlnetworkaccessmanagerfactory.cpp \
    #$$PWD/notificationclient.cpp \
    $$PWD/keyboard.cpp \
    #$$PWD/qtnativeforandroid.cpp \
    $$PWD/qtbridgingandroid.cpp

INCLUDEPATH = $$PWD/../

win32 {
    RESOURCES += $$PWD/../sparrow_assets.qrc
}
