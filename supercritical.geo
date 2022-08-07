
Include "airfoil.geo";
//+

ymax = 4;
xmax = 10;
n_inlet = 60;
n_vertical = 90;
r_vertical = 1/0.95;
n_airfoil = 50;
n_wake = 100;
r_wake = 1/0.95;

//+
Point(129) = {-0.5, ymax, 0, 1.0};
//+
Point(130) = {-0.5, -ymax, 0, 1.0};
//+
Point(131) = {1, ymax, 0, 1.0};
//+
Point(132) = {1, -ymax, 0, 1.0};
//+
Point(133) = {xmax, ymax, 0, 1.0};
//+
Point(134) = {xmax, -ymax, 0, 1.0};
//+
Point(135) = {xmax, 0, 0, 1.0};
//+
Circle(2) = {130, 64, 129};
//+
Line(3) = {57, 129};
//+
Line(4) = {71, 130};
//+
Line(5) = {129, 131};
//+
Line(6) = {130, 132};
//+
Line(7) = {131, 133};
//+
Line(8) = {132, 134};
//+
Line(9) = {135, 134};
//+
Line(10) = {135, 133};
//+
Line(11) = {128, 131};
//+
Line(12) = {128, 132};
//+
Line(13) = {128, 135};
//+
Split Curve {1} Point {57, 71};
//+
Split Curve {15} Point {128};
//+
Transfinite Curve {2, 14} = n_inlet Using Progression 1;
//+
Transfinite Curve {3, 11, 10, 4, 12, 9, 9} = n_vertical Using Progression r_vertical;
//+
Transfinite Curve {17, 16} = n_airfoil Using Bump 0.1;
//+
Transfinite Curve {5, 6} = n_airfoil Using Bump 2;
//+
Transfinite Curve {13} = n_wake Using Progression r_wake;
//+
Transfinite Curve {7, 8} = n_wake Using Bump 0.2;
//+
Curve Loop(1) = {2, -3, 14, 4};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {3, 5, -11, 17};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {11, 7, -10, -13};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {4, 6, -12, -16};
//+
Plane Surface(4) = {4};
//+
Curve Loop(5) = {12, 8, -9, -13};
//+
Plane Surface(5) = {5};
//+
Transfinite Surface {1};
//+
Transfinite Surface {2};
//+
Transfinite Surface {3};
//+
Transfinite Surface {5};
//+
Transfinite Surface {4};
//+
Recombine Surface {1, 2, 3, 5, 4};
//+
Extrude {0, 0, 0.2} {
  Surface{1}; Surface{2}; Surface{3}; Surface{4}; Surface{5}; Layers {1}; Recombine;
}
//+
Physical Volume("Fluid", 128) = {1, 2, 3, 5, 4};
//+
Physical Surface("Inlet", 129) = {26, 52, 74, 96, 118};
//+
Physical Surface("Outlet", 130) = {78, 122};
//+
Physical Surface("Airfoil", 131) = {60, 104, 34};
//+
Physical Surface("Side", 132) = {83, 127, 105, 39, 61, 1, 2, 3, 5, 4};
