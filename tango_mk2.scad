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
parts_offset = 1;

if(male)
{
    difference() {
        union() {
            difference()
            {
                puck_cover( diameter=puck_diameter, bevel=puck_bevel, h2=puck_height, h1 = puck_central_height);
                translate([0,0,0])cylinder(r=puck_diameter,h=puck_height);
            }
            snap_ring(lead_core_max_diameter()/2,12,1, solid = true, locks = true);
        }
        puck_lead_core(core_tolerance,false);
        translate([0,0,-puck_height/2]) scale([1,1,0.5])import("stl_out/triad_ring.stl");
        translate([0,0,-parts_offset])cylinder(r=10,h=puck_height);
    }
}
else
{

    difference() {


        puck_cover( diameter=puck_diameter, bevel=puck_bevel, h2=puck_height, h1 = puck_central_height);
        translate([0,0,parts_offset])snap_ring(0.2+lead_core_max_diameter()/2,12.2,6, solid = false, locks=true);
        translate([0,0,parts_offset])cylinder(r=puck_diameter,h=puck_height);
        puck_lead_core(core_tolerance);
        translate([0,0,-puck_height/2]) scale([1,1,0.5])import("stl_out/triad_ring.stl");
    }
}
