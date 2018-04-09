$fn = 50;

depth = 2;
hex_radius = 20;
radius = 40;
offset_factor = 1.3;
triad_shift = 30;
shift_armonics = [3,7,11];



difference() {
cylinder( r = hex_radius, h = depth, $fn = 6);
    for (i = shift_armonics) {
        translate([offset_factor*radius*cos(i*triad_shift), offset_factor*radius*sin(i*triad_shift),0]) cylinder(r = radius, h = depth);
    }
}
    /*
translate([offset_factor*radius*cos(11*triad_shift), offset_factor*radius*sin(11*triad_shift),0]) cylinder(r = radius, h = depth);
translate([offset_factor*radius*cos(3*triad_shift), offset_factor*radius*sin(3*triad_shift),0]) cylinder(r = radius, h = depth);
translate([offset_factor*radius*cos(7*triad_shift), offset_factor*radius*sin(7*triad_shift),0]) cylinder(r = radius, h = depth);
}*/

