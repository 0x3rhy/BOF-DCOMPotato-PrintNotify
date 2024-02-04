BOF := DCOMPotato
CC_x64 := x86_64-w64-mingw32-gcc
STRIP_x64 := x86_64-w64-mingw32-strip
CC_x86 := i686-w64-mingw32-gcc
STRIP_x86 := i686-w64-mingw32-strip

all:
	$(CC_x64) -s -w -o $(BOF).x64.o -c $(BOF).cpp -lcomdef
	$(STRIP_x64) --strip-unneeded $(BOF).x64.o
	$(CC_x86) -s -w -o $(BOF).x86.o -c $(BOF).cpp -lcomdef
	$(STRIP_x86) --strip-unneeded $(BOF).x86.o

clean:
ifeq ($(OS),Windows_NT)
	del /f /q $(BOF).*.o
else
	rm $(BOF).*.o
endif