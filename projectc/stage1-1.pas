program stage1 (input, output);

{ uses wincrt; } 

const
	maxwidth = 64;				{ maximum width (columns) of image }
        maxheight = 64;				{ maximum height (rows) of image }
        threshold = 125;			{ threshold value }

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
	picture : image;			{ original image record }
        binary : image;				{ binary thresholded image }
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
	writeln;
	writeln('Enter the width and height of the image.');
        read(picture.width, picture.height);
        writeln;
        writeln('The width is : ', picture.width);
        writeln('The height is : ', picture.height);
        checkdimensions;
        if error1 = false then begin
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
        	end; {for}
        end; {if}
end; {readimage}

procedure writeimage;
begin
	writeln;
        for row := 1 to picture.height do begin
        	for column := 1 to picture.width do begin
                	write(' ',picture.pixels[column,row]:3);
                end; {for}
                writeln;
        end; {for}
end; {writeimage}

procedure makebinary;
begin
        binary.width := picture.width;
        binary.height := picture.height;
	for row := 1 to picture.height do begin
     		for column := 1 to picture.width do begin
        		if picture.pixels[column,row] >= threshold then
                		binary.pixels[column,row] := 1
                	else if picture.pixels[column,row] < threshold then
                		binary.pixels[column,row] := 0;
        	end; {for}
	end; {for}
end; {makebinary}

procedure writethresh;
begin
	writeln('For a threshold value of ',threshold, ' the image looks like this:');
        for row := 1 to binary.height do begin
        	for column := 1 to binary.width do begin
                	if binary.pixels[column,row] = 1 then
                        	write(' #')
                        else if binary.pixels[column,row] = 0 then
                        	write(' -')
                end; {for}
                writeln;
        end; {for}
end; {writethresh}

begin
	writeln('Welcome to the Image Processor.');
	readimage;
        checkvalues;
        if (error1 = false) and (error2 = false) then begin
                writeimage;
        	makebinary;
        	writethresh;
        end; {if}
end. {main}
