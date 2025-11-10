// PIRANHA iteration1
// y belt idler
// GNU GPL v3
// Usan Siriwardana <usiriwar@uwaterloo.ca> and contributors
// based on Prusa i3 MK3S
// https://reprap.org/wiki/Prusa_i3_MK3

$fn = 128;

difference(){
	// base
	cube([23, 34, 25]);
	
	// channel for idler	
	translate([6.75, -0.5, 8])cube([9.5, 34+1,25-8+1]);
	
	// trim to size
	translate([-0.5, 0, 8])rotate([90-37.5, 0, 0])cube([23+1, 30, 20]);
	translate([-0.5, 34, 15])rotate([37.5, 0, 0])cube([23+1, 30, 20]);

	translate([0, 19.9, 19])rotate([0, 90, 0]){
		// counterbored bolt hole
		translate([0, 0, -0.5]){
			cylinder(h = 23+1, r = 1.6, center = false);
			cylinder(h = 4+0.5, r = 2.8, center = false);
		}
		
		// square nut slot
		// adding this slot does technicially make it weaker against tear out,
		// but it would probably fail from layer adhesion first anyways, which is slightly stronger now
		translate([-10/2, 0, 2.2/2 + 18])cube([5.8 + 10, 5.8, 2.2],center = true);
	}

	// mounting holes
	translate([11.5, 4, -0.5]){
		cylinder(h = 8+1, r = 1.6, center = false);
		translate([0, 0, 2.2/2 + 10/2 + 3.5])cube([5.8, 5.8, 2.2+10], center=true);
	}
	translate([11.5, 30.00, -0.5]){
		cylinder(h = 8+1, r = 1.6, center = false);
		translate([0, 0, 2.2/2 + 10/2 + 3.5])cube([5.8, 5.8, 2.2+10], center=true);
	}	
	// revision	
	translate([23/2,34/2,0])rotate([180, 0, 0])text(text = "R1", halign="center", valign="center", size=8); 
}
