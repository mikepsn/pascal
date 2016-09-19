program newton (input, output);

var
   x, x2 : real;
   dev : real;
   y : real;
   i : integer;

begin
     writeln('enter x');
     readln(x);
               for i := 1 to 10 do begin
                   y := x - 4 - ln(x);
                   dev := 1 - 1/x;
                   x2 := 0;
                   x2 := x - y/dev;
                   x := x2;
                   writeln(x2:1:3);
               end;
     end.
