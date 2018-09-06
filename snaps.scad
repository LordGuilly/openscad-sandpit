use <ring.scad>;

//cube( [2,2,30], center = true);
snap_ring(20,30,1,solid=false, locks=true);
//snap_tab(20,1,1,solid=true, locks=true);
module snap_tab( base, width, height, factor = 4, thick = 1){
    difference() {
        union() {
            cylinder( r1 =base, r2 = base+width, h = height);
            translate( [0,0,height] )cylinder( r1 =base+width, r2 = base, h = (factor-1)*height);
        }
        cylinder( r =base-thick, h = 5*height);
    }
}


module snap_ring( radius, height, thick, factor = 4, solid = false, locks = false ) {
    snap_width = 1;
    snap_base = radius;
    snap_height_unit = 1;
    
    difference() {
        union() {
        if (solid==false)
        {
            ring( radius, radius-thick, h = height, center = true );
        }
        else
        {
            cylinder( r= radius, h = height, center = true);
        }
        translate( [0,0,height/2-factor*snap_height_unit] ) snap_tab( snap_base, snap_width, snap_height_unit, factor);

        rotate([180,0,0]) translate( [0,0,height/2-factor*snap_height_unit] ) snap_tab( snap_base, snap_width, snap_height_unit, factor);
        }
        if (locks==true) {
            for (i = [60,180,300]) {
                rotate(i) translate([radius,0,0]) cube( [20,5,height+1], center=true );
            }
        }
    }
}

