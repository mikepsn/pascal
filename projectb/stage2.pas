program stage2 (input, output);

uses wincrt;

const
	g = 9.81; 	{ acceleration due to gravity}

var
	V : real;	{ initial velocity }
         	{ launch angle in radians }
        angle : real; 	{ launch angle in degrees }
        t : real;	{ time of flight }
        x : real;	{ horizontal distance }
        target : real; 	{ target distance }

function cdr(angle : real): real; {Convert Degress to Radians}
const
	pi = 3.141592654;
begin
	cdr := angle * pi/180;
end; {cdr}

function distance(V, theta: real): real;
begin
	t := (2*V*sin(theta))/g;
	distance := t*V*cos(theta);
end; {distance}

procedure secant;
const
	accuracy = 1e-1;
var
	theta, theta1, theta2,
        distance1, distance2 : real;
        iterations : integer;
begin
	theta := 0; 			{ initial estimate }
        theta1 := pi/4; 		{ initial estimate }
        iterations := 0;
        distance1 := distance(V, theta1);
        	while abs(target - distance1) > accuracy do begin
                        iterations := iterations + 1;
                        writeln('Iterations: ', iterations);
                        { current estimates become old estimates }
                        theta2 := theta1;
                        theta1 := theta;
                        distance2 := distance1;
                        { calculate the new estimates }
                        distance1 := distance(V, theta1);
                        writeln(distance1);
                        theta := (theta1*distance2 - theta2*distance1)/(distance2 - distance1);
                        writeln('theta: ', theta);
                        theta := angle;
                end; {while}
end; {secant}

begin
	writeln('Enter initial velocity of the cannon: ');
        readln(V);
        readln;
        writeln('Enter the target distance: ');
        readln(target);
        secant;
        writeln('The angle is: ' , angle);
end.

