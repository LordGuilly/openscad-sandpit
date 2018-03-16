$fn = 50;

pipe_diameter = 50;
holder_length = 
30;
holder_height = 6;

nut_diameter = 16;
nut_hole_height = holder_height/2;

pb_hole_diameter = 13.6;
top_oring_diameter = 15;
top_oring_depth = 1;

curve_radius = pipe_diameter/2;

difference(){
    
translate([0,0,-(curve_radius-holder_height)]) difference() {
    rotate([0 ,90, 0]) cylinder( r = curve_radius, h = holder_length);
    translate([0,-curve_radius,-curve_radius]) cube( size = [holder_length, pipe_diameter, pipe_diameter-holder_height]);
}

translate([holder_length/2,0,0]) {
    rotate([0,0,30])cylinder( r=nut_diameter/2, h = nut_hole_height, $fn=6);
    cylinder( r = pb_hole_diameter/2,h = holder_height);
    translate([0,0,holder_height-top_oring_depth])
    cylinder( r = top_oring_diameter/2,h = top_oring_depth);
}
}