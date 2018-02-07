


cylinder(h = 20, r=3, $fn=50);
translate([0,0,-20]) {
    
    difference() {
        cylinder(h = 20, r=20);
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
