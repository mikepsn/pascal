program prime (input, output);

var
   s : integer; {start value}
   n : integer; {counter}
   a : integer; {if a = 0 etc.}

procedure nextPrime;

var
   i : integer; {counter}

begin
     while a <> 0 do begin
           for i := 2 to ((s+n) - 1) do begin
               a := (s+n) mod i;
               writeln('a: ',a); writeln('i: ',i);
           end;
           n := n + 1;
           writeln('junk');
     end;
end; {nextPrime}

begin
     write('Enter start value: ');
     readln(s);
     n := 0;
     a := 1;
{          while a <> 0 do begin}
                nextPrime;
                {n := n + 1;} writeln('hewirahwgio ', n);
 {         end;}
     writeln(s+n);
end.
