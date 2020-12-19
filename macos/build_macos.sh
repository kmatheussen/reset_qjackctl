#!/bin/sh

unset PKG_CONFIG_PATH

set -e

P=x86_64-apple-darwin17

CC=$P-clang
CXX=$P-clang++
LINKER=$P-clang++

MACOSX_DEPLOYMENT_TARGET=10.12



export CFLAGS=
export CPPFLAGS=
export LDFLAGS=
export CPPFLAGS=
export CXXFLAGS=

unset QT_QPA_PLATFORM_PLUGIN_PATH
unset QT5DIR

MYCFLAGS="-mtune=generic -mfpmath=sse -msse2 -O3 -fvisibility=default -mmacosx-version-min=$MACOSX_DEPLOYMENT_TARGET `$P-pkg-config --cflags Qt5Gui --cflags Qt5Core --cflags Qt5Widgets` -DQT_NO_DEBUG -std=gnu++11"

MYCPPFLAGS="$MYCFLAGS"
MYLDFLAGS="`$P-pkg-config --libs Qt5Gui --libs Qt5Core --libs Qt5Widgets` -framework CoreAudio -framework CoreFoundation"


export OSXCROSS_NO_INCLUDE_PATH_WARNINGS=1

#build
rm -f reset_qjackctl
$CXX ../reset_qjackctl.cpp $MYCPPFLAGS $MYLDFLAGS -o reset_qjackctl
#$P-strip reset_qjackctl

$P-otool -L reset_qjackctl

rm -fr reset_qjackctl.app
cp -a reset_qjackctl.app_template reset_qjackctl.app
mkdir reset_qjackctl.app/Contents/lib
mkdir reset_qjackctl.app/Contents/MacOS

cp -f reset_qjackctl reset_qjackctl.app/Contents/MacOS/

./change_dylib_paths.sh reset_qjackctl.app/Contents/MacOS/reset_qjackctl

#change_dylib_paths.sh
#/opt/local/libexec/qt5/lib/QtPositioningQuick.framework/QtPositioningQuick

fix_qt_lib() {
    cp /opt/local/libexec/qt5/lib/$1.framework/$1 reset_qjackctl.app/Contents/lib/
    ./change_dylib_paths.sh reset_qjackctl.app/Contents/lib/$1
}

fix_qt_lib QtGui
fix_qt_lib QtCore
fix_qt_lib QtWidgets
#fix_qt_lib QtNetwork
#fix_qt_lib QtLocation
#fix_qt_lib QtPositioning
#fix_qt_lib QtQuick
#fix_qt_lib QtPositioningQuick
#fix_qt_lib QtQml
#fix_qt_lib QtXml
fix_qt_lib QtPrintSupport
fix_qt_lib QtDBus


fix_lib() {
    cp /opt/local/lib/$1.dylib reset_qjackctl.app/Contents/lib/
    ./change_dylib_paths.sh reset_qjackctl.app/Contents/lib/$1.dylib
}

fix_lib libz.1
fix_lib libpng16.16
fix_lib libharfbuzz.0
fix_lib libicui18n.58
fix_lib libicuuc.58
fix_lib libicui18n.58
fix_lib libicuuc.58
fix_lib libicudata.58
fix_lib libpcre2-16.0
fix_lib libgthread-2.0.0
fix_lib libglib-2.0.0
fix_lib libintl.8
#fix_lib libssl.1.0.0
#fix_lib libcrypto.1.0.0
fix_lib libpcre.1
fix_lib libfreetype.6
fix_lib libgraphite2.3
#fix_lib libbz2.1.0
fix_lib libdbus-1.3
#fix_lib lib
#fix_lib lib
#fix_lib lib
#fix_lib lib


mkdir reset_qjackctl.app/Contents/MacOS/platforms
cp /opt/local/libexec/qt5/plugins/platforms/libqcocoa.dylib reset_qjackctl.app/Contents/MacOS/platforms/

./change_dylib_paths.sh reset_qjackctl.app/Contents/MacOS/platforms/libqcocoa.dylib

