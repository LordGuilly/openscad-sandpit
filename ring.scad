
//ring( 15,10,5,true);
function ring_const() = 5;
module ring(r1, r2, h, center = false) {
    difference() {
        cylinder(r = r1, h = h, center = center);
        translate([ 0, 0, -1 ]) cylinder(r = r2, h = h+2, center = center);
    }
}


o_ring(inside_diameter=79,oring_width=3);

module o_ring( inside_diameter, outside_diameter) {
    color("red"){
        rotate_extrude(){
            translate([(inside_diameter+oring_width)/2, 0]){
                circle(oring_width/2);
            }
        }
    }    
}


