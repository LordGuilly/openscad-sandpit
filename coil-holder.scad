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
base_diameter = 30;

hole_diameter = 1;
hole_radius = (hole_diameter/2);

belt_radius = 1;


cylinder(h = rm_height, r=(rm_diameter)/2, $fn=50);

translate([0,0,-rm_height]) {
    
   difference() {
        // main body
        cylinder(h = base_height, r=(base_diameter/2));

        // belt channel
        rotate_extrude() translate([base_diameter/2, base_height/4, 0]) circle(belt_radius);

        // coil former holes
        for( i = [0:len(pin_position)-1] ) {
            translate(pin_position[i]) {
                cylinder(h = base_height, r = hole_radius, $fn=20);
            }
        }
    }
}
