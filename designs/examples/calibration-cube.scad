/*
  calibration-cube.scad

  A simple printability reference object.
  Intended as a quick calibration and dimensional check for a 3D printer.
*/

$fn = 48;

cube_size = 30;
cutout_size = 18;
height = 15;
wall = 2.5;

module calibration_cube() {
    difference() {
        cube([cube_size, cube_size, height], center = true);
        translate([0, 0, 0])
            cube([cutout_size, cutout_size, height + 1], center = true);
    }
}

calibration_cube();
