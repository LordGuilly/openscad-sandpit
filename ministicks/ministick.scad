

content= "Matthew";
font1 = "Dyuthi";
//font1 = "Chewy";


difference() {
    import("ministick.stl");

    linear_extrude(height = 1) 
    text(content, font = font1, size = 6, direction = "ltr", halign = "left",valign = "center", spacing = 1, center = true );
}