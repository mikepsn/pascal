program OilDrop (input, output);

{ uses wincrt; } 

const
	g = 9.8; 	{acceleration due to gravity}
        m = 0.02;       {mass of ball in kg}
        r = 0.005;	{radius of ball}
        k = 10.0;	{oil constant}
        Ar = 7.854e-5;	{cross sectional area}

var
	a : real;	{acceleration}
        t : real;	{time interval dt}
        u : real;   	{initial velocity}
        v : real; 	{final velocity}
        s : real;	{distance travelled in time dt}
        d : real;	{height from which ball is dropped}
        f : real;	{frictional force - f = kAr(v*v)}

procedure velocity;
begin
	v := u + g*t;
end; {velocity}

procedure distance;
begin
	s := v*t + 0.5*a*(t*t);
end; {distance}

procedure friction;
begin
	f := k*Ar*(v*v);
end; {friction}

procedure newVelocity;
begin
	v := v + (g - f)*t;
end; {newVelocity}

begin {main}
	write('Enter the height (>0) from which you wish to drop the ball from: ');
        readln(d);
        a := 0;
        t := 0;
        u := 0;
        v := 0;
        s := 0;
        f := 0;
        velocity;
        s := u*t + 0.5*a*(t*t);
        friction;
        newVelocity;
        	while s < d do begin
                        a := g - f;
                	t := t + 0.01;
                        distance;
                        friction;
                        newVelocity;
                end; {while}
        writeln('The time to reach the bottom of the cylinder is: ',t:1:5, ' sec');
end. {main}




