#!/bin/sh

#https://stackoverflow.com/questions/12306223/how-to-manually-create-icns-files-using-iconutil

rm -fr reset_qjackctl.iconset
mkdir reset_qjackctl.iconset

sips -z 16 16     -s formatOptions best ../reset_qjackctl_512x512.png --out ../icon/reset_qjackctl.iconset/icon_16x16.png
sips -z 32 32     -s formatOptions best ../reset_qjackctl_512x512.png --out ../icon/reset_qjackctl.iconset/icon_16x16@2x.png
sips -z 32 32     -s formatOptions best ../reset_qjackctl_512x512.png --out ../icon/reset_qjackctl.iconset/icon_32x32.png
sips -z 64 64     -s formatOptions best ../reset_qjackctl_512x512.png --out ../icon/reset_qjackctl.iconset/icon_32x32@2x.png
sips -z 128 128   -s formatOptions best ../reset_qjackctl_512x512.png --out ../icon/reset_qjackctl.iconset/icon_128x128.png
sips -z 256 256   -s formatOptions best ../reset_qjackctl_512x512.png --out ../icon/reset_qjackctl.iconset/icon_128x128@2x.png
sips -z 256 256   -s formatOptions best ../reset_qjackctl_512x512.png --out ../icon/reset_qjackctl.iconset/icon_256x256.png
sips -z 512 512   -s formatOptions best ../reset_qjackctl_512x512.png --out ../icon/reset_qjackctl.iconset/icon_256x256@2x.png
sips -z 512 512   -s formatOptions best ../reset_qjackctl_512x512.png --out ../icon/reset_qjackctl.iconset/icon_512x512.png

cp ../reset_qjackctl_512x512.png reset_qjackctl.iconset/icon_512x512@2x.png

iconutil -c icns reset_qjackctl.iconset

cp reset_qjackctl.icns reset_qjackctl.app_template/Contents/Resources


sips -z 248 248   -s formatOptions best ../reset_qjackctl_512x512.png --out ../icon/reset_qjackctl.iconset/icon_248x248.png

