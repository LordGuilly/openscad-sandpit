
$fn=40;

screw_diameter = 4;
hole_distance = 30;

base_depth = 5;
base_height = 10;
base_width = 20;

pedestal_width = 16;
pedestal_height = 20;
pedestal_depth = 10;

sensor_height = 16;
sensor_width = 10;
sensor_depth = 3;

union() {
    
    difference() {
        //pedestal
        translate([-pedestal_width/2,-base_width/2,0]) cube([pedestal_width,pedestal_depth,pedestal_height]);
        translate([-sensor_width/2,-base_width/2,0]) cube([sensor_width,sensor_depth,sensor_height]);
        translate([-sensor_width/2,-base_width/2,base_depth]) cube([sensor_width,base_width,sensor_depth]);
    }
    
    //base with holes
    difference() {
        hull() {
            translate([hole_distance/2,0,0]) cylinder(r=base_width/2,h= base_depth); 
            translate([-hole_distance/2,0,0]) cylinder(r=base_width/2,h=base_depth); 
        }
        translate([-hole_distance/2,0,0]) cylinder( r2=screw_diameter/2, r1=screw_diameter/2, h=base_depth);
        translate([hole_distance/2,0,0]) cylinder( r2=screw_diameter/2, r1=screw_diameter/2, h=base_depth);
    }
}