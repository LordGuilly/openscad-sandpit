
$fn = 50;

total_height = 34;


bevel =  2;
bisel = 20;
main_diameter = 81;
central_height = 30;


/*
//puck, 1 piece
minkowski(){
    union(){
    cylinder(r = main_diameter/2, h = central_height, center =true);
    translate([0,0,central_height/2]) cylinder( r2 = (main_diameter-bisel)/2,r1=main_diameter/2, h = (total_height- central_height)/2);
    translate([0,0,-total_height/2]) cylinder( r1 = (main_diameter-bisel)/2,r2=main_diameter/2, h = (total_height- central_height)/2);
    }

    sphere(r=bevel,center=true);        
}
*/
core_rounded_diameter=2;
core_outer_diameter = 74-core_rounded_diameter;
core_inner_diameter = 63.6-core_rounded_diameter;
core_bevel_diameter = 50-core_rounded_diameter;
core_total_height = 28.2-core_rounded_diameter;
core_beveled_height = 27-core_rounded_diameter;
core_middle_height = 21.4;
core_central_hole_diameter = 7.5;
core_edge_locks_diameter=1.5;

difference(){
    union(){    
        cylinder(r = core_outer_diameter/2, h = core_middle_height, center =true);
        minkowski(){
            union() {
                cylinder(r = core_inner_diameter/2, h = core_beveled_height, center =true);
                translate([0,0,core_beveled_height/2]) cylinder(r1 = core_inner_diameter/2, r2=core_bevel_diameter/2, h = (core_total_height-core_beveled_height)/2);
                translate([0,0,-core_total_height/2]) cylinder(r2 = core_inner_diameter/2, r1=core_bevel_diameter/2, h = (core_total_height-core_beveled_height)/2);
            }
            sphere(r=core_rounded_diameter/2);        
        }
    }
    cylinder(r=core_central_hole_diameter/2, h = 2*core_total_height, center=true);
    translate([core_outer_diameter/2,0,0])cylinder(r=core_edge_locks_diameter/2, h = core_total_height, center=true);
    rotate([0,0,120])translate([core_outer_diameter/2,0,0])cylinder(r=core_edge_locks_diameter/2, h = core_total_height, center=true);
    rotate([0,0,240])translate([core_outer_diameter/2,0,0])cylinder(r=core_edge_locks_diameter/2, h = core_total_height, center=true);
}