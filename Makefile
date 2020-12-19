
all: target_osx target_linux target_windows

clean:
	rm -fr bin_osx/* bin_linux/* bin_windows/* *~ */*~ */*/*~ */*/*/*~
	$(MAKE) -C windows clean
	$(MAKE) -C linux clean
	$(MAKE) -C macos clean

target_osx:
	rm -f bin_osx/reset_qjackctl.app/Contents/MacOS/*~ 
	$(MAKE) -C macos


target_linux:
	rm -f bin_linux/*~
	$(MAKE) -C linux
	mkdir -p bin_linux
	cp linux/reset_qjackctl bin_linux/


target_windows:
	rm -f bin_windows/*~
	$(MAKE) -C windows
