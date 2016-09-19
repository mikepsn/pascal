program getpoly (input, output);

{ uses wincrt; } 

{ Ex 6-1, pg 4-26 - Lab 10 for Engineering Computing 121
	Written by : Michael Papasimeon
        Date : 16 May, 1993

	This program reads from inputs the coefficients of a polynomial
        and then writes the coefficients.
}

const
	maxdegree = 100;

type
	coeff = array[0..maxdegree] of integer;

var
	poly : coeff;           {the polynomial array}
        x : integer;            {the value of each coefficient}
        i, a : integer;         {the positions of the coefficients}
        degree : integer; 	{degree of the polynomial}

begin
	degree := 0;
        {initialise the array}
        for x := 0 to maxdegree do poly[x] := 0;
	writeln('Enter the degree of the polynomial');
        	readln(degree);
	writeln('Please enter the coefficients of the polynomial');
        	for i := 0 to degree do begin
                	readln(x);
                        poly[i] := x;
                end; {for}
        writeln('The polynomial is therfore');
		for a := 0 to i do begin
        		write(poly[a],'x^',degree,' + ');
                        degree := degree -1;
        	end; {for}
end.
