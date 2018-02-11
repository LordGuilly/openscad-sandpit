
$fn = 50;

total_height = 34;


bisel =  20;
main_diameter = 81;
central_height = 30;



cylinder(r = main_diameter/2, h = central_height, center =true);
translate([0,0,central_height/2]) cylinder( r2 = (main_diameter-bisel)/2,r1=main_diameter/2, h = (total_height- central_height)/2);
translate([0,0,-total_height/2]) cylinder( r1 = (main_diameter-bisel)/2,r2=main_diameter/2, h = (total_height- central_height)/2);