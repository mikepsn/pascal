program sumpoly (input, output);

type
	poly = array[0..50] of real;

var
	poly1 : poly;		{array of first polynomial}
        poly2 : poly;		{array of second polynomial}
        product : poly;		{sum of two polynomials}
        coeff : real;		{coefficients of each polynomial}

begin
	write('How many coefficients in first polynomial: ');
        readln(number);
        writeln('Enter each coefficient followed by ENTER');
        for i := 0 to number to begin
        	readln
