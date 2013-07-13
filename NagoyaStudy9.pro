QT += qml quick

TARGET = NagoyaStudy9

INCLUDEPATH += \
	$$PWD/src
DEPENDPATH  += \
	$$PWD/src

SOURCES += \
	$$PWD/src/main.cpp

HEADERS += \

RESOURCES += \
	$$PWD/res.qrc

OTHER_FILES += \
	$$PWD/qml/main.qml \
	$$PWD/qml/Presen.qml \
	$$PWD/qml/content/background/BackgroundSwirls.qml \
	$$PWD/qml/content/background/Swirl.qml \
	$$PWD/qml/content/CodeSection.qml \
	$$PWD/qml/content/SliderFrame.qml

include(setting_build.pri)

