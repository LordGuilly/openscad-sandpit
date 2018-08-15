
puck_lead_core(bevel = false, core_version = 1);


core_measures = [ //max_diameter, middle_height, inner_diameter, hole_diameter
                    [ 74,   21.4,   63.6 , 7.5],  // SIMMS V1
                    [ 72.3, 21.2,   64.4 , 7.5],  // SIMMS V2
                   ];
                    
function LEAD_CORE_SIMMS_V1() = 0;
function LEAD_CORE_SIMMS_V2() = 1;
/*  
//SIM V1
function lead_core_max_diameter() = 74;
function lead_core_middle_height() = 21.4;
function lead_core_inner_diameter() = 63.6;;

//SIM V2
function lead_core_max_diameter() = 72.3;
function lead_core_middle_height() = 21.2;
function lead_core_inner_diameter() = 64.4;
*/
function lead_core_max_diameter(version) = core_measures[version][0];
function lead_core_max_radius(version) = core_measures[version][0]/2;

function lead_core_middle_height(version) =  core_measures[version][1];

function lead_core_inner_diameter(version) =  core_measures[version][2];
function lead_core_inner_radius(version) =  core_measures[version][2]/2;

function lead_core_hole_diameter(version) =  core_measures[version][3];
function lead_core_hole_radius(version) =  core_measures[version][3]/2;

//lead core, 1 piece
module puck_lead_core( offset_tolerance = 0, bevel = true, core_version = LEAD_CORE_SIMMS_V2()  ) {

    core_rounded_radius = 1;
    core_outer_diameter = lead_core_max_diameter( core_version ) - 2*core_rounded_radius + offset_tolerance;
    core_inner_diameter = lead_core_inner_diameter( core_version ) - 2*core_rounded_radius + offset_tolerance;
    core_bevel_diameter = 50 - 2*core_rounded_radius + offset_tolerance;
    core_total_height   = 28.2 - 2*core_rounded_radius + offset_tolerance;
    core_beveled_height = 27 - 2*core_rounded_radius + offset_tolerance;
    core_middle_height  = lead_core_middle_height( core_version ) + offset_tolerance;
    core_central_hole_diameter = lead_core_hole_diameter( core_version ) + offset_tolerance;
    core_edge_locks_diameter = 1.5 + offset_tolerance;

    difference(){
        union(){    
            cylinder(r = core_outer_diameter/2, h = core_middle_height, center =true);
            minkowski() {
                if ( bevel==true ) {
                    union() {
                        cylinder(r = core_inner_diameter/2, h = core_beveled_height, center =true);
                        translate([0,0, core_beveled_height/2])  cylinder(r1 = core_inner_diameter/2, r2=core_bevel_diameter/2, h = (core_total_height-core_beveled_height)/2);
                        translate([0,0,-core_total_height/2])   cylinder(r2 = core_inner_diameter/2, r1=core_bevel_diameter/2, h = (core_total_height-core_beveled_height)/2);
                    }
                }
                else
                {
                    cylinder(r = core_inner_diameter/2, h = core_total_height, center =true);
                }
                sphere(r=2*core_rounded_radius);        
            }
        }
        cylinder(r=core_central_hole_diameter/2, h = 2*core_total_height, center=true);
        
        for (i = [0,120,240]) {
                rotate(i) translate([core_outer_diameter/2,0,0]) cylinder(r=core_edge_locks_diameter/2, h = core_total_height, center=true);
            }
        
    }
}
