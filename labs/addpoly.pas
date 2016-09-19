
program addpolylist( input, output );

{ uses wincrt; } 

{
   Name of program : addpolylist
   Function: adds a list of polynomials
   Written by : Michael Papasimeon
   Date : 17 May 1993
   For : Engineering Computing 121 Lab Class
}
   
const
	maxdegree = 20;  { Maximum degree of a polynomial }

type
	polynomial = record
		degree: 0..maxdegree;
		{coefficients are stored from lowest to highest term}
		coeff: array [0..maxdegree] of real
		end;

var
	value : real;		{ The value of the coefficients }
        deg1, deg2 : integer;	{ The degree of the polynomial	}
        p, q, r : polynomial;	{ The two polynomials and their sum }
        i : integer;		{ A counter variable }


procedure addpoly ( p, q: polynomial; var r: polynomial );
{
    Sub program to provide basic datatype definitions for polynomials
    and the procedure addpoly.

}

{addpoly adds polynomials p and q and returns the result in r}
var
	d, mind: 0..maxdegree;	{index and degree of smaller polynomial}
begin
	{determine degree of smaller polynomial}
	if p.degree < q.degree then
		mind := p.degree
	else
		mind := q.degree;

	{add coefficients of the same terms in p and q}
	for d := 0 to mind do
		r.coeff[d] := p.coeff[d] + q.coeff[d];

	{include unmatched terms from larger polynomial}
	{nb. only one of these for loops will be executed}
	for d := mind+1 to p.degree do
		r.coeff[d] := p.coeff[d];
	for d := mind+1 to q.degree do
		r.coeff[d] := q.coeff[d];

	{ Set r.degree, initially to larger of p and q }
	r.degree := q.degree + p.degree - mind;
	{ Check leading coefficient is non-zero }
	while (r.degree>0) and
		(r.coeff[r.degree] = 0) do
			r.degree := r.degree - 1
end {addpoly};


begin
	writeln('This program adds two polynomials together.');
        writeln('NOTE: Only dense polynomials are accepted.');
        writeln('Start by entering the coefficient of the smallest degree and,');
        writeln('the progress on to the larger degreess');
        writeln;
        writeln('Of what degree is first polynomial? ');
        readln(deg1);
        writeln('Enter the coefficients of the first polynomial followed by ENTER.');
        	for i := 0 to deg1 do begin
                	readln(value);
                        p.coeff[i] := value;
                end;
        writeln;
        writeln('Of what degree is the second polynomial?');
        readln(deg2);
        writeln('Enter the coefficients of the second polynomial followed by ENTER.');
        	for i := 0 to deg2 do begin
                	readln(value);
                        q.coeff[i] := value;
                end;
        writeln('The computer is now adding the two polynomials.');
        addpoly(p,q,r);
        	for i := 0 to 10 do begin
                	write(' p = ',p.coeff[i]:1:1);
                        write(' q = ',q.coeff[i]:1:1);
                	{addpoly(p, q, r);}
                	write(' sum = ',r.coeff[i]:1:1);
                        writeln;
                end;
end.


