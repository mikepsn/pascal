program stage1 (input, output);

{
| Image Processing : Ping Pong Playing Robot
| Function : This program detects a ping pong ball in a digitized image
| Written by : Michael Papasimeon (User name: michp)
| Date : 23 May 1993
| Written for : Project C of Engineering Computing 121
| Level : Stage 1
| Tutor : Les Kitchen (User name : ljk)
}

uses wincrt;

const
	maxwidth = 64;                  { maximum width of image }
        maxheight = 64;                 { maximum height of image }
	maxpix = maxwidth*maxheight;	{ number of pixels in 64x64 image }
        threshold = 125;        	{ threshold level }

type
	pix = 0..255; 			{ pixel value range }
        image = record                  { record of image }
        	width : integer;
                height : integer;
                pixels : array[0..maxpix] of pix;
                end; { image }
var
	picture : image;        { the picture to be processed }
        pixelnum : integer; 	{ the number of pixels in an image }
        value : integer;	{ the greyscale value of each pixel }
        error1 : boolean;	{ error checking variable }
        error2 : boolean;	{ error checking variable }
        i  : integer;		{ counter variable }

procedure readimage;
{ reads the width, height and pixel values of the picture }
begin
        writeln('Enter the width of the picture.');
        readln(picture.width);
        writeln('Enter the height of the picture.');
        readln(picture.height);
        pixelnum := picture.width*picture.height;
        writeln('This image will have, ',pixelnum,' pixels');
	writeln;
        writeln('It is now time to enter the values of each pixel in the picture.');
        writeln('Enter each grayscale value from 0 to 255.');
        writeln;
        for i := 0 to (pixelnum-1) do begin
        	readln(value);
                if (value < 0) or (value > 255) then begin
                	error2 := true;
                end; {if}
        	picture.pixels[i] := value;
        end; {for}
end; { readimage }

procedure writeimage;
{ writes the values of the image in the matrix structure }
begin
	writeln;
	writeln('The grayscale values for this image are: ');
        for i := 0 to (pixelnum-1) do begin
        		write(' ',picture.pixels[i]:3);
                        i := i + 1;
                        if i mod picture.width = 0 then begin
                        	writeln;
                        end; {if}
                        i := i - 1;
        end;{for}
end; { writeimage }

procedure writethresh;
{ writes the character display for each pixel using the pixel value }
begin
	writeln;
        writeln('Character display of image with threshold at ',threshold,'.');
	for i := 0 to (pixelnum-1) do begin
        	if picture.pixels[i] < threshold then begin
                        write('-':3);
                end; {if}
                if picture.pixels[i] >= threshold then begin
                	write('#':3);
                end; {if}
                i := i + 1;
                if i mod picture.width = 0 then begin
                      	writeln;
                end; {if}
                i := i - 1;
	end; {for}
end; { writethresh }

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
{ writes an error message if a pixel value is out of range }
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

begin
	writeln('Welcome to the Image Processor.');
        writeln;
	readimage;
        checkdimensions;
        checkvalues;
        if (error1 = false) and (error2 = false) then begin
        	writeimage;
        	writethresh;
        end; {if}
end. { main }





