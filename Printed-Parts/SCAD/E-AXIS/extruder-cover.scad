// PIRANHA iteration1
// extruder cover
// GNU GPL v3
// Usan Siriwardana <usiriwar@uwaterloo.ca> and contributors
// based on Prusa i3 MK3S
// https://reprap.org/wiki/Prusa_i3_MK3

module mountingHole(){
	// mounting holes
	translate([0, 0, -1/2]){
		// main hole
		cylinder(r = 1.67, h = 25);
		// counterbore
		cylinder(r = 3.1, h = 3.5 + 1/2);
		// stepped hole
		translate([0, 0, 3.5 + 1])cube([1.67*2, 1.67*2, 1], center=true);
		intersection(){
			translate([0, 0, 3.5 + 1/2])cube([1.67*2, 3.1*2, 1], center=true);
			cylinder(r = 3.1, h = 3.5 + 1);
		}
		// chamfer
		cylinder(r1 = 3.1 + 1, r2 = 3.1, h = 1);
	}
}

difference(){
	// base
	cube([42.5, 65, 23]);
	
	// trim
	translate([6.7, -1, 12])cube([50, 33.1 + 1, 20]);
	translate([9.4, -1, 12])cube([50, 70, 20]);
	translate([-1, 39.25, 12])cube([50, 70, 20]);
	
	translate([0, 2.25, -1])rotate([0, 0, 152.01 - 90])cube([11.72, 10, 25]);
	translate([5.5, 12.6, -1])rotate([0, 0, 90])cube([21.2, 10, 25]);
	
	translate([21.75, 39.5, -1]){
		cube([25, 30, 25]);
		rotate([0, 0, 90 - 48.63])cube([25, 13.33, 25]);
	}
	translate([10.79, 39.5, 4.5])cube([10.96, 10, 10]);
	
	// part cooling fan mount
	translate([7.41, 12, 0])rotate([0, -90 - (90-48), 0])cube([20, 70, 10]);
	translate([10.79, 39.5, 4.5])rotate([0, -(90-48), 0])cube([10, 70, 20]);
	translate([10.79, 49.5 - 0.01, 4.5])rotate([0, -(90-48), 0])translate([0, 0, -15])cube([15, 70, 20]);
	translate([12.94, 49.5 - 0.01, 2.11])rotate([0, -(90-48) + 90, 0])translate([0, 0, -15])cube([15, 70, 20]);
	translate([2.55, 42.24, 6.2])rotate([0, -(90-48), 0])translate([-1, 0, 0])cube([15, 70, 20]);
	// square nut
	translate([7.34, 60, 3.12]){
		rotate([0, 45, 0])translate([0, 0, 10/2])cube([5.6, 5.6, 10], center = true);
	}
	
	
	// towards heatsink fan side slot
	translate([9.5, 6.45, 3.95]){
		rotate([0, 180, 0])cube([10, 6.16, 10]);
		rotate([0, 180 + (90-41.36), 0])cube([7.79, 6.16, 10]);
		translate([-5.15, 0, 5.85])rotate([0, 180, 0])cube([10, 6.16, 10]);
	}
	translate([5.72, 60, 1.66])rotate([0, -(90-48) + 90, 0])translate([0, 0, -1])cylinder(r = 1.65, h = 40);
	// far from heatsink fan side slot	
	translate([8.15, 42.1, -1]){
		rotate([0, 0, 90])cube([3.55, 1.53, 10]);
		rotate([0, 0, 90 + 45])cube([3.55, 15, 50]);
		translate([-1.53, 3.55, 0])rotate([0, 0, -90 -45])cube([5, 2, 50]);
		translate([-1.53, 3.55, 0])rotate([0, 0, -90])cube([1.53, 1, 50]);
	}
	translate([3.45, 42.5, 0]){
		rotate([0, 0, 180])cube([10, 10, 50]);
	}
	// internal radius for some reason
	translate([11.5, 33.1, 23-12.8])cylinder(r=5, h=12.8 + 0.1);
	
	// heatsink space
	translate([11.7-5, 0, 10.2])cube([24, 33.1, 3]);
	translate([11.7-2.3, 0, 10.2])cube([24, 40, 3]);
	
	// heatsink fan port
	union(){
		translate([20.5, -1, 20])rotate([270, 0, 0])cylinder(r = 19.5, h = 2 + 0.001);
		translate([20.5, 1, 20])rotate([270, 0, 0])cylinder(r1 = 19.5, r2 = 10, h = 10);
	}
	
	// heatsink fan cable cutout
	translate([43, 2.5, -1])cylinder(r = 2.5, h = 25);
	translate([43 - 2.5, -2.5, -1])cube([5, 5, 25]);
	
	// cutout for hotend
	translate([-1, 22.75, 23])rotate([0, 90, 0])cylinder(r = 11.15, h = 28 + 1);
	
	// mounting holes
	translate([37.5, 10.5, 0]){
		mountingHole();
	}
	translate([37.5, 10.5 + 24, 0]){
		mountingHole();
	}
	translate([37.5, 10.5 + 7, -1/2]){
		cylinder(r = 1.67, h = 10 + 1/2);
		cylinder(r1 = 1.67 + 1, r2 = 1.67, h = 1);
		translate([0, 0, 5 + 1/2])cube([1.67*2, 5.6, 1], center=true);
		translate([0, 0, 5 + 1])cube([1.67*2, 1.67*2, 1], center=true);
	}
	translate([34.7, 14.7, 3]){
		cube([8, 5.6, 2]);
	}
	
	// fan mounting holes
	translate([4.5, -1/2, 4])rotate([-90, 0, 0]){
		// larger hole, screw passes through and bites into part cooling fan duct
		cylinder(r = 1.65, h = 6.5 + 1/2);
		cylinder(r1 = 1.65 + 1, r2 = 1.65, h = 1);
	}
	translate([4.5 + 32, -1/2, 4])rotate([-90, 0, 0]){
		// smaller hole for threads to bite
		cylinder(r = 1.4, h = 6.5 + 1/2);
		cylinder(r1 = 1.4 + 1, r2 = 1.4, h = 1);
	}
	
	// version number
	translate([42.5 - 0.5, 23, 2])rotate([90, 0, 90])linear_extrude(height = 1)text("R1", font = "helvetica:style=bold", size = 7);
}
