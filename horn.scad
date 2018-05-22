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
x_axis = [0:0.1:horn_length];
exp_points = [ for( i = [0:.5:horn_length] ) [i,exp(i/ (horn_length/4))] ];
    
//points = [ for (a = [0 : 2 : 270]) 20 * [ sin(a), cos(a) ] ];

//polygon( points = concat( exp_points,[[horn_length,1]]) );
//for( i = [0:1:20] ) { echo(concat(i,i)); }
//echo(concat([3, 4, "5", 6], "test"));	
rotate_extrude()
rotate(90)polygon( points = concat( exp_points,[[horn_length,1]]) );
//exponential horn
//polygon( points=[[0,0],[2,1],[1,2],[1,3],[3,4],[0,5]] );
 

//rotate_extrude($fn=200) polygon( points=[[0,0],[2,1],[1,2],[1,3],[3,4],[0,5]] );
