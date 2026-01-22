// PIRANHA iteration1
// extruder idler
// GNU GPL v3
// Usan Siriwardana <usiriwar@uwaterloo.ca> and contributors
// based on Prusa i3 MK3S
// https://reprap.org/wiki/Prusa_i3_MK3

$fn = 128;

difference(){
	cube([25.5, 27 + 5, 12.5 + 4.2]);

	// slope on far side
	difference(){
		translate([-1/2, 31.25, 1.5]){
			rotate([90 - 53.92, 0, 0])cube([30, 10, 9.5]);
			cube([30, 10, 10]);
		}
		// leave space for tension bolt hole
		translate([14.5, 28, -1/2])cylinder(h = 10, r = 3.5);
	}

	// pivot bolt hole
	translate([-1/2, 5, 5])rotate([0, 90, 0])cylinder(h = 25.5 + 1, r = 1.7);
	translate([-1/2, 1.46, 1.46])rotate([135+90, 0, 0])cube([25.5 + 1, 10, 10]);
	translate([-1/2, 0, 0])difference(){
		translate([0, -1, 0])cube([25.5 + 1, 10, 20]);
		
		translate([-1/2, 5, 5])rotate([0, 90, 0])cylinder(h = 25.5 + 1, r = 5);
		translate([0, 1.46, 0])cube([25.5 + 1, 10, 1.46]);
		translate([0, 5, 0])cube([25.5 + 1, 10, 5]);
		translate([0, 5 + 2.42, 0])cube([25.5 + 1, 10, 12.5 + 4.2]);
	}
	difference(){
		translate([20.5, 0, -1/2])cube([5 + 0.5, 11.5, 12.5 + 4.2 + 1]);
		translate([20.5, 11.50, 3.05])rotate([-180 + 45, 0, 0])cube([10, 10, 10]);
	}
	translate([20.5, 9, -1/2])rotate([90, 0, 0])cube([10, 10, 10]);

	// idler pin
	translate([-1/2, 20.5, 12.5])rotate([0, 90, 0])cylinder(h = 25.5 + 1, r = 1.6);
	difference(){
		translate([-1/2, 0, 11.8])cube([50, 50, 50]);
		translate([-1/2, 20.5, 12.5])rotate([0, 90, 0])cylinder(h = 25.5 + 1, r = 4.2);
	}
	translate([-1, 20.48, 20.44])rotate([0, 90, 0])cylinder(h = 3.5 + 1, r = 12.93);
	
	translate([7.3, 20.48, 20.44])rotate([0, 90, 0])cylinder(h = 14.4, r = 12.93);
	
	translate([0, 24.7, 9.8 - 0.4])cube([30, 10, 10]);
	translate([-1/2, 25.45, 8.5])cube([30, 10, 10]);
	
	// hex hole
	translate([14.5, 11.5 + 6, -1/2]){
		rotate([0, 0, 30])cylinder(h = 30, r = 12/2, $fn=6);
		rotate([0, 0, 30])cylinder(h = 1, r1= 12/2 + 0.9, r2 = 12/2 - 0.3, $fn=6);
		
	}
	translate([7.3, 23.5 - 3 - 4.2, 8.5])cube([14.4, 10, 10]);
	
	// tension bolt hole
	translate([14.5, 28, -1/2]){
		cylinder(h = 10, r = 1.7);
		
		// square nut
		cube([5.8, 5.8, 2.2 + 1], center=true);
		cube([5.8, 1.7*2, 2.2 + 1 + 1], center=true);
		cube([1.7*2, 1.7*2, 2.2 + 1 + 1*2], center=true);
	}
	
	translate([-1/2, 7.42, 9.38])rotate([90 - 81.95, 0, 0])cube([30, 8.2, 10]);
	translate([-1/2, 15.4, 11.5])rotate([0, 90, 0])cylinder(h = 30, r = 1);
	translate([-1/2, 25.7, 9.5])rotate([0, 90, 0])cylinder(h = 30, r = 1);
	
	// revision number
	translate([12, 6, 1/2])rotate([180, 0, 180])linear_extrude(1)text("R1", size=5);
}
