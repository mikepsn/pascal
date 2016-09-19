program powers (input, output);

{ uses wincrt; } 

var
	x : integer;
        power : integer;
        result : real;
        i : integer;

begin
	writeln('Enter your value');
        readln(x);
        writeln('Enter the power');
        readln(power);
        result := 1;
        	for i := 1 to power do begin
                	result := result*x;
                end;
        writeln(result:1:3);
end.
