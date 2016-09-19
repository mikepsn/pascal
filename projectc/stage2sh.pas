program stage2 (input, output);

{
| Image Processing : Ping Pong Playing Robot
| Function : This program detects a ping pong ball in a digitized image.
| The program reads in an image file consisting of integer grescale
| values from 0 to 255, and from this image produced a mean filtered
| or average image which is then in turn thresholded at an inputed value.
| The result is an image which distinguishes light areas from dark areas
| so that the ping pong ball in the image can be recognised by the robot.
| Written by : Michael Papasimeon (User name: mikepsn) 
| Date : 23 May 1993
| Written for : Project C of Engineering Computing 121
| Level : Stage 2
}

uses wincrt;

const
	maxwidth = 64;				{ maximum width (columns) of image }
        maxheight = 64;				{ maximum height (rows) of image }
        
type
	pix = 0..255; 				{ pixel value range }
        widthrange = 1..maxwidth;		{ range of the image width }
        heightrange = 1..maxheight;		{ range of the image height }
	image = record                  	{ record of image }
        	width : integer;		{ image width (no. of columns) }
                height : integer;		{ image height (no. of rows) }
                pixels : array[widthrange,heightrange] of pix;
                end; { image }

var
	threshold : integer;			{ threshold value }
	picture : image;			{ original image record }
        mean : image;				{ mean filtered image }
        binary : image;				{ binary thresholded image }
        imagefile : text;			{ file read from current directory }
        meanfile : text;			{ mean text file written to }
        value : integer;			{ individual greyscale values }
        row, column : integer;			{ row & column coordinates }
        error1 : boolean;			{ error checking variable }
        error2 : boolean;			{ error checking variable }

procedure checkdimensions;
{ checks that the dimensions of the picture are within the range }
begin
	if (picture.width > maxwidth) or (picture.height > maxheight) then begin
        	error1 := true;
                writeln;
        	writeln('The values for the size of the image are out of range.');
                writeln('For the image the maximum values are: ');
                writeln('Width: 64 ');
                writeln('Height: 64 ');
                writeln;
                writeln('Restart the program using values that are within range.');
        end; {if}
end; { checkdimensions }

procedure checkvalues;
{ writes an error message if a pixel value is out of the range 0 to 255 }
begin
	if error2 = true then begin
        	writeln;
                writeln('One or more of the pixel values are out of range.');
                writeln('The grayscale brightness pixel values should');
                writeln('be in the range of 0 to 255.');
                writeln;
                writeln('Restart the program making sure the pixel');
                writeln('values are in the range.');
        end; {if}
end; { checkvalues }

procedure readimage;
{ reads the file pingpong from current directory into picture record }
begin
        assign(imagefile,'pingpong.txt');
        reset(imagefile);
        picture.height := 1; {initialise for while loop }
        while {not eof(imagefile)} row < picture.height  do begin
		writeln('Enter the width and height of the image.');
        	read(imagefile, picture.width);
        	read(imagefile, picture.height);
        	writeln('The width is : ', picture.width);
        	writeln('The height is : ', picture.height);
        	checkdimensions;
        	if error1 = false then begin
        		writeln('Enter the grayscale values');
       		for row := 1 to picture.height do begin
        		for column := 1 to picture.width do begin
        			read(imagefile, value);
                			if (value < 0) or (value > 255) then begin
                				error2 := true;
                			end; {if}
                		picture.pixels[column,row] := value;
                	end; {for}
        	end; {for}
        	end; {if}
        end; {while}
end; {readimage}

procedure writeimage;
{ writes the image that was read from the file onto the screen }
begin
	writeln;
	writeln('The greyscale values of the image read from the file are: ');
	writeln;
        for row := 1 to picture.height do begin
        	for column := 1 to picture.width do begin
                	write(' ',picture.pixels[column,row]:3);
                end; {for}
                writeln;
        end; {for}
        writeln;
end; {writeimage}

procedure makemean;
{
 finds and calculates the average of each 3x3 matrix neighbourhood for
 each pixel in the picture image and uses this to create a new mean filtered image
}
begin
        mean.width := picture.width;
        mean.height := picture.height;
        for row := 1 to picture.height do begin
        	for column := 1 to picture.width do begin
                	if (row = picture.height) and (column = picture.width) then begin
            			mean.pixels[column,row] :=
                                	round((
                                	4*picture.pixels[column,row] +
                                        2*picture.pixels[column,row-1] +
                                        2*picture.pixels[column-1,row] +
                                        picture.pixels[column-1,row-1]
                                        )/9) ;
			end {if}
                        else if (row = 1) and (column = picture.width) then begin
                        	mean.pixels[column,row] :=
                                	round((
                                        4*picture.pixels[column,row] +
                                        2*picture.pixels[column-1,row] +
                                        2*picture.pixels[column,row+1] +
                                        picture.pixels[column-1,row+1]
                                        )/9) ;
                        end {if}
                        else if (row = picture.height) and (column = 1) then begin
                        	mean.pixels[column,row] :=
                                	round((
                                        4*picture.pixels[column,row] +
                                        2*picture.pixels[column,row-1] +
                                        2*picture.pixels[column+1,row] +
                                        picture.pixels[column+1,row-1]
                                        )/9) ;
                        end {if}
                        else if (row = 1) and (column = 1) then begin
                        	mean.pixels[column,row] :=
                                	round((
                                        4*picture.pixels[column,row] +
                                        2*picture.pixels[column,row+1] +
                                        2*picture.pixels[column+1,row] +
                                        picture.pixels[column+1,row+1]
                                        )/9) ;
                        end {if}
                        else if (column = picture.width) and (row<>1) and (row<>picture.height) then begin
                        	mean.pixels[column,row] :=
                                	round((
                                        picture.pixels[column-1,row-1] +
                                        picture.pixels[column-1,row] +
                                        picture.pixels[column-1,row+1] +
                                        2*picture.pixels[column,row-1] +
                                        2*picture.pixels[column,row] +
                                        2*picture.pixels[column,row+1]
                                        )/9) ;
                        end {if}
                        else if (column = 1) and (row<>1) and (row<>picture.height) then begin
                        	mean.pixels[column,row] :=
                                	round((
                                        2*picture.pixels[column,row-1] +
                                        2*picture.pixels[column, row] +
                                        2*picture.pixels[column,row+1] +
                                        picture.pixels[column+1,row-1] +
                                        picture.pixels[column+1,row] +
                                        picture.pixels[column+1,row+1]
                                        )/9) ;
                        end {if}
                        else if (row = picture.height) and (column<>1) and (column<>picture.width) then begin
                        	mean.pixels[column,row] :=
                                	round((
                                        picture.pixels[column-1,row-1] +
                                        picture.pixels[column,row-1] +
                                        picture.pixels[column+1,row-1] +
                                        2*picture.pixels[column-1,row] +
                                        2*picture.pixels[column,row] +
                                        2*picture.pixels[column+1,row]
                                        )/9) ;
                        end {for}
                        else if (row = 1) and (column<>1) and (column<>picture.width) then begin
                        	mean.pixels[column,row] :=
                                	round((
                                        2*picture.pixels[column-1,row] +
                                        2*picture.pixels[column,row] +
                                        2*picture.pixels[column+1,row] +
                                        picture.pixels[column-1,row+1] +
                                        picture.pixels[column,row+1] +
                                        picture.pixels[column+1,row+1]
                                        )/9) ;
                        end {for}
                        else {if ((row<picture.height) and (row>1))
                        and ((column<picture.width) and (column>1)) then begin}
                        	mean.pixels[column,row] :=
                                round((
                                picture.pixels[column-1,row-1] +
				picture.pixels[column-1,row] +
                                picture.pixels[column-1,row+1] +
                                picture.pixels[column,row-1] +
                                picture.pixels[column,row] +
                                picture.pixels[column,row+1] +
                                picture.pixels[column+1,row-1] +
                                picture.pixels[column+1,row] +
                                picture.pixels[column+1,row+1]
                                )/9) ;
                end; {for}
        end; {for}
end; { makemean }

procedure writemean;
{ writes the mean filtered image to the screen }
begin
	writeln('The greyscale values of the mean filtered image are: ');
	writeln;
        writeln(mean.width,' ',mean.height);
        for row := 1 to mean.height do begin
        	for column := 1 to mean.width do begin
                	write(' ',mean.pixels[column,row]:3);
                end; {for}
                writeln;
        end; {for}
        writeln;
end; {writemean}

procedure writemeanfile;
{ writes the mean filtered image to a text file called mean }
begin
	assign(meanfile,'mean.txt');
	rewrite(meanfile);
        write(meanfile, mean.width:2);
        write(meanfile,mean.height:2);
        writeln(meanfile);
        for row := 1 to mean.height do begin
        	for column := 1 to mean.width do begin
                	write(meanfile, mean.pixels[column,row]:4);
                end; {for}
                writeln(meanfile);
        end; {for}
        close(meanfile);
end; {writemeanfile}

procedure makemeanbinary;
{ makes a binary (0 and 1) map of the mean filtered image using the threshold value }
begin
        binary.width := mean.width;
        binary.height := mean.height;
	for row := 1 to mean.height do begin
     		for column := 1 to mean.width do begin
        		if mean.pixels[column,row] >= threshold then
                		binary.pixels[column,row] := 1
                	else if mean.pixels[column,row] < threshold then
                		binary.pixels[column,row] := 0;
        	end; {for}
	end; {for}
end; {makebinary}

procedure writethresh;
{
 writes to the screen a thresholded image of the mean filtered image
 using the data from the binary file
}
begin
	writeln('For a threshold value of ',threshold, ' the mean filtered');
        writeln('image looks like this:');
        writeln;
        for row := 1 to binary.height do begin
        	for column := 1 to binary.width do begin
                	if binary.pixels[column,row] = 1 then
                        	write(' #')
                        else if binary.pixels[column,row] = 0 then
                        	write(' -')
                end; {for}
                writeln;
        end; {for}
        writeln;
end; {writethresh}

begin
	writeln('*************************************************');
	writeln('Welcome to the Ping Pong Image Processor Program.');
        writeln('*************************************************');
        writeln;
        write('Please, enter the threshold value for the image: ');
        readln(threshold);
	readimage;
        checkvalues;
        if (error1 = false) and (error2 = false) then begin
                writeimage;
                makemean;
                writemean;
                writemeanfile;
        	makemeanbinary;
        	writethresh;
        end; {if}
end. {main}
