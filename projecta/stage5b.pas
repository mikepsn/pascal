program stage5 (input, output);

{ Stage 5 of Project A for Engineering Computing 121
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
   second, third : real; {the 2nd & 3rd highest averages}
   number2, number3 : integer; {the 2nd & 3rd placed contestants}

procedure max; { max }
var
   i : integer;
begin
      i := 0;
      for i := 0 to num do
      if score > highest then highest := score;
end; {max}

procedure min; { min }
var
   i : integer;
begin
     i := 0;
     for i := 0 to num do
     if score < lowest then lowest := score;
end; {min}

procedure numsum; {numsum}
begin
    lowest := maxint;
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
          {average := (sum - highest - lowest)/(num - 2);
          writeln('average is ', average);}
          read(score);
    end;
end; {numsum}

procedure gold; {gold}
begin
     if average > winningmean then begin {if}
        winningmean := average;
        champion := contestant
     end {if}
     else if (average < winningmean) and (second > average) then begin {if}
        second := average;
        number2 := contestant;
     end {if}
     else if (average > third) and (third < second) then begin {if}
        third := average;
        number3 := contestant
     end {if}
end;

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
     winningmean := 1; second := maxint; third := maxint;
           while not eof do begin {while}
               average := 0; num := 0; sum := 0;
               numsum;
               readln;
               average := (sum - highest - lowest)/(num - 2);
               writeln('Contestant ',contestant,' scored ',average:1:4);
               gold;      writeln(number2);
           end; {while}
     writeln('The winner is contestant ',champion);
     writeln('with a score of ',winningmean:1:4);
     writeln;
     writeln('The second place goes to contestant ',number2);
     writeln('with a score of ',second:1:4);
     writeln;
     writeln('The third place goes to contestant ',number3);
     writeln('with a score of ',third:1:4);
end. {main}
