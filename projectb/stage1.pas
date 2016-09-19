program stage1 (input, output);

const
	g = 9.81; 	{ acceleration due to gravity}

var
	V : real;	{ initial velocity }
        theta : real; 	{ launch angle in radians }
        angle : real; 	{ launch angle in degrees }
        time : real;	{ time of flight }
        x : real;	{ horizontal distance }

function cdr(angle : real): real; {Convert Degress to Radians}
const
	pi = 3.141592654;
begin
	cdr := angle * pi/180;
end; {cdr}

function distance(V, theta: real); real;
begin
	t := (2*V*sin(theta))/g;
	distance := t*V*cos(theta);
end; {distance}

begin
	write('Enter initial velocity and launch angle: ');
        readln(V, angle);
        theta := cdr(angle);
        x := distance(V, theta);
        writeln('The horizontal distance is: ',x:1:5, 'metres');
end.

