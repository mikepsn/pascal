program jeep2 (input, output);

var
   d, a, n: real;
   i : integer;

begin
     write('Enter the value for d: ');
     readln(d);
     a := 0;  n := 0.5*(-500/d + a + 1);
           {while i <= ((2*n)-1) do begin}
           for i := 1 to trunc(2*n - 1) do begin
                 i := i + 2;
                 a := a + i;
                 end;
     n := 0.5*(-500/d + a + 1);
     writeln;
     writeln('The value n is: ',n:1:2);
     readln;
end.
