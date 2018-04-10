use <ring.scad>;

snap_ring(80,40,2);

module snap_tab( base, width, height){
    difference() {
        union() {
            cylinder( r1 =base, r2 = base+width, h = height);
            translate( [0,0,height] )cylinder( r1 =base+width, r2 = base, h = 3*height);
        }
        cylinder( r =base, h = 5*height);
    }
}

module snap_ring( diameter, height, thick) {
    snap_width = 5;
    snap_base = diameter;
    snap_height_unit = 5;
    ring( diameter, diameter-thick, h = height, center = true );
    translate( [0,0,height/2-4*snap_height_unit] ) snap_tab( snap_base, snap_width, snap_height_unit);

    rotate([180,0,0]) translate( [0,0,height/2-4*snap_height_unit] ) snap_tab( snap_base, snap_width, snap_height_unit);
}

