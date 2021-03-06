QT += quick charts
CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp \
    dashboard/dashbord0.cpp \
    dashboard/dashbord1.cpp \
    dashboard/dashbord2.cpp \
    dashboard/dashbord3.cpp \
    dashboard/dashbord4.cpp \
    progressbar/progressbar0.cpp \
    drawbase.cpp \
    dashboard/dashbord5.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    dashboard/dashbord0.h \
    util.h \
    dashboard/dashbord1.h \
    dashboard/dashbord2.h \
    dashboard/dashbord3.h \
    dashboard/dashbord4.h \
    progressbar/progressbar0.h \
    drawbase.h \
    dashboard/dashbord5.h
