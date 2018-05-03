use <triad.scad>;
use <puck_cores.scad>;
use <snaps.scad>;
use <puck.scad>

$fn = 100;

male = false;

// Mk.002
puck_diameter = 81;
puck_height = 34;
puck_central_height = 28;
puck_bevel = 2;
wall_thick = 2;
core_tolerance = 0;
snap_ring_tolerance = 0.2;

parts_offset = 1;

triads_depth = 0.7;
core_bevel = false;

core_version= LEAD_CORE_SIMMS_V2();
if(male)
{
    difference() {
        union() {
            //keep the bottom half
            difference()
            {
                puck_cover( diameter=puck_diameter, bevel=puck_bevel, h2=puck_height, h1 = puck_central_height);
                translate([0,0,0]) cylinder(r=puck_diameter,h=puck_height);
            }
            // add the snap ring, 12mm height
            snap_ring(lead_core_max_diameter()/2, 12, 1, solid = true, locks = true);
        }

        // carve the puck lead core
        rotate(60) puck_lead_core(core_tolerance,core_bevel);

        // carve logo        
        translate([0,0,-puck_height/2]) scale([1,1,triads_depth]) import("stl_out/triad_ring.stl");

        // remove part of the middle cylinder
        translate([0,0,-parts_offset]) cylinder(r=10,h=puck_height);
    }
}
else
{

    difference() {


        puck_cover( diameter=puck_diameter, bevel=puck_bevel, h2=puck_height, h1 = puck_central_height);
        translate([0,0,parts_offset]) snap_ring(snap_ring_tolerance+lead_core_max_diameter()/2,12.2,6, solid = false, locks=true);
        translate([0,0,parts_offset]) cylinder(r=puck_diameter,h=puck_height);
        rotate(60) puck_lead_core(core_tolerance,core_bevel);
        translate([0,0,-puck_height/2]) scale([1,1,triads_depth])import("stl_out/triad_ring.stl");
        translate([0,0,-parts_offset])cylinder(r=10,h=puck_height);
    }
}
