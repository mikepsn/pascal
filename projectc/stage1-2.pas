program stage1 (input, output);

uses wincrt;

const
	maxwidth = 64;
        maxheight = 64;
        threshold = 125;

type
	pix = 0..255; 			{ pixel value range }
        widthrange = 1..maxwidth;
        heightrange = 1..maxheight;
	image = record                  { record of image }
        	width : integer;
                height : integer;
                pixels : array[widthrange,heightrange] of pix;
                end; { image }

var
	picture : image;
        value : integer;
        row, column : integer;
        error1 : boolean;
        error2 : boolean;

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

procedure readimage;
begin
	writeln('Welcome. Enter the width and height of the pict.');
        read(picture.width, picture.height);
        writeln;
        writeln('The width is : ', picture.width);
        writeln('The height is : ', picture.height);
        writeln;
        writeln('Enter the grayscale values of each pixel from 0 to 255');
        for row := 1 to picture.height do begin
        	for column := 1 to picture.width do begin
        	readln(value);
                if (value < 0) or (value > 255) then begin
                	error2 := true;
                end; {if}
                picture.pixels[column,row] := value;
                end; {for}
        end;
end; {readimage}

procedure writeimage;
begin
        for row := 1 to picture.height do begin
        	for column := 1 to picture.width do begin
                write(' ',picture.pixels[column,row]:3);
                end; {for}
                writeln;
        end;
end; {writeimage}

procedure writethresh;
begin
	writeln('For a threshold value of ',threshold, ' the image looks like this:');
        for row := 1 to picture.height do begin
        	for column := 1 to picture.width do begin
                	if picture.pixels[column,row] >= threshold then
                        	write(' #');
                        if picture.pixels[column,row] < threshold then
                        	write(' -')
                end; {for}
                writeln;
        end;
end; {writethresh}



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
end. {main}
