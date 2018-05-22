$fn= 100;
use <ring.scad>;

piezo_od = 43;
piezo_id = 23;

horn_length = 100;
holder_length = 20;

function radius(diameter) = diameter/2;


//pipe
ring (radius(piezo_id)+1,radius(piezo_id),horn_length);
ring (radius(piezo_od)+1,radius(piezo_od),holder_length, true);
translate([0,0,holder_length/2]){ ring (radius(piezo_od)+1,radius(piezo_id),2);}
