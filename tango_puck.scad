use <triad.scad>;
use <puck_cores.scad>;
use <snaps.scad>;
use <puck.scad>;
use <ring.scad>;

$fn = 100;

male = false;

puck_diameter = 81;
puck_height = 34;
puck_central_height = 28;
puck_bevel = 2;
core_tolerance = 0;
core_offset = 0.5;
hole_tolerance = 0;
snap_ring_wall_thick = 1;
snap_ring_tolerance = 0.25;
snap_ring_height = 5;
o_ring_width_factor = 1.5;
o_ring_width = 2.5;
o_ring_offset = puck_central_height/4;
parts_offset = 0;
hole_offset = 3;
triads_scale = 1.1;
triads_depth = 0.7;
core_bevel = false;

//o_ring(inside_diameter=puck_diameter-o_ring_width,oring_width=o_ring_width);

core_version= LEAD_CORE_SIMMS_V1();

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
            snap_ring(lead_core_max_diameter(core_version)/2+snap_ring_wall_thick, snap_ring_height*2, snap_ring_wall_thick, solid = true, locks = true);
        }

        // carve the puck lead core
        translate([0,0,-core_offset]) rotate(60) puck_lead_core( offset_tolerance = core_tolerance, hole_tolerance = hole_tolerance, bevel = core_bevel, core_version = core_version);

        // carve logo        
        translate([0,0,-puck_height/2]) scale([triads_scale,triads_scale,triads_depth]) import("stl_out/triad_ring.stl");

        // remove part of the middle cylinder
        translate([0,0,-hole_offset]) cylinder(r=10,h=puck_height);
        //oring channels
        o_ring(inside_diameter=puck_diameter-o_ring_width_factor*o_ring_width,oring_width=o_ring_width);
        translate([0,0,-o_ring_offset]) o_ring(inside_diameter=puck_diameter-o_ring_width_factor*o_ring_width, oring_width=o_ring_width);
    }
}
else
{

    difference() {
        puck_cover( diameter=puck_diameter, bevel=puck_bevel, h2=puck_height, h1 = puck_central_height);
        translate([0,0,parts_offset]) {
            snap_ring(snap_ring_tolerance+lead_core_max_diameter(core_version)/2+snap_ring_wall_thick,snap_ring_height*2+snap_ring_tolerance,6, solid = false, locks=true);

            // keep the bottom half
            cylinder(r=puck_diameter,h=puck_height);
        }
        
        translate([0,0,-core_offset]) rotate(60) puck_lead_core(offset_tolerance = core_tolerance, hole_tolerance =hole_tolerance, bevel = core_bevel, core_version = core_version);
                
        translate([0,0,-puck_height/2]) scale([triads_scale,triads_scale,triads_depth])import("stl_out/triad_ring.stl");
        translate([0,0,-hole_offset]) cylinder(r=10,h=puck_height);
        
        //oring channels
        o_ring(inside_diameter=puck_diameter-o_ring_width_factor*o_ring_width,oring_width=o_ring_width);
        translate([0,0,-o_ring_offset]) o_ring(inside_diameter=puck_diameter-o_ring_width_factor*o_ring_width,oring_width=o_ring_width);
        
    }
}

