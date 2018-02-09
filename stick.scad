$fn = 40;
*minkowski() {
    cube([10,10,20], center=true);
    cylinder(r=5,h=5,center=true);
}

polygon( points = [[0,0], [1,2], [3,2],[4,0] ]);
