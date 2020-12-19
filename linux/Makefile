
CXX=g++

all: reset_qjackctl

clean:
	rm -f *.o reset_qjackctl

reset_qjackctl: ../reset_qjackctl.cpp
	$(CXX) -g ../reset_qjackctl.cpp `pkg-config --cflags Qt5Gui --cflags Qt5Widgets --libs Qt5Gui --libs ` -DFOR_LINUX -std=gnu++11 -Wall -o reset_qjackctl

