program stage2 (input, output);

{ uses wincrt; } 

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
	k = 0.6;
        area = 0.2;
        m = 90.0;
        dt = 0.1;
var
       vx, vx2, vy, vy2, f, fx, fy, x, y, alpha, Vel : real;
begin
	vx := 0; vx2 := 0; vy := 0; vy2 := 0; fx := 0; f := 0; fy := 0; x := 0;

        vx2 := V*cos(theta);
        vy2 := V*sin(theta);
        while y > 0 do begin
                vx := vx2;
                vy := vy2;
                Vel := sqrt(sqr(vx) + sqr(vy));
                f := k*area*sqr(Vel);
                fx := -f*Vel*cos(theta);
                fy := -m*g-f*Vel*sin(theta);
                vx2 := vx + fx*dt/m;
                vy2 := vy + fy*dt/m;
                x := x + dt*(vx2+vx)/2 ;
                y := y + dt*(vy2+vy)/2;
                {writeln(y:1:3);}
                {writeln('x is : ',x:1:3); }
        end; {while}
        x := x - target; 
        distance := x;
end; {distance}


function angle(V, target: real): real; {calculates angle using secant method}
const
	accuracy = 1e-1;   	{ distance calculated to accuracy of 0.1 metres }

var
	theta1, theta2,
        distance1, distance2 : real;
        iterations : integer;
begin
	theta1 := cdr(0); 			{ initial estimate }
        theta2 := cdr(40);	 		{ initial estimate }
        theta := theta2;
        iterations := 0;
               	while (abs(distance(V, theta)) > accuracy) and (iterations < 20) do begin
                	distance2 := distance(V, theta2);
                        distance1 := distance(V, theta1);
                        	if distance2 = distance1 then begin
                        	distance2 := distance1 + 1;
                                end;
                        theta := (theta1*distance2-theta2*distance1)/(distance2-distance1);
                        iterations := iterations + 1;
                        { current estimates become old estimates }
                        	theta2 := theta1;
                        	theta1 := theta;
			writeln('angle: ', theta:1:3);
                        writeln(iterations);
                        writeln('distance: ',distance(V,theta):1:3);
                end; {while}
                angle := theta;
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

