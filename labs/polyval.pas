program getpoly (input, output);

{ uses wincrt; } 

{ Exercise 6-2 for Engineering Computing 121 tutorial }

const
	maxdegree = 100;

type
	coeff = array[0..maxdegree] of integer;

var
	poly : coeff;           {the polynomial array}
        c : integer;            {the value of each coefficient}
        i, a : integer;         {the positions of the coefficients}
        degree : integer; 	{degree of the polynomial}
        x : integer;		{the variable x of the coefficent}
        y, ans : real;          {the value of y}
        deg, degr : integer;    {the current degree}
        result : real;          {the powered result}

function powers(val, power : integer) : real;
var
	i : integer;
begin
	result := 1;
        	for i := 1 to power do begin
                	result := result*val;
                        powers := result;
                end; {for}
end; {power}

begin
	degree := 0;
        {initialise the array}
        for c := 0 to maxdegree do poly[c] := 0;
	writeln('Enter the degree of the polynomial');
        	readln(degree);
        	deg := degree;
                degr := degree;
	writeln('Please enter the coefficients of the polynomial');
        	for i := 0 to degree do begin
                	readln(c);
                        poly[i] := c;
                end; {for}
        writeln('The polynomial is therfore');
		for a := 0 to i do begin
        		write(poly[a],'x^',degree,' + ');
                        degree := degree -1;
        	end; {for}
        writeln;
        writeln('Enter a value for x');
        readln(x);
        y := 0;
        	for a := degr downto 0 do begin
                	ans := powers(x, deg);
                        y := y + poly[a]*ans;
                        deg := deg - 1;
                end;
                y := y + poly[0]*x;
                writeln('When x = ',x,', y = ',y:1:3);
end.
