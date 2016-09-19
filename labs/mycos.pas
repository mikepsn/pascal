program mycos (input,output);

const
     epsilon = 1.00e-6;

var
   x, a  : real; { variable x, in cos(x) }
   n : integer; { the nth term }
   y : real; { the cosine of x }
   t : real; {term x^(n+2)/n=2 }
   b : real; { - t + t }

procedure taylor;
{calculates the cosine of x using the Taylor series}
begin
     y := 1 - sqr(x)/2 + sqr(sqr(x))/24 - (x*x*x*x*x*x)/720;

end; { taylor}

begin
     a := cos(x);
     writeln ('Enter a number to find the cosine of...');
     read(x);
     taylor;
     writeln('Using the taylor series cos(x) is', y);
     writeln('The actual cos of x is' , a);
     read(x)

end.

