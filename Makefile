CC=gcc
LD=lld
SyobonAction:main.o loadg.o DxLib.o
	${CC} main.o loadg.o DxLib.o -o SyobonAction `sdl-config --libs` -lSDL_gfx -lSDL_image -lSDL_mixer -lSDL_ttf -lm -lstdc++ -I/usr/include/SDL
main.o:main.cpp
	${CC} -c main.cpp
loadg.o:loadg.cpp
	${CC} -c loadg.cpp
DxLib.o:DxLib.cpp
	${CC} -c DxLib.cpp


clean:
	rm -f *.o SyobonAction