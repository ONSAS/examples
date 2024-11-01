

// sizes for another case: rInt = 0.05 ; rExt = 0.15 ;
R = 25 ; Ly = R ;

cosang = 0.766044443118978; // cos(40*pi/180)
sinang = 0.642787609686539; // sin(40*pi/180)

ms = 1.5 ; //

Point(1) = {  R*sinang, 0 ,  R*(1-cosang), ms};
Point(2) = {  R*sinang, Ly,  R*(1-cosang), ms};
Point(3) = {  -R*sinang, Ly,  R*(1-cosang), ms};
Point(4) = {  -R*sinang, 0,  R*(1-cosang), ms};

Point(5) = {  0, 0, -R, ms};
Point(6) = {  0, Ly, -R, ms};

Line(1) = {1, 2}; //
Circle(2) = {2, 6, 3}; //
Line(3) = {3, 4}; //
Circle(4) = {4, 5, 1}; //

Line Loop(1) = {1, 2, 3, 4};

Surface(1) = {1};

Physical Line("00_01_01") = {1};
Physical Line("00_01_02") = {3};

Physical Surface("01_02_00") = {1};
