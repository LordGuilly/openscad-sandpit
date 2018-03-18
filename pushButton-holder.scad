$fn = 200;

pipe_diameter = 50;
holder_length = 70;
holder_height = 4;

nut_diameter = 16.5;
nut_hole_height = 4;

pb_hole_diameter = 12;
top_oring_diameter = 14;
top_oring_depth = 1;

curve_radius = pipe_diameter/2;

difference(){
    
translate([0,0,-(curve_radius-holder_height)]) difference() {
    rotate([0 ,90, 0]) cylinder( r = curve_radius, h = holder_length);
    translate([0,-curve_radius,-curve_radius]) cube( size = [holder_length, pipe_diameter, pipe_diameter-holder_height]);
}

translate([holder_length/2,0,0]) {
    //nut holder
    rotate([0,0,30]) cylinder( r=nut_diameter/2, h = nut_hole_height, $fn=6);
    //main hole
    cylinder( r = pb_hole_diameter/2,h = holder_height);
    /*internal oring
    translate([0,0,holder_height-top_oring_depth])
    cylinder( r = top_oring_diameter/2,h = top_oring_depth);
    */
}
/*
    intersection() {
        difference() {
            translate([0,0,-(curve_radius-holder_height)]) 
                difference() {
                    rotate([0 ,90, 0]) cylinder( r = curve_radius, h = holder_length);
                    rotate([0 ,90, 0]) cylinder( r = curve_radius-top_oring_depth, h = holder_length);
                };
            }
        translate([holder_length/2,0,0]) 
            cylinder( r = top_oring_diameter/2,h = holder_height);
        }
*/
 }


