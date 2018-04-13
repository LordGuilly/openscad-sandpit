use <triad.scad>;
use <puck_cores.scad>;
use <snaps.scad>;
use <puck.scad>

$fn = 20;

male = true;

// Mk.002
puck_diameter = 81;
puck_height = 34;
puck_central_height = 28;
puck_bevel = 2;
wall_thick = 2;
core_tolerance = 0;
parts_offset = 2;

if(male)
{
    difference() {
        union() {
            difference()
            {
                puck_cover( diameter=puck_diameter, bevel=puck_bevel, h2=puck_height, h1 = puck_central_height);
                translate([0,0,0])cylinder(r=puck_diameter,h=puck_height);
            }
            snap_ring(37,12,1, solid = true, locks = true);
        }
        puck_lead_core(core_tolerance);
        translate([0,0,-puck_height/2]) scale([1,1,0.5])import("stl_out/triad_ring.stl");
        translate([0,0,-parts_offset])cylinder(r=10,h=puck_height);
    }
}
else
{

    difference() {


        puck_cover( diameter=puck_diameter, bevel=puck_bevel, h2=puck_height, h1 = puck_central_height);
        translate([0,0,parts_offset])snap_ring(37.2,12.2,6, solid = false, locks=true);
        translate([0,0,parts_offset])cylinder(r=puck_diameter,h=puck_height);
        puck_lead_core(core_tolerance);
        translate([0,0,-puck_height/2]) scale([1,1,0.5])import("stl_out/triad_ring.stl");
    }
}
