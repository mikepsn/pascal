OBJ = addpoly.o \
	  array.o \
	  getpoly.o \
	  indef2.o \
	  jeep.o \
	  jeep2.o \
	  mycos.o \
	  newton.o \
	  number.o \
	  nxtptr.o \
	  oildrop.o \
	  polyval.o \
	  power.o \
	  prime.o \
	  prodpoly.o \
	  sqrt.o 

EXE = addpoly \
	  array \
	  getpoly \
	  indef2 \
	  jeep \
	  jeep2 \
	  mycos \
	  newton \
	  number \
	  nxtptr \
	  oildrop \
	  polyval \
	  power \
	  prime \
	  prodpoly \
	  sqrt 

all:	$(EXE) 

stage5b:	stage5b.pas 
			fpc stage5b.pas

addpoly:	addpoly.pas
			fpc addpoly.pas

array:		array.pas
			fpc array.pas

getpoly:	getpoly.pas
			fpc getpoly.pas

indef2:		indef2.pas
			fpc -MTP indef2.pas

jeep:		jeep.pas
			fpc -MTP jeep.pas

jeep2:		jeep2.pas
			fpc -MTP jeep2.pas

mycos:		mycos.pas
			fpc mycos.pas

newton:		newton.pas
			fpc newton.pas

number:		number.pas
			fpc number.pas

nxtptr:		nxtptr.pas
			fpc nxtptr.pas

oildrop:	oildrop.pas
			fpc oildrop.pas

polyval:	polyval.pas
			fpc polyval.pas

power:		power.pas
			fpc power.pas
			
prime:		prime.pas
			fpc prime.pas

prodpoly:	prodpoly.pas
			fpc prodpoly.pas

sqrt:		sqrt.pas
			fpc sqrt.pas


clean: 
			/bin/rm -f $(OBJ) $(EXE) 
