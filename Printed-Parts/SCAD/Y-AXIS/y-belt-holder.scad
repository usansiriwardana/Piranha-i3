// PIRANHA iteration1
// y belt holder
// GNU GPL v3
// Usan Siriwardana <usiriwar@uwaterloo.ca> and contributors
// based on Prusa i3 MK3S
// https://reprap.org/wiki/Prusa_i3_MK3

difference(){
	cube([26.5, 21.5, 18]);

	// trim
	translate([6, -1, -0.5])cube([30, 8+1, 18+1]);
	translate([6, 0, 18-3])cube([30, 30, 4]);
	translate([0, -0.5, 0.5])rotate([0, 90+45, 0])cube([1, 30, 1]);
	translate([6, -1, 18-3])rotate([0, -45, 0])cube([10, 30, 10]);
	translate([3, -1, 0])rotate([0, 45, 0])cube([10, 8+1, 10]);
	
	// belt cutout
	translate([18.14, 0, 6])cube([2, 30, 30]);
	translate([18.14 + 2/2, 0, 18 - 2.8*2])rotate([0, -45, 0])cube([30, 30, 30]);
	translate([19.14, 18.7, -0.5])cylinder(h = 30, r = 1.6);
	translate([19.14, 18.7, 6])cylinder(h = 30, r = 2.8);
	translate([19.14-2.8, 18.7, 6])cube([2.8*2, 5, 30]);
	
	// square nut
	translate([19.14, 18.7, 4-2.2/2])cube([5.8, 5.8, 2.2], center=true);
	translate([19.14, 18.7, 4-2.2/2 + 0.5])cube([5.8, 1.6*2, 2.2], center=true);
	translate([19.14, 18.7, 4-2.2/2 + 0.5*2])cube([1.6*2, 1.6*2, 2.2], center=true);

	// mounting
	translate([-0.5, 5, 9])rotate([0, 90, 0])cylinder(h = 30, r = 1.6);
	translate([3, 5, 9])rotate([0, 90, 0])cylinder(h = 30, r = 2.8);
	
	translate([8.8, 0, 9])rotate([-90, 0, 0])cylinder(h = 30, r = 1.6);
	translate([8.8, 8-1, 9])rotate([-90, 90, 0])cylinder(h = 4+1, r = 6.47/2, $fn = 6);
	
	// revision
	translate([0.5, 20, 5])rotate([90, 0, 180+90])linear_extrude(1)text("R1", size=8);
}
