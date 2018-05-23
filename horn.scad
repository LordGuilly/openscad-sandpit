$fn= 100;
use <ring.scad>;

piezo_od = 43;
piezo_id = 23;

horn_length = 100;
holder_length = 20;

function radius(diameter) = diameter/2;

/*
//pipe
ring (radius(piezo_id)+1,radius(piezo_id),horn_length);
ring (radius(piezo_od)+1,radius(piezo_od),holder_length, true);
translate([0,0,holder_length/2]){ ring (radius(piezo_od)+1,radius(piezo_id),2);}

*/

//exponential horn
module exponential_horn(initial_diameter, length, m_factor, thick = 2, steps = 1) { 

x_axis = [0:steps:length];

exp_internal_points = concat( [ for( i = x_axis ) [i,(initial_diameter)*exp(i*m_factor/ (length))] ], [ [length,0],[0,0]] );
exp_external_points = concat( [ for( i = x_axis ) [i,(initial_diameter+thick)*exp(i*m_factor/ (length))] ], [ [length,0],[0,0]] );


rotate_extrude()
difference() {
    
        rotate(90)
            polygon( points = exp_external_points);

    
        rotate(90)
            polygon( points = exp_internal_points);

    }
}

exponential_horn( piezo_id, horn_length, 1);