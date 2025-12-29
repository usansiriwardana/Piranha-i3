// PIRANHA iteration1
// fs cover
// GNU GPL v3
// Usan Siriwardana <usiriwar@uwaterloo.ca> and contributors
// based on Prusa i3 MK3S
// https://reprap.org/wiki/Prusa_i3_MK3

// (all scad files are in printing orientation, so this part is technically upside down)

difference(){
	cube([36, 28, 4]);
	
	// top chamfers (here they're on the botom since it's in printing orientation)
	translate([3, -0.5, 0])rotate([0, 180+45, 0])cube([10, 28 + 1, 10]);
	difference(){
		translate([-1, 28 - 3, 0])rotate([-45, 0, 0])cube([26.95 + 1, 10, 10]);
		translate([26.95, 28-3, 0])rotate([0, -45, 0])cube([10, 10, 10]);
	}
	
	// PCB cutout	
	translate([5, -1, 2]){
		cube([9, 25.5 + 1, 2 + 1]);
		rotate([0, 56.31, 0])cube([1.44, 25.5 + 1, 1.44]);
		translate([9, 0, 0])rotate([0, 180+45, 0])cube([1.7, 25.5 + 1, 1.7]);
	}
	translate([5.8, -1, 0.8])cube([7, 25.5 + 1, 2]);
	
	// handle thing
	translate([33, 1.35, 1]){
		cube([4, 30, 4]);
		rotate([0, -45, 0])cube([4, 30, 5]);
	}
	translate([36 - 3, 28, -0.5])rotate([0, 0, -45])cube([5, 5, 5]);
	
	// bolt hole
	translate([22, 7, -0.5]){
		cylinder(h = 4 + 1, r = 1.7);
		cylinder(h = 2 + 0.5, r = 3.2);
		intersection(){
			cylinder(h = 2.5 + 0.5, r = 3.2);
			cube([3.4, 10, 6], center=true);
		}
		cube([3.4, 3.4, 6 + 1], center=true);
		translate([0, 0, 4 + 0.5 - 0.3])cylinder(h = 0.6, r1 = 1.7, r2 = 2.3);
	}
	

	// fillament hole
	translate([22, 7 + 10, -0.5]){
		cylinder(h =  0.5 + 2.5, r1 = 3.58, r2 = 1.3);
		translate([0, 0, 0.5 + 2.5 - 0.05])cylinder(h = 1.31, r1 = 1.3, r2 = 1.88);
		translate([0, 0, 0.5 + 2.5 + 1.31 - 0.05*2])cylinder(h = 1.31, r1 = 1.88, r2 = 1.88);
		translate([0, 0, 4 + 0.5 - 0.3])cylinder(h = 0.6, r1 = 1.88, r2 = 2.1);

		// arrow
		translate([3.2 + 1.15, 0, 0]){
			difference(){
				rotate([0, 0, -45])cube([3, 3, 1]);
				translate([sqrt(3.2+1.15), -sqrt(3.2+1.15) - 1, 0])cube([10, 10, 10]);
			}
			translate([3.38/2 + sqrt(3.2 + 1.15) - 0.1, 0, 0.5])cube([3.38 + 2*0.1, 1.24, 1], center=true);
		}
	}
}
