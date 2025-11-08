// PIRANHA iteration1
// LCD cover
// GNU GPL v3
// Usan Siriwardana <usiriwar@uwaterloo.ca> and contributors
// based on Prusa i3 MK3S
// https://reprap.org/wiki/Prusa_i3_MK3

$fn = 128;

difference(){
	// base
	union(){
		cube([11, 9.4, 12]);
		translate([11-1.5, 9.4, 0])cylinder(h = 12, r = 1.5);
	}
	// 1mm chamfer
	translate([-0.5, 12, 9.4 -1])rotate([45, 0, 0])cube([13, 5, 10]);
	
	// fillament hole
	translate([5.51, 6.15, -0.5])cylinder(h = 13, r = 1.2, center = false); 
	
	// ball bearing cavity
	translate([5.5, 2.95, 7.55]){
		rotate([90, 0, 0])cylinder(h=3, r=4);
		sphere(4);	
	}
}
