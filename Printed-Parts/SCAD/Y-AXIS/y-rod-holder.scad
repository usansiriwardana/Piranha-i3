// PIRANHA iteration1
// y rod holder
// GNU GPL v3
// Usan Siriwardana <usiriwar@uwaterloo.ca> and contributors
// based on Prusa i3 MK3S
// https://reprap.org/wiki/Prusa_i3_MK3

// assume 3030 extrusions if not specified
extrusion_size = 30;
rail_width = extrusion_size == 20 ? 6 : 8;

difference(){
	// base
	union(){	
		cube([28, 15.5, 10]);
		translate([13, -2/2, 10/2])cube([rail_width, 2, 10], center=true);
	}
	
	// trim
	translate([0, 4, -0.5])rotate([0, 0, 90-30])cube([30, 10, 11]);
	rotate([90+45, 0, 0])cube([28, 5, 5]);
	translate([0, 0, 10])rotate([90+45, 0, 0])cube([28, 5, 5]);

	// mounting holes
	translate([13-11/2, 3.5, -0.5])cylinder(h = 11, r = 1.6);
	translate([13+11/2, 3.5, -0.5])cylinder(h = 11, r = 1.6);
	translate([13-11/2, 3.5 - 10/2, 10/2])cube([5.8, 5.8 + 10, 2.2], center=true);
	translate([13+11/2, 3.5 - 10/2, 10/2])cube([5.8, 5.8 + 10, 2.2], center=true);
	// stepped holes
	translate([13-11/2, 3.5, 10/2 + 2.2/2])cube([5.8, 1.6*2, 1], center=true);
	translate([13+11/2, 3.5, 10/2 + 2.2/2])cube([5.8, 1.6*2, 1], center=true);
	translate([13-11/2, 3.5, 10/2 + 2.2/2+0.5])cube([1.6*2, 1.6*2, 1], center=true);
	translate([13+11/2, 3.5, 10/2 + 2.2/2+0.5])cube([1.6*2, 1.6*2, 1], center=true);


	// angle square nut cutouts
	translate([13-11/2+5.8/2, -2.5, 10/2 + 2.2/2])rotate([0, -90-45, 0])cube([2, 2.5, 2]);
	translate([13-11/2+5.8/2, -2.5, 10/2 - 2.2/2])rotate([0, -90-45, 0])cube([2, 2.5, 2]);
	translate([13+11/2-5.8/2, -2.5, 10/2 + 2.2/2])rotate([0, 45, 0])cube([2, 2.5, 2]);
	translate([13+11/2-5.8/2, -2.5, 10/2 - 2.2/2])rotate([0, 45, 0])cube([2, 2.5, 2]);

	// rod cutout
	translate([13, 10.5, -0.5])cylinder(h = 11, r = 4); 
	translate([13, 8.7, -0.5])cube([20, 0.8, 11]);

	// clamp hinge
	difference(){
		union(){
			translate([0, 11, -0.5])rotate([0, 0, 90-70])cube([16, 5, 11]);
			translate([0, 15.4, -0.5])cube([20, 5, 11]);
			translate([9, 16, -0.5])rotate([0, 0, -8])cube([20, 5, 11]);
		}
		translate([13, 10.5, -0.5])cylinder(h = 11, r = 5); 
	}

	// clamping screw
	translate([25.6, -0.5, 10/2])rotate([-90, 0, 0])cylinder(h = 15.5, r = 1.6);
	translate([25.6, 11.9, 10/2])rotate([-90, 0, 0])cylinder(h = 10, r = 3.15);
	translate([25.6 + 2/2, 5 + 2.2/2, 10/2])cube([5.8 + 2, 2.2, 5.8], center=true);
	translate([23.75, 11.9, -0.5])cube([10, 10, 11]);

	// revision	
	translate([0,4,-0.5])rotate([90, 0, -90-30])translate([-4.7, 5, -0.5])linear_extrude(1)text(text = "R1", halign="center", valign="center", size=4); 
}
