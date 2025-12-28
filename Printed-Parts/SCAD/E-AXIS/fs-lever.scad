// PIRANHA iteration1
// fs lever
// GNU GPL v3
// Usan Siriwardana <usiriwar@uwaterloo.ca> and contributors
// based on Prusa i3 MK3S
// https://reprap.org/wiki/Prusa_i3_MK3

difference(){
	// base
	union(){
		cylinder(h = 9.75, r = 3.5);
		translate([0.59, -1.5, 0])cube([10.98, 4.95, 9.75]);
		translate([10.87, -1.5, 0])cube([3.5, 9.68, 4.75]);
		translate([14.37, 6.18, 0])cube([0.85, 2, 4.75]);
		translate([14.35, 2.4, 0])cube([2.9, 5.78, 1.5]);
		translate([10.56, 3.15, 0])rotate([0, 0, 50.06])translate([0, -0.1, 0])cube([0.95, 0.3 +0.1, 4.75]);
	}
	
	// magnet cutout
	translate([4.22, 3.5 - 5 + 1.35, -0.5])cube([6.2, 2.2, 9 + 1]);
	translate([4.22 + 3/2, 3.5 - 5 + 1.35, 0])cube([3.2, 2.2, 9 + 1]);

	// pin
	translate([0, 0, -0.5])cylinder(h = 9.75 + 1, r = 1.7);
	// chamfers	around pin
	translate([0, 0, -0.3])cylinder(h = 0.6, r1 = 2.3, r2 = 1.7);
	translate([0, 0, 9.75 -0.3])cylinder(h = 0.6, r1 = 1.7, r2 = 2.3);
	difference(){
		translate([0, 0, -0.3])cylinder(h = 0.6, r = 3.6);
		translate([0, 0, -0.3])cylinder(h = 0.6, r1 = 2.9, r2 = 3.5);
		translate([0.59, -1.5, 0])cube([10.98, 4.95, 9.75]);
	}
	difference(){
		translate([0, 0, 9.75-0.3])cylinder(h = 0.6, r = 3.6);
		translate([0, 0, 9.75-0.3])cylinder(h = 0.6, r1 = 3.5, r2 = 2.9);
		translate([0.59, -1.5, 0])cube([10.98, 4.95, 9.75]);
	}
	
	// smaller chamfers
	difference(){	
		translate([0.56, 3.15, 0])rotate([-45, 0, 0])cube([10, 1, 1]);
		translate([10.56, 3.15, 0])rotate([0, -45, 50.06+270])cube([10, 0.95, 10]);
	}
	difference(){
		translate([10.56, 3.15, 0])rotate([0, -90-45, 50.06+270])cube([10, 0.95, 10]);
		translate([0.56, 3.15, 0])rotate([45, 0, 0])cube([10, 1, 1]);
		translate([11.17, 3.88, 0])rotate([0, -45, 0])cube([10, 10, 10]);
	}
	difference(){
		translate([11.17, 3.88, 0])rotate([0, -45-90, 0])cube([10, 10, 10]);
		translate([10.56, 3.15, 0])rotate([0, -45, 50.06+270])cube([10, 0.95, 10]);
	}
	translate([10, 9.68-1.5 - 0.3, 0])rotate([-45, 0, 0])cube([10, 1, 1]);
	difference(){
		translate([2.8, -1.2, 0])rotate([90+45, 0, 0])cube([10, 1, 1]);
		cylinder(h = 0.3, r1 = 3.2, r2 = 3.5);
		translate([0, 0, 0.3])cylinder(h = 1, r = 3.5);
	}
	difference(){
		translate([2.6, -1.2, 9.75])rotate([90+45, 0, 0])cube([10, 1, 1]);
		translate([0, 0, 9.75-0.3])cylinder(h = 0.3, r1 = 3.5, r2 = 3.2);
		translate([0, 0, 9.75-1-0.3])cylinder(h = 1, r = 3.5);
	}
	difference(){
		translate([11.41, -1.2, 0])rotate([45+90, 0, 54.48])translate([-0.5, 0, 0])cube([4.8+0.5, 1, 1]);
		translate([14.2, 2.7, 0])rotate([45, 0, 0])cube([4, 1, 1]);
	}
	difference(){
		translate([14.2, 2.7, 0])rotate([45+90, 0, 0])cube([4, 1, 1]);
		translate([11.41, -1.2, 0])rotate([45, 0, 54.48])translate([-0.5, 0, 0])cube([4.8+0.5, 1, 1]);
	}
	translate([10.87 + 3.5, 2.7, 1.5])rotate([45+90, 0, 0])cube([4, 1, 1]);
	translate([0, 0, 9.75])translate([0.56, 3.15, 0])rotate([-45, 0, 0])cube([15, 1, 1]);
	translate([11.26, -1.5, 9.75])rotate([0, 45, 0])cube([1, 10, 1]);
	translate([11.56, 3.15, 4.75])rotate([0, 0, 45])cube([1, 1, 10]);
	translate([11.56, 3.15, 9.45])rotate([0, -35, 45])cube([1, 1, 1]);	
	
	// fillets
	difference(){
		translate([10.87 - 1, 9.68-1.5-4.73, 4.75 - 1])cube([2, 5, 2]);
		translate([10.87 + 1, 9.68-1.5-4.73, 4.75 - 1])rotate([-90, 0, 0])cylinder(h = 4.73, r = 1);
		translate([10.56, 3.15, 0])rotate([0, 0, 50.06])translate([0, -1, 0])cube([3, 0.3 +1, 4.75]);
	}
	difference(){
		translate([10.87 + 3.5 + 0.85 -1, 9.68-1.5-4.73, 4.75 - 1])cube([2, 5, 2]);
		translate([10.87 + 3.5 + 0.85 -1, 9.68-1.5-4.73, 4.75 - 1])rotate([-90, 0, 0])cylinder(h = 4.73, r = 1);
	}
	
	// large chamfers
	translate([11.57, -1.5, -0.5])rotate([0, 0, 270 + 54.48])cube([10, 4.8, 4.75 + 1]);
	translate([17.27, 5.05, -0.5])rotate([0, 0, 33.26])cube([10, 4.8, 1.5 + 1]);
}
