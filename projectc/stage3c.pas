program stage3 (input, output,pingpong,mean,median);

{
| Image Processing : Ping Pong Playing Robot
| Function : This program detects a ping pong ball in a digitized image.
| The program reads in an image file consisting of integer greYscale
| values from 0 to 255, and from this image produced a mean filtered
| or average image which is then in turn thresholded at an inputed value.
| The program then repeats the same process but using a median filtering technique.
| The result is an image which distinguishes light areas from dark areas
| so that the ping pong ball in the image can be recognised by the robot.
| Written by : Michael Papasimeon (User name: mikepsn) 
| Date : 23 May 1993
| Written for : Project C of Engineering Computing 121
| Level : Stage 3
}

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
	range = 1..9;				{ the number of pixels in a 3x3 neighbourhood }
        elements = array[range] of integer;	{ array of a 3x3 neighbourhood for each pixel }

var
	threshold : integer;			{ threshold value }
	picture : image;			{ original image record }
        average : image;			{ mean filtered image }
        binarymean : image;                     { binary mean filtered image }
        data : elements;                        { neighbour data to sort }
        med : image;				{ median filtered image }
        binarymedian : image;			{ binary median image }
        pingpong : text;			{ file read from current directory }
        mean : text;	           		{ mean text file written to }
        median : text;	         		{ median text file to write to }
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

var
	column : integer;
	row : integer;

begin
        reset(pingpong);
        picture.height := 1; {initialise for while loop }
        while row < picture.height  do begin
		writeln('Enter the width and height of the image.');
        	read(pingpong, picture.width);
        	read(pingpong, picture.height);
        	writeln('The width is : ', picture.width);
        	writeln('The height is : ', picture.height);
        	checkdimensions;
        	if error1 = false then begin
        		writeln('Entering the grayscale values');
       		for row := 1 to picture.height do begin
        		for column := 1 to picture.width do begin
        			read(pingpong, value);
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

var
	column : integer;
	row : integer;

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

var
	column : integer;
	row : integer;

begin
        average.width := picture.width;
        average.height := picture.height;
        for row := 1 to picture.height do begin
        	for column := 1 to picture.width do begin
                	if (row = picture.height) and (column = picture.width) then begin
            			average.pixels[column,row] :=
                                	round((
                                	4*picture.pixels[column,row] +
                                        2*picture.pixels[column,row-1] +
                                        2*picture.pixels[column-1,row] +
                                        picture.pixels[column-1,row-1]
                                        )/9) ;
			end {if}
                        else if (row = 1) and (column = picture.width) then begin
                        	average.pixels[column,row] :=
                                	round((
                                        4*picture.pixels[column,row] +
                                        2*picture.pixels[column-1,row] +
                                        2*picture.pixels[column,row+1] +
                                        picture.pixels[column-1,row+1]
                                        )/9) ;
                        end {if}
                        else if (row = picture.height) and (column = 1) then begin
                        	average.pixels[column,row] :=
                                	round((
                                        4*picture.pixels[column,row] +
                                        2*picture.pixels[column,row-1] +
                                        2*picture.pixels[column+1,row] +
                                        picture.pixels[column+1,row-1]
                                        )/9) ;
                        end {if}
                        else if (row = 1) and (column = 1) then begin
                        	average.pixels[column,row] :=
                                	round((
                                        4*picture.pixels[column,row] +
                                        2*picture.pixels[column,row+1] +
                                        2*picture.pixels[column+1,row] +
                                        picture.pixels[column+1,row+1]
                                        )/9) ;
                        end {if}
                        else if (column = picture.width) and (row<>1) and (row<>picture.height) then begin
                        	average.pixels[column,row] :=
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
                        	average.pixels[column,row] :=
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
                        	average.pixels[column,row] :=
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
                        	average.pixels[column,row] :=
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
                        	average.pixels[column,row] :=
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

var
	column : integer;
	row : integer;

begin
	writeln('The greyscale values of the mean filtered image are: ');
	writeln;
        writeln(average.width,' ',average.height);
        for row := 1 to average.height do begin
        	for column := 1 to average.width do begin
                	write(' ',average.pixels[column,row]:3);
                end; {for}
                writeln;
        end; {for}
        writeln;
end; {writemean}

procedure writemeanfile;
{ writes the mean filtered image to a text file called mean }

var
	column : integer;
	row : integer;

begin
	rewrite(mean);
        write(mean, average.width:2);
        write(mean,average.height:2);
        writeln(mean);
        for row := 1 to average.height do begin
        	for column := 1 to average.width do begin
                	write(mean, average.pixels[column,row]:4);
                end; {for}
                writeln(mean);
        end; {for}
end; {writemeanfile}

procedure makemeanbinary;
{ makes a binary (0 and 1) map of the mean filtered image using the threshold value }

var
	column : integer;
	row : integer;

begin
        binarymean.width := average.width;
        binarymean.height := average.height;
	for row := 1 to average.height do begin
     		for column := 1 to average.width do begin
        		if average.pixels[column,row] >= threshold then
                		binarymean.pixels[column,row] := 1
                	else if average.pixels[column,row] < threshold then
                		binarymean.pixels[column,row] := 0;
        	end; {for}
	end; {for}
end; {makemeanbinary}

procedure writemeanthresh;
{
 writes to the screen a thresholded image of the mean filtered image
 using the data from the binary file
}

var
	column : integer;
	row : integer;

begin
	writeln('For a threshold value of ',threshold, ' the mean filtered');
        writeln('image looks like this:');
        writeln;
        for row := 1 to binarymean.height do begin
        	for column := 1 to binarymean.width do begin
                	if binarymean.pixels[column,row] = 1 then
                        	write(' #')
                        else if binarymean.pixels[column,row] = 0 then
                        	write(' -')
                end; {for}
                writeln;
        end; {for}
        writeln;
end; {writemeanthresh}

procedure sort(var a:elements; n : range);
var
	temp : integer;
        i, chosen, leftmost : range;

begin
	for leftmost := 1 to n-1 do begin
        	chosen := leftmost;
                for i := leftmost + 1 to n do
                	if a[i] < a[chosen] then chosen := i;
                temp := a[chosen];
                a[chosen] := a[leftmost];
                a[leftmost] := temp;
        end;
end; {sort}

procedure makemedian;
{
 finds and calculates the median of each 3x3 matrix neighbourhood for
 each pixel in the picture image and uses this to create a new median filtered image
}
var
	k : integer;
	column : integer;
	row : integer;

begin
        med.width := picture.width;
        med.height := picture.height;
        for row := 1 to picture.height do begin
        	for column := 1 to picture.width do begin
                	if (row = picture.height) and (column = picture.width) then begin
            			for k := 1 to 4 do
                                	data[k] := picture.pixels[column,row];
                                for k := 5 to 6 do
                                        data[k] := picture.pixels[column,row-1];
                                for k := 7 to 8 do
                                        data[k] := picture.pixels[column-1,row];
                                        data[9] := picture.pixels[column-1,row-1];
                        end {if}
                        else if (row = 1) and (column = picture.width) then begin
                        	for k := 1 to 4 do
                                        data[k] := picture.pixels[column,row];
                                for k := 5 to 6 do
                                        data[k] := picture.pixels[column-1,row];
                                for k := 7 to 8 do
                                        data[k] := picture.pixels[column,row+1];
                                        data[9] := picture.pixels[column-1,row+1];
                        end {if}
                        else if (row = picture.height) and (column = 1) then begin
                        	for k := 1 to 4 do
                                        data[k] := picture.pixels[column,row];
                                for k := 5 to 6 do
                                        data[k] := picture.pixels[column,row-1];
                                for k := 7 to 8 do
                                        data[k] := picture.pixels[column+1,row];
                                        data[9] := picture.pixels[column+1,row-1];
                        end {if}
                        else if (row = 1) and (column = 1) then begin
                        	for k := 1 to 4 do
                                        data[k] := picture.pixels[column,row];
                                for k := 5 to 6 do
                                        data[k] := picture.pixels[column,row+1];
                                for k := 7 to 8 do
                                        data[k] := picture.pixels[column+1,row];
                                        data[9] := picture.pixels[column+1,row+1];
                        end {if}
                        else if (column = picture.width) and (row<>1) and (row<>picture.height) then begin
                                        data[1] := picture.pixels[column-1,row-1];
                                        data[2] := picture.pixels[column-1,row];
                                        data[3] := picture.pixels[column-1,row+1];
                        	for k := 4 to 5 do
                                        data[k] := picture.pixels[column,row-1];
                        	for k := 6 to 7 do
                                        data[k] := picture.pixels[column,row];
                        	for k := 8 to 9 do
                                        data[k] := picture.pixels[column,row+1];
                        end {if}
                        else if (column = 1) and (row<>1) and (row<>picture.height) then begin
                        	for k := 1 to 2 do
                                        data[k] := picture.pixels[column,row-1];
                                for k := 3 to 4 do
                                        data[k] := picture.pixels[column, row];
                                for k := 5 to 6 do
                                        data[k] := picture.pixels[column,row+1] ;
                                        data[7] := picture.pixels[column+1,row-1];
                                        data[8] := picture.pixels[column+1,row];
                                        data[9] := picture.pixels[column+1,row+1];
                        end {if}
                        else if (row = picture.height) and (column<>1) and (column<>picture.width) then begin
                                        data[1] := picture.pixels[column-1,row-1];
                                        data[2] := picture.pixels[column,row-1];
                                        data[3] := picture.pixels[column+1,row-1];
                                for k := 4 to 5 do
                                        data[k] := picture.pixels[column-1,row];
                                for k := 6 to 7 do
                                        data[k] := picture.pixels[column,row];
                                for k := 8 to 9 do
                                        data[k] := picture.pixels[column+1,row];
                        end {for}
                        else if (row = 1) and (column<>1) and (column<>picture.width) then begin
                        	for k := 1 to 2 do
                                        data[k] := picture.pixels[column-1,row];
                                for k := 3 to 4 do
                                        data[k] := picture.pixels[column,row];
                                for k := 5 to 6 do
                                        data[k] := picture.pixels[column+1,row];
                                        data[7] := picture.pixels[column-1,row+1];
                                        data[8] := picture.pixels[column,row+1];
                                        data[9] := picture.pixels[column+1,row+1];
                        end {for}
                        else begin
                                data[1] := picture.pixels[column-1,row-1];
				data[2] := picture.pixels[column-1,row];
                                data[3] := picture.pixels[column-1,row+1];
                                data[4] := picture.pixels[column,row-1];
                                data[5] := picture.pixels[column,row];
                                data[6] := picture.pixels[column,row+1];
                                data[7] := picture.pixels[column+1,row-1];
                                data[8] := picture.pixels[column+1,row];
                                data[9] := picture.pixels[column+1,row+1];
                        end; {else}
                sort(data,9);
                med.pixels[column,row] := data[5];
                end; {for}
        end; {for}
end; { makemean }

procedure writemedian;

var
	column : integer;
	row : integer;

begin
	writeln;
     	writeln('The greyscale values of the median filtered image are: ');
	writeln;
        writeln(med.width,' ',med.height);
        for row := 1 to med.height do begin
        	for column := 1 to med.width do begin
                	write(' ',med.pixels[column,row]:3);
                end; {for}
                writeln;
        end; {for}
        writeln;
end; { writemedian }

procedure makemedianbinary;
{ makes a binary (0 and 1) map of the median filtered image using the threshold value }

var
	column : integer;
	row : integer;

begin
        binarymedian.width := med.width;
        binarymedian.height := med.height;
	for row := 1 to med.height do begin
     		for column := 1 to med.width do begin
        		if med.pixels[column,row] >= threshold then
                		binarymedian.pixels[column,row] := 1
                	else if med.pixels[column,row] < threshold then
                		binarymedian.pixels[column,row] := 0;
        	end; {for}
	end; {for}
end; {makemedianbinary}

procedure writemedianthresh;
{
 writes to the screen a thresholded image of the median filtered image
 using the data from the binary file
}

var
	column : integer;
	row : integer;

begin
	writeln('For a threshold value of ',threshold, ' the median filtered');
        writeln('image looks like this:');
        writeln;
        for row := 1 to binarymedian.height do begin
        	for column := 1 to binarymedian.width do begin
                	if binarymedian.pixels[column,row] = 1 then
                        	write(' #')
                        else if binarymedian.pixels[column,row] = 0 then
                        	write(' -')
                end; {for}
                writeln;
        end; {for}
        writeln;
end; {writemedianthresh}

procedure writemedianfile;
{ writes the median filtered image to a text file called mean }

var
	column : integer;
	row : integer;

begin
	rewrite(median);
        write(median, average.width:2);
        write(median,average.height:2);
        writeln(median);
        for row := 1 to med.height do begin
        	for column := 1 to med.width do begin
                	write(median, med.pixels[column,row]:4);
                end; {for}
                writeln(median);
        end; {for}
end; {writemedianfile}

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
        	writeln;
        	writeln('***** MEAN FILTERING *****');
                writeimage;
                makemean;
                writemean;
                writemeanfile;
        	makemeanbinary;
                writemeanthresh;
                writeln('***** MEDIAN FILTERING*****');
                makemedian;
                writemedian;
                makemedianbinary;
        	writemedianthresh;
                writemedianfile;
        end; {if}
end. {main}

