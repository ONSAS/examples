

// sizes for another case: rInt = 0.05 ; rExt = 0.15 ;
Lx = 2 ; Ly = 1 ;

ms = .08 ; //

Point(1) = {  0, 0,  0, ms};
Point(2) = { Lx, 0,  0, ms};
Point(3) = { Lx, Ly, 0, ms};
Point(4) = {  0, Ly, 0, ms};
Point(5) = { Lx*.5, Ly*.0, 0, ms};
Point(6) = { Lx*.5, Ly*.4, 0, ms};
Point(7) = { Lx*.5, Ly*.6, 0, ms};
Point(8) = { Lx*.5, Ly*1, 0, ms};

Line(1) = {1, 5}; //
Line(2) = {5, 2}; //
Line(3) = {2, 3}; //
Line(4) = {3, 8}; //
Line(5) = {8, 4}; //
Line(6) = {4, 1}; //

Line(7) = {5, 6}; //
Line(8) = {6, 7}; //
Line(9) = {7, 8}; //

Line Loop(1) = {1, 7,8,9,5,6};
Line Loop(2) = {2, 3,4,-9,-8,-7};

Plane Surface(1) = {1};
Plane Surface(2) = {2};

Physical Line("00_01_01_00") = {1,2,3,4,5,6,8};

Physical Surface("01_02_02_00") = {1,2};
