#!/bin/sh

openscad -o stl_out/tango_puck_experimental_male.stl -D male=true tango_puck_stlcores.scad
openscad -o stl_out/tango_puck_experimental_female.stl -D male=false tango_puck_stlcores.scad
