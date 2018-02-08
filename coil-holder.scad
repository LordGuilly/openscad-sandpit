include <MCAD/constants.scad>;

rm_height = 20;
rm_diameter = 6;

pin_position =  [ [ -0.25 * mm_per_inch, -0.25 * mm_per_inch, 0] ,
                  [ -0.25 * mm_per_inch, 0.25 * mm_per_inch, 0] ,
                  [ -0.15 * mm_per_inch, 0.25 * mm_per_inch, 0] ,
                  [ -0.25 * mm_per_inch, 0.15 * mm_per_inch, 0] ,
                  [ 0.25 * mm_per_inch, -0.25 * mm_per_inch, 0] ,
                  [ 0.15 * mm_per_inch, -0.25 * mm_per_inch, 0] ,
                  [ 0.25 * mm_per_inch, -0.15 * mm_per_inch, 0] ,
                  [ 0.25 * mm_per_inch, 0.25 * mm_per_inch, 0] ];

base_height = 20;
base_diameter = 25;
base_radius = base_diameter/2;

hole_diameter = 1;
hole_radius = (hole_diameter/2);

belt_radius = 1;


magnet_radius = 1.2;
magnet_depth = 1;

$fn=50;


union() {

    //peg    
    cylinder(h = rm_height, r=(rm_diameter)/2);

    translate([0,0,-rm_height]) {
        
       difference() {
            // main body
            cylinder(h = base_height, r=base_radius);

            // belt channel
            rotate_extrude() translate([base_diameter/2, base_height/4, 0]) circle(belt_radius);
            
           // axis hole
            cylinder(h = base_height/2, r = 1, $fn=20);
           //magnets
           for( i = [1:4] ) {
                rotate([0,0,90*i]) translate([base_radius-magnet_depth,0,base_height/2]) {
                    rotate([0,90,0]) cylinder(h=magnet_radius,r=magnet_depth);
                }
            }

           
            // coil former holes
            for( i = [0:len(pin_position)-1] ) {
                translate(pin_position[i]) {
                    cylinder(h = base_height, r = hole_radius);
                }
            }
        }
    }
}