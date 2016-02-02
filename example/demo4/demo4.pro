TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp

RESOURCES += qml.qrc \
        ../../sparrow_qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = ../../qml/Sparrow

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/res/values-v19/styles.xml \
    android/res/layout/main.xml \
    android/res/values/strings.xml \ 
    android/src/org/gdpurjyfs/sparrow/MainActivity.java \
    android/src/org/gdpurjyfs/sparrow/QtBridgingAndroid.java \
    android/src/org/gdpurjyfs/demo4/MyActivity.java

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

# include Sparrow
include(../../Sparrow/Sparrow.pri)

HEADERS +=
