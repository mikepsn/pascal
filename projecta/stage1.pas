program stage1  (input, output);

{ Stage 1 of Project A for Engineering Computing 121
  By Michael Papasimeon - 26/3/93 - Science/Engineering
}

const
     lastval = -1;

var
   x : real; { Judges mark }
   n : integer; { Contestant number }
   num : integer; { Number of scores/judges }
   sum, average : real; { The sum and mean of the scores }
   highest : real; { Highest number }
   lowest : real; { Lowest number }

begin
     writeln('Enter contestant numbers & scores');
     sum := 0;
     num := 0;
     average := 0;
     x := 0;
     read(n);
     read(x);
     highest := x;
     lowest := x;
     while (x <> lastval) do begin
           sum := sum + x;
           num := num + 1;
           writeln(sum/num);
           read(x);
           if x > highest then x := highest;
           if x < lowest then x := lowest;
           writeln('The highest number is ', highest);
           writeln('The lowest numbers is ', lowest);
           end;
     average := sum/num;
     writeln('Contestant ',n,' scored an average of ',average:1:4);
end.
