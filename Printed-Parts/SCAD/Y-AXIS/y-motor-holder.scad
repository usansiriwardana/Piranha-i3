// PIRANHA iteration1
// y motor holder
// GNU GPL v3
// Usan Siriwardana <usiriwar@uwaterloo.ca> and contributors
// based on Prusa i3 MK3S
// https://reprap.org/wiki/Prusa_i3_MK3

difference(){
	union(){
		// base
		cube([42, 48, 8]);
		translate([0, 12, 8])cube([8, 36, 11]);
		translate([0, 48 -5.2, 8])cube([42, 5.2, 11]);
		
		// internal chamfers
		difference(){
			translate([8, 48-5.2-1.75, 8])cube([42-8, 1.75, 1.75]);
			translate([8-0.5, 48-5.2-1.75, 8])rotate([45, 0, 0])cube([42-8+1, 3, 2]);
		}
		difference(){
			translate([8, 12-1.75, 8])cube([1.75, 36-5.2+1.75, 1.75]);
			translate([8+1.75, 12-1.75-0.5, 8])rotate([0, -45, 0])cube([2, 36-5.2+1.75+1, 3]);
			translate([0-0.5, 12-1.75, 8])rotate([45, 0, 0])cube([8+1+1.75, 3, 2]);
		}
		difference(){
			translate([0, 12-1.75, 8])cube([8, 1.75, 1.75]);
			translate([0-0.5, 12-1.75, 8])rotate([45, 0, 0])cube([8+1+1, 3, 2]);
		}
	}

	// motor mounting holes
	translate([5.5, 5.5, 0]){
		translate([0, 0, -0.5])cylinder(h = 9, r = 1.6);
		translate([0, 0, 5])cylinder(h = 3.5, r = 2.8);
		translate([0, 0, -0.5])cylinder(h=1, r1=1.6+1, r2=1.6);
	}
	translate([36.5, 36.5, 0]){
		translate([0, 0, -0.5])cylinder(h = 9, r = 1.6);
		translate([0, 0, 5])cylinder(h = 3.5, r = 2.8); 
		translate([0, 0, -0.5])cylinder(h=1, r1=1.6+1, r2=1.6);
	}
	
	// motor cutout
	translate([5.5 + 31/2, 5.5 + 31/2, -0.5])cylinder(h = 9, r = 11.25); 
	translate([5.5 + 31/2, 5.5 + 31/2, -0.5])cylinder(h = 1, r1 = 11.25+1, r2 = 11.25); 
	translate([21, -1, -0.5])cube([30, 32.25 + 1, 9]);
	translate([21, 32.25+1, -0.5])rotate([90+45, 0, 0])cube([30, 2, 1]);
	
	// mounting holes
	translate([-0.5, 12+6, 13])rotate([0, 90, 0])cylinder(h = 8+1, r = 1.6); 
	translate([-0.5, 12+6+22, 13])rotate([0, 90, 0])cylinder(h = 8+1, r = 1.6); 
	translate([3.5+2.2/2, 12+6, 13+10/2])cube([2.2, 5.8, 5.8+10], center=true);
	translate([3.5+2.2/2, 12+6+22, 13+10/2])cube([2.2, 5.8, 5.8+10], center=true);

	// trim
	translate([42, 37, -0.5])rotate([0, 0, 45])cube([10, 20, 20]);
	translate([-0.5, 12, 14])rotate([45, 0, 0])cube([10, 20, 10]);
	translate([8, 48-5.2 -0.5-1.5, 19])rotate([0, 20, 0])cube([100, 10, 15]);
	translate([42, 37-3, -0.5])rotate([0, 0, 180+45])cube([10, 20, 10]);
	translate([21-5, 0, -0.5])rotate([0, 0, -45])cube([10, 20, 10]);
	translate([21, 5+3, -0.5])rotate([0, 0, 45])cube([10, 10, 10]);
	translate([0, -0.5, 0.5])rotate([0, 90+45, 0])cube([1, 48+1, 1]);
	
	// revision number
	translate([5, 45, 0.5])rotate([180, 0, 0])linear_extrude(1)text("R1");
}
