all: reset_qjackctl

clean:
	rm -fr *.o reset_qjackctl reset_qjackctl.app

reset_qjackctl: ../reset_qjackctl.cpp
	./build_macos.sh
	rm -fr ../bin_osx/*
	mkdir -p ../bin_osx/
	cp -a reset_qjackctl.app ../bin_osx/
