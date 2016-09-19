program stage4  (input, output);

{ Stage 4 of Project A for Engineering Computing 121
  By Michael Papasimeon - 26/3/93 - Science/Engineering
}

const
     lastval = -1; {sentinel used to show end of contestant's scores}

var
   score : real; { Judges mark }
   contestant : integer; { Contestant number }
   num : integer; { Number of scores or judges }
   sum, average : real; { The sum and mean of the scores }
   highest : real; {highest number in a set of scores}
   lowest : real; {lowest number in a set of scores}
   winningmean : real; {the highest, winning mean}
   champion : integer; {the contestant's number who won}

procedure max; { max }
begin
     highest := 0;
     if score > highest then highest := score;
end; {max}

procedure min; { min }
begin
     if score < lowest then lowest := score;
end; {min}

procedure numsum; {numsum}
begin
    sum := 0;
    num := 0;
    score := 0;
    read(contestant);
    read(score);
    while score > lastval do begin
          sum := sum + score;
          num := num + 1;
          min;
          max;
          read(score);
    end;
end; {numsum}

procedure winner; {winner}
begin
     if average > winningmean then begin {if}
        winningmean := average;
        champion := contestant;
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
     writeln('*       SCORING PROGRAM FOR THE ATLANTA 1996 OLYMPICS        *');
     writeln('*             WRITTEN BY MICHAEL PAPASIMEON                  *');
     writeln('*                                                            *');
     writeln('**************************************************************');
     writeln;
     writeln(' Enter the contestant''s number followed by his or her');
     writeln(' scores (0 to 10) given by the judges. End with -1. ');
     while not eof do begin {while}
           average := 0;
           lowest := maxint;
           numsum;
           readln;
           writeln(sum:1:4,' ',(highest+lowest):1:4);
           average := (sum - highest - lowest)/(num - 2);
           writeln('Contestant ',contestant,' scored ',average:1:4);
           writeln(sum/num:1:4);
           winner;
     end; {while}
     writeln('The winner is contestant ',champion);
     writeln('with a score of ',winningmean:1:4);
end. {main}
