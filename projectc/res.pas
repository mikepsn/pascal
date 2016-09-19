program gfuj (input, output);

{ uses wincrt; } 

{type ping = file of integer;}

var
	F  : text;
        V, b : integer;

begin
	writeln('Welcome');
	assign(F, 'pingpong.txt');
        reset(F);
	while not eof(F) do begin
			read(F, V);
        	        b := V;
        		writeln('b is: ',b);
        end; {while}
end.
