program stage3  (input, output);

{ Stage 3 of Project A for Engineering Computing 121
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
   winningmean : real; {the highest, winning mean}
   champion : integer; {the contestant's number who won}

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

procedure numsum; {numsum}
begin
    sum := 0;
    num := 0;
    x := 0;
    read(n);
    read(x);
    while x > lastval do begin
          sum := sum + x;
          num := num + 1;
          min;
          max;
          read(x);
    end;
end; {numsum}

procedure winner; {winner}
begin
     if average > winningmean then begin {if}
        winningmean := average;
        champion := n;
     end; {if}
end; {winner}

procedure clearscreen; {clearscreen}
const
     screenlength = 26; {the number of lines per screen}
var
   i : integer;
begin
     for i := 1 to screenlength do
         writeln;
end; {clearscreen}

begin {main}
     clearscreen;
     writeln('**************************************************************');
     writeln('*                                                            *');
     writeln('*                OLYMPIC JUDGES SCORING PROGRAM              *');
     writeln('*                                                            *');
     writeln('**************************************************************');
     writeln;
     writeln(' Enter the contestant''s number followed by his or hers');
     writeln(' scores given by the judges (0 to 10). End with -1. ');
     while not eof do begin {while}
           average := 0;
           lowest := maxint;
           numsum;
           readln;
           average := (sum - highest - lowest)/(num - 2);
           writeln('Contestant ',n,' scored an average of ',average:1:4);
           winner;
     end; {while}

     writeln('Winner is ',champion);
     writeln('Score of ',winningmean:1:4);
end. {main}
