QT       -= core gui

SOURCES += \ 
    src/json_streamableobject.cpp \
    src/jasyncrpc_method.cpp \
    src/jasyncrpc_request.cpp \
    src/jasyncrpc_authentication.cpp \
    src/jasyncrpc_handshake.cpp
HEADERS += \ 
    src/json_streamableobject.h \
    src/jasyncrpc_method.h \
    src/jasyncrpc_request.h \
    src/jasyncrpc_authentication.h \
    src/jasyncrpc_handshake.h \
    src/jasyncrpc_retcodes.h
isEmpty(PREFIX) {
    PREFIX = /usr/local
}

# includes dir
QMAKE_INCDIR += $$PREFIX/include
QMAKE_INCDIR += src
INCLUDEPATH += $$PREFIX/include
INCLUDEPATH += src

# C++ standard.
include(../../cflags.pri)

TARGET = cx_jasyncrpc_common
TEMPLATE = lib

# INSTALLATION:
target.path = $$PREFIX/lib
header_files.files = $$HEADERS
header_files.path = $$PREFIX/include/$$TARGET
INSTALLS += target
INSTALLS += header_files
# PKGCONFIG
CONFIG += create_pc create_prl no_install_prl
QMAKE_PKGCONFIG_LIBDIR = $$PREFIX/lib/
QMAKE_PKGCONFIG_INCDIR = $$PREFIX/include/$$TARGET
QMAKE_PKGCONFIG_CFLAGS = -I$$PREFIX/include/
QMAKE_PKGCONFIG_DESTDIR = pkgconfig

include(../../version.pri)
