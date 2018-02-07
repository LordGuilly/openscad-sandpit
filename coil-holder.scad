
rm_height = 20;
rm_diameter = 6;

base_height = 20;
base_diameter = 20;

cylinder(h = rm_height, r=(rm_diameter)/2, $fn=50);

translate([0,0,-rm_height]) {
    
   difference() {
        cylinder(h = base_height, r=(base_diameter/2));
        translate([-10,0,0]) {
            cylinder(h = 40, r=1,$fn=20);
        }
        translate([-8,2,0]) {
            cylinder(h = 40, r=1,$fn=20);
        }
        translate([-8,-2,0]) {
            cylinder(h = 40, r=1,$fn=20);
        }
        translate([10,0,0]) {
            cylinder(h = 40, r=1,$fn=20);
        }
        translate([8,2,0]) {
            cylinder(h = 40, r=1,$fn=20);
        }
        translate([8,-2,0]) {
            cylinder(h = 40, r=1,$fn=20);
        }
    }
}
