OBJ = stage3c.o stage3d.o

EXE = stage3c stage3d

all:	$(EXE) 

stage3c:    stage3c.pas 
			fpc stage3c.pas

stage3d:	stage3d.pas 
			fpc -g  stage3d.pas


clean: 
			/bin/rm -f $(OBJ) $(EXE) 
