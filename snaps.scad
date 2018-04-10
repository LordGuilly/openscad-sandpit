use <ring.scad>;

snap_width = 5;
snap_base = 50;
snap_height_unit = 5;

cylinder( r1 =snap_base, r2 = snap_base+snap_width, h = snap_height_unit);
translate( [0,0,snap_height_unit] )cylinder( r1 =snap_base+snap_width, r2 = snap_base, h = 3*snap_height_unit);

ring( snap_base, snap_base-5, h = 50 );