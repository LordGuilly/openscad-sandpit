
//ring( 15,10,5,true);

module ring(r1, r2, h, center = false) {
    difference() {
        cylinder(r = r1, h = h, center = center);
        translate([ 0, 0, -1 ]) cylinder(r = r2, h = h+2, center = center);
    }
}


