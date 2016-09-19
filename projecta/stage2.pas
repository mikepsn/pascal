program stage2  (input, output);

{ Stage 2 of Project A for Engineering Computing 121
  By Michael Papasimeon - 26/3/93 - Science/Engineering
}

const
     lastval = -1;

var
   x : real; { Judges mark }
   n : integer; { Contestant number }
   num : integer; { Number of scores/judges }
   sum, average : real; { The sum and mean of the scores }
   highest : real; {highest number}
   lowest : real; {lowest number}

procedure max; { max }
var
   i : integer;
begin
      i := 0;
      for i := 0 to num do
      if x > highest then highest := x;
end; {max}

procedure min; { min }
var
   i : integer;
begin
     i := 0;
     for i := 0 to num do
     if x < lowest then lowest := x;
end; {min}

procedure clearscreen; {clearscreen}
const
     screenlength = 26; {the number of lines per screen}
var
   i : integer;
begin
     for i := 1 to screenlength do
         writeln;
end; {clearscreen}

begin
     clearscreen;
     writeln('**************************************************************');
     writeln('*                                                            *');
     writeln('*                OLYMPIC JUDGES SCORING PROGRAM              *');
     writeln('*                                                            *');
     writeln('**************************************************************');
     writeln;
     writeln(' Enter the contestant''s number followed by his or hers');
     writeln(' scores given by the judges (0 to 10). End with -1. ');
     sum := 0;
     num := 0;
     average := 0;
     x := 0;
     lowest := maxint;
     read(n);
     read(x);
     while {x > lastval} not eof do begin
           sum := sum + x;
           num := num + 1;
           min;
           max;
           read(x);
           end;
     average := (sum - highest - lowest)/(num - 2);
     { The average is computed by subtracting the highest & lowest scores }
     writeln;
     writeln('Contestant ',n,' scored an average of ',average:1:4);
end.
