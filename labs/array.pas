program arrays (input, output);

{uses wincrt;}

const
	a = 50;

type
	scores = array[1..50] of integer;

var
	number : scores;
        x : integer;
        i : integer;

begin
	writeln('Please enter numbers to store in the array');
        	for i := 1 to 10 do begin
                	readln(x);
                        number[i] := x;
                end;
        writeln('Thats all folks!');
        writeln(number[7]);


end.
