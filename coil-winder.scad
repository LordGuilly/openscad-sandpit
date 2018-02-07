include<MCAD/gears.scad>;

r1 = 10;
r2 = 2;

*rotate_extrude() translate([r1,0,0]) circle(r2);

gear(20, circular_pitch=200);
