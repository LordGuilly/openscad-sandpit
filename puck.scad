
$fn = 100;



difference()
{
    puck_cover( contact_diameter=30);
    puck_lead_core();
    cylinder(r=100,h=100);
}

//puck, 1 piece
module puck_cover( diameter = 81, contact_diameter = 60, h1 = 30, h2 = 34, bevel = 2 ) {
    main_diameter = diameter-2*bevel;
    central_height = h1-2*bevel;
    total_height = h2-2*bevel;

    minkowski()
    {
        union()
        {
            cylinder(r = main_diameter/2, h = central_height, center =true);
            translate([0,0,central_height/2]) cylinder( r2 = (contact_diameter)/2,r1=main_diameter/2, h = (total_height- central_height)/2);
            translate([0,0,-total_height/2]) cylinder( r1 = (contact_diameter)/2,r2=main_diameter/2, h = (total_height- central_height)/2);
        }

        sphere(r=bevel,center=true);        
    }
}

//lead core, 1 piece
module puck_lead_core( offset_tolerance = 0 ) {

    core_rounded_diameter = 2;
    core_outer_diameter = 74 -core_rounded_diameter + offset_tolerance;
    core_inner_diameter = 63.6-core_rounded_diameter + offset_tolerance;
    core_bevel_diameter = 50-core_rounded_diameter + offset_tolerance;
    core_total_height = 28.2-core_rounded_diameter + offset_tolerance;
    core_beveled_height = 27-core_rounded_diameter + offset_tolerance;
    core_middle_height = 21.4 + offset_tolerance;
    core_central_hole_diameter = 7.5;
    core_edge_locks_diameter=1.5 + offset_tolerance;

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
}
