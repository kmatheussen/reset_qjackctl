
P=x86_64-w64-mingw32.static
#i686-w64-mingw32.static
PKG=$(P)\-pkg-config
CXX=$(P)-g++

all: ../bin_windows/reset_qjackctl.exe

clean:
	rm -f *.o reset_qjackctl.exe ../bin_windows/reset_qjackctl.exe

QW = -ldwmapi -lwinspool -lQt5EventDispatcherSupport -lQt5AccessibilitySupport -lQt5FontDatabaseSupport -lQt5ThemeSupport -lcomdlg32 -loleaut32 -limm32 -lopengl32 -luuid -ladvapi32 -lshell32 -luser32 -lkernel32 -lmpr -lpcre16 -lharfbuzz -lcairo -lgobject-2.0 -lfontconfig -lusp10 -lmsimg32 -lgdi32 -lpixman-1 -lffi -lexpat -lfreetype -lbz2 -lpng16 -lz -lharfbuzz_too -lglib-2.0 -lws2_32 -lole32 -lwinmm -lshlwapi -lpcre -lintl -liconv -lwtsapi32

../bin_windows/reset_qjackctl.exe: ../reset_qjackctl.cpp windows_icon64.o Makefile
	$(CXX) -g ../reset_qjackctl.cpp `$(PKG) --libs Qt5Core| awk '{split($$1,a,"-L"); print a[2]}'`/../plugins/platforms/libqwindows.a $(QW) `$(PKG) --cflags Qt5Gui --cflags Qt5Widgets --libs Qt5Gui --libs Qt5Widgets --libs Qt5Core --static` -lQt5WindowsUIAutomationSupport -DFOR_WINDOWS -std=gnu++11 -Wall windows_icon64.o -o reset_qjackctl.exe -mwindows #-mconsole # -mwindows 
	$(P)-strip reset_qjackctl.exe
	mkdir -p ../bin_windows
	cp reset_qjackctl.exe ../bin_windows/

windows_icon64.o: create_icon.sh resfile.rc ../icon/reset_qjackctl.iconset/icon_128x128.png
	./create_icon.sh
