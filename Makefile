# A simple makefile script for building pas2dox under linux

ifeq ($(shell uname),Linux)
CC=g++
LEX=flex
else
CC=c:\mingw\bin\g++
LEX=C:\PRO SPI\Tools\flex-2.5.4a-1-bin\bin\flex
endif
LEX_OPTIONS=-i -o

INSTALL_DIR=/usr/local/bin/

pas2dox : pas2dox.cpp
	${CC} $< -lstdc++ -o $@

pas2dox.cpp : pas2dox.l
	${LEX} ${LEX_OPTIONS}$@ $<

.PHONY : clean
clean :
	rm -f ./pas2dox.cpp ./pas2dox

.PHONY : install
install :
	cp ./pas2dox ${INSTALL_DIR}
