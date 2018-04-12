use <snaps.scad>;

//difference() 
{
    import( "tango_half.stl" );
    snap_ring (37,20,1, $fn=100);
}