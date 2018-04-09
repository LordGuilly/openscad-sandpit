$fn = 50;

offset_factor = 1.3;



circle_triad();

//triad();

module circle_triad(circle_radius = 50) {
for ( i = [ 30,90, 150, 210, 270,330 ] )
    translate( [circle_radius*cos(i), circle_radius*sin(i),0] ) rotate(i-30) triad(arc_radius=circle_radius);
}
module triad( hex_radius = 20, arc_radius = 40, depth = 2){
    triad_shift = [90,210,330];
    difference() {
        cylinder( r = hex_radius, h = depth, $fn = 6);
        for (i = triad_shift) {
            translate([offset_factor*arc_radius*cos(i), offset_factor*arc_radius*sin(i),0]) cylinder(r = arc_radius, h = depth);
        }
    }
}

