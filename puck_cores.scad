
puck_lead_core();

function lead_core_max_diameter() = 74;
function lead_core_middle_height() = 21.4;
//lead core, 1 piece
module puck_lead_core( offset_tolerance = 0 ) {

    core_rounded_radius = 1;
    core_outer_diameter = lead_core_max_diameter()-2*core_rounded_radius + offset_tolerance;
    core_inner_diameter = 63.6-2*core_rounded_radius + offset_tolerance;
    core_bevel_diameter = 50-2*core_rounded_radius + offset_tolerance;
    core_total_height = 28.2-2*core_rounded_radius + offset_tolerance;
    core_beveled_height = 27-2*core_rounded_radius + offset_tolerance;
    core_middle_height = lead_core_middle_height() + offset_tolerance;
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
                sphere(r=2*core_rounded_radius);        
            }
        }
        cylinder(r=core_central_hole_diameter/2, h = 2*core_total_height, center=true);
        
        for (i = [0,120,240]) {
                rotate(i) translate([core_outer_diameter/2,0,0])cylinder(r=core_edge_locks_diameter/2, h = core_total_height, center=true);
            }
        
    }
}
