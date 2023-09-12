CC=gcc
LD=lld
PREFIX=/usr/local
CFLAGS=-Wall -g -O2 `sdl-config --libs --cflags`
LIBS=-lSDL_gfx -lSDL_image -lSDL_mixer -lSDL_ttf -lm -lstdc++
SyobonAction:main.o loadg.o DxLib.o
	${CC} main.o loadg.o DxLib.o -o SyobonAction ${LIBS} ${CFLAGS}
main.o:main.cpp
	${CC} -c main.cpp ${CFLAGS}
loadg.o:loadg.cpp
	${CC} -c loadg.cpp ${CFLAGS}
DxLib.o:DxLib.cpp
	${CC} -c DxLib.cpp ${CFLAGS}


clean:
	rm -f *.o SyobonAction


install:
	mkdir -p ${PREFIX}/share/SyobonAction
	cp -r ./BGM ${PREFIX}/share/SyobonAction
	cp -r ./res ${PREFIX}/share/SyobonAction
	cp -r ./SE ${PREFIX}/share/SyobonAction
	install -m 755 SyobonAction ${PREFIX}/share/SyobonAction
	ln -s ${PREFIX}/share/SyobonAction/SyobonAction ${PREFIX}/bin/SyobonAction