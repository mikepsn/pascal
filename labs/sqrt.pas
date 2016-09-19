program mysqrt (input, output);

const
     accuracy = 1e-6;

var
   x, x1, x2, y : real;

begin
     write('Enter a value to find the square root of: ');
     readln(y);
     x1 := 1;
          while abs(x*x-y) > abs(accuracy*y) do begin
                x2 := (y/(x1+x1))/2; write(' ',x2:1:5);
                x1 := x2;
          end;
     writeln('The square root of ',y,' is ',x);
     writeln('The built in value is ' , sqrt(y));
end.
