program numberprogram (input, output);

{ Engineering Computing 121 tutorial problem program. Exercise 4-3, 
page 4-20. Written by Michael Papasimeon, March 1993. (Science/Enginering).}

var
	count: integer;
	x, sum, max, mean: real;
	i : 0..maxint;
		
procedure maximum;
	begin
		i := 0;
		for i := 0 to count do
		if x > max then 
		max := x;
	end; {maximum}
		
begin
	writeln('               NUMBER PROGRAM  ');
	writeln('               **************  ');
	writeln(' ');
	writeln('---------------------------------------------------------');
	writeln('|This program aks you to enter a series of numbers, and |');
	writeln('|then will calculate the sum of the numbers, their mean |');
	writeln('|or average, find the highest number in the group and   |');
	writeln('|will also count how many numbers you have entered.     |');
	writeln('---------------------------------------------------------');
	writeln(' ');
	writeln('Please enter the numbers one by one, each number followed');
	writeln('by pressing the RETURN or ENTER key.');
	writeln(' ');
		
	sum := 0;
	count := 0;
	read(x);
	while x <> 0 do begin
		sum := sum + x;
			writeln('The sum of the numbers is ', sum);
			writeln(' ');
		count := count + 1;
			writeln(count, ' numbers have been entered so far');
			writeln(' ');
		maximum;
			writeln('The maximum number so far is ', max);
			writeln(' ');
		mean := sum/count ;
			writeln('The average of the numbers is ', mean);
			writeln(' ');
		writeln('Enter the next number. Enter 0 (zero) to end');
		writeln('the program');
		read(x);
	end;
end.
	
		
