program stage2 (input, output);

uses wincrt;

const
	g = 9.81; 	{ acceleration due to gravity}

var
	V : real;	{ initial velocity }
        theta : real; 	{ launch angle in radians }
        t : real;	{ time of flight }
        x : real;	{ horizontal distance }
        target : real; 	{ target distance }

function cdr(alpha : real): real; { Converts Degress to Radians }
const
	pi = 3.141592654;
begin
	cdr := alpha * pi/180;
end; {cdr}

function crd(alpha : real): real; { Converts Radians to Degrees }
const
	pi = 3.141592654;
begin
	crd := alpha * 180/pi;
end; {crd} 

{function distance(V, theta: real): real;
begin
	t := (2*V*sin(theta))/g;
	distance := t*V*cos(theta) - target;
end; distance}

function distance(V, theta: real): real;
const
	g = 9.81;
        k = 0.6;
        area = 0.2;
        m = 90.0;
var
       vx, vx2, vy, vy2, fx, fy, x, y, y2, x2, alpha, dt : real;
begin
	vx := 0; vx2 := 0; vy := 0; vy2 := 0; fx := 0; fy := 0; x := 0;
        
        {V := sqrt(sqr(vx) + sqr(vy));}
	while y > 0 do begin
        	dt := dt + 0.1;
        	vx := V*cos(theta);
                vy := V*sin(theta);
                {alpha := arctan((x + (dt*(vx + vx2))/2 - target)
                	/(y + (dt*(vy + vy2))/2));}
		fx := -1*k*area*(V*V);
        	fy := -1*m*g;
	        vx2 := vx + (fx*dt)/m;
        	vy2 := vy + (fy*dt)/m;
                V := sqrt(sqr(vx) + sqr(vy));
	        x := x + (dt*(vx + vx2))/2 - target;
        	y := y + (dt*(vy + vy2))/2;
                x2 := x; y2 := y;
                vx := vx2; vy := vy2;
                distance := x; writeln(y:1:3); writeln(' x is: ', x:1:3);
	end; {while}
end; {distance}

function angle(V, target: real): real; { calculates angle using secant method}
const
	accuracy = 1e-1;   	{ distance calculated to accuracy of 0.1 metres }

var
	theta, theta1, theta2,
        distance1, distance2 : real;
        iterations : integer;
begin
	theta := cdr(0); 			{ initial estimate }
        theta1 := cdr(40);	 		{ initial estimate }
        iterations := 0;
        distance1 := distance(V, theta1);
        	while (abs(distance1) > accuracy) and (iterations < 100) do begin
                        iterations := iterations + 1;
                        { current estimates become old estimates }
                        	theta2 := theta1;
                        	theta1 := theta;
                        	distance2 := distance1;
                        { calculate the new estimates }
                        distance1 := distance(V, theta1);
                        theta := (theta1*distance2-theta2*distance1)/(distance2-distance1);
                        angle := theta;   writeln('angle: ', theta); writeln(iterations);
                end; {while}
end; {angle}

begin
        writeln;
	writeln('          ***** JOE THE HUMAN CANNONBALL *****');
	writeln;
	write('Enter Joe''s initial velocity in metres per second: ');
        readln(V);
        readln;
        write('Enter the target distance in metres: ');
        readln(target);
        theta := angle(V, target);
        writeln;
        writeln('Therefore for the following conditions: ');
        writeln('Initial velocity = ', V:1:2, ' metres/sec');
        writeln('Target distance = ', target:1:2, ' metres');
        writeln;
        writeln('The angle theta = ', crd(theta):1:2, ' degrees');
end.

