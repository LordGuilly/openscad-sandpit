$fn = 50;

use <ring.scad>;
/*
TODO: there is a ratio between the circle_radius and hexagon_radius,
such circle_radius= sqrt(3/4)*hexagon_radius*2 
write one as function of the other
*/
central_radius = 20;
circle_triad( circle_radius = central_radius, hexagons_radius = 10);

module circle_triad(circle_radius = 30, hexagons_radius = 20, depth = 1) {
for ( i = [ 30,90, 150, 210, 270,330 ] )
    rotate(i) translate( [circle_radius,0,0] ) rotate(-30)
        triad(arc_radius=circle_radius*0.8, hex_radius = hexagons_radius, depth = depth);
}
module triad( hex_radius = 20, arc_radius = 40, depth = 1, internal_distance = 0.75, internal_width = 1.5){
    triad_shift = [90,210,330];
    difference() {
        cylinder( r = hex_radius, h = depth, $fn = 6);
        for (i = triad_shift) {
            rotate(i) {
                translate([ 0.5*hex_radius +arc_radius ,0,0])cylinder(r = arc_radius, h = depth);
                translate([ 0.5*hex_radius +arc_radius ,0]) ring(r1 = arc_radius + internal_width,r2 = arc_radius + internal_distance, h = depth);
            }
            
        }
    }
}

