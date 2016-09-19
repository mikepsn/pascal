OBJ = stage3.o stage3c.o

EXE = stage3 stage3c

all:	$(EXE) 

stage3:		stage3.pas 
			fpc stage3.pas


stage3c:	stage3c.pas
			fpc stage3c.pas


clean: 
			/bin/rm -f $(OBJ) $(EXE) 
