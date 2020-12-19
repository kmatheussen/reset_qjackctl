
png2ico reset_qjackctl_256x256x32.ico ../icon/reset_qjackctl.iconset/icon_16x16.png ../icon/reset_qjackctl.iconset/icon_16x16@2x.png ../icon/reset_qjackctl.iconset/icon_32x32.png ../icon/reset_qjackctl.iconset/icon_32x32@2x.png ../icon/reset_qjackctl.iconset/icon_128x128.png ../icon/reset_qjackctl.iconset/icon_248x248.png
# ../icon/reset_qjackctl.iconset/icon_16x16.png ../icon/reset_qjackctl.iconset/icon_16x16@2x.png ../icon/reset_qjackctl.iconset/icon_32x32.png ../icon/reset_qjackctl.iconset/icon_32x32@2x.png ../icon/reset_qjackctl.iconset/icon_128x128.png 
#../reset_qjackctl_256x256.png


i686-w64-mingw32-windres -i resfile.rc -o windows_icon32.o

x86_64-w64-mingw32-windres -i resfile.rc -o windows_icon64.o

