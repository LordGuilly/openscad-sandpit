
//$fn =100;

use <triad.scad>;
use <puck_cores.scad>;
use <snaps.scad>;


// Mk.001


puck_diameter = 81;
puck_height = 34;
puck_central_height = 28;
puck_bevel = 2;
wall_thick = 2;

/* male
difference() {
    union() {
        difference()
        {
            puck_cover( diameter=puck_diameter, bevel=puck_bevel, h2=puck_height, h1 = puck_central_height);
            translate([0,0,0])cylinder(r=puck_diameter,h=puck_height);
        }
        snap_ring(37,12,1, solid = true);
    }
    puck_lead_core(0);
    translate([0,0,-puck_height/2]) scale([1,1,0.5])import("stl_out/triad_ring.stl");
}*/
/* female
difference() {


    puck_cover( diameter=puck_diameter, bevel=puck_bevel, h2=puck_height, h1 = puck_central_height);
    translate([0,0,2])snap_ring(37.2,12.2,6, solid = false);
    translate([0,0,2])cylinder(r=puck_diameter,h=puck_height);
    puck_lead_core(0);
    translate([0,0,-puck_height/2]) scale([1,1,0.5])import("stl_out/triad_ring.stl");
}*/

/*
difference()
{
    puck_cover( diameter=puck_diameter, bevel=puck_bevel, h2=puck_height, h1 = puck_central_height);
    puck_lead_core(0.2);
    translate([0,0,1])cylinder(r=100,h=100);
    translate([0,0,-1])cylinder(r=10,h=100);
    translate([0,0,-puck_height/2])circle_triad( circle_radius = 20, hexagons_radius = 10, depth = 0.5);
}
*/
/*
difference()
{
    puck_cover( diameter=puck_diameter, bevel=puck_bevel, h2=puck_height, h1 = puck_central_height);
    puck_lead_core();
    translate([0,0,10.7])cylinder(r=100,h=100);

    difference(){
        cylinder( r = puck_diameter/2,h = puck_central_height-puck_bevel, center=true);
        cylinder( r = (puck_diameter/2-wall_thick),h = puck_central_height-puck_bevel, center=true);
    }
}
*/
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

