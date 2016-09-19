program productpoly (input, output);

{ uses wincrt; } 

{ Ex 6-1, pg 4-26 - Lab 10 for Engineering Computing 121
	Written by : Michael Papasimeon
        Date : 16 May, 1993

	This program reads from inputs the coefficients of a polynomial
        and then writes the coefficients.
}

const
	maxdegree = 20;

type
	coeff = array[0..maxdegree] of integer;

var
	poly1, poly2 : coeff;   	{the polynomial arrays}
        product : coeff;		{the product of poly1, poly2}
        x : integer;            	{the value of each coefficient}
        i, a : integer;         	{the positions of the coefficients}
        degree1, degree2 : integer; 	{degree of the polynomial}

begin
	degree1 := 0;
        degree2 := 0;
        {initialise the arrays}
        for x := 0 to maxdegree do poly1[x] := 0;
        for x := 0 to maxdegree do poly2[x] := 0;
        for x := 0 to maxdegree do product[x] := 0;
	writeln('Enter the degree of the polynomial');
        	readln(degree1);
	writeln('Please enter the coefficients of the polynomial');
        	for i := 0 to degree1 do begin
                	readln(x);
                        poly1[i] := x;
                end; {for}
                for i := 0 to degree1 do begin
                	write(' ', poly1[i]);
                end; {for}
        writeln;
        writeln('Enter the degree of the second polynomial');
        	readln(degree2);
	writeln('Please enter the coefficients of the polynomial');
        	for i := 0 to degree2 do begin
                	readln(x);
                        poly2[i] := x;
                end; {for}
                for i := 0 to degree2 do begin
                	write(' ', poly2[i]);
                end; {for}
        writeln;
        	if (degree2 >= degree1) then begin
                	for i := degree2 to 0 do begin
                        	product[i] := poly1[i]*poly2[i];
                        end; {for}
                        writeln('(1) The coefficients of the product are: ');
                        for i := 0 to maxdegree do begin
                        	write(' ', product[i]);
                	end; {for}
                end; {if}
                if (degree2 < degree1) then begin
                	for i := 0 to degree1 do begin
                        	product[i] := poly1[i]*poly2[i];
                        end; {for}
                        writeln('(2) The coefficients of the product are: ');
                        for i := 0 to maxdegree do begin
                        	write(' ',product[i]);
                        end; {for}
                end; {if}

end. {main}
