program infinite2 (input, output);

{uses wincrt;}

var
   i, num : integer;
   a, k, b : real;

begin
     i := 0;
     a := 0;
     num := 2;
     while a < 2 do begin
     	num := num + 1;
           	for i := 2 to num do begin
                	i := 2*i; 
                    writeln(i);
                end;
        a := a + 1/i;
     end;
     writeln('The final sum is: ', a:1:10);
     writeln('The number of terms was: ', num);
end.
