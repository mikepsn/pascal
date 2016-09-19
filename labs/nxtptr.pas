program prime (input, output);

var
   s, a, n : integer;

{function nextPrime (s, a, n : integer):integer;}
procedure nextPrime;
begin
     while a <> 0 do begin
           n := n + 1;   writeln(n);
           a := s mod n; writeln(a);
     end;
end; {nextPrime}

begin
     writeln('Enter the number: ');
     readln(s);
     a := 1;
     n := 1;
     while a <> 0 do begin
           s := s + 1;
           nextPrime;
     end;
     writeln(n);
end.
