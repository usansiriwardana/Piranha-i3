// PIRANHA iteration1
// extruder body
// GNU GPL v3
// Usan Siriwardana <usiriwar@uwaterloo.ca> and contributors
// based on Prusa i3 MK3S
// https://reprap.org/wiki/Prusa_i3_MK3

module extruder_gear_hole(){
	translate([0, 0, -1/2])cylinder(r = 4.25, h = 20);
	translate([0, 0, -1/2])cylinder(r = 5, h = 14.25 + 1/2);
	translate([0, 0, 14.25])cylinder(r1 = 5, r2 = 4.25, h = 0.75);
}

module countersunk_hole(){
	translate([0, 0, -0.3])cylinder(r1 = 1.65 + 0.5, r2 = 1.65, h = 0.5);
	cylinder(r = 1.65, h = 20);
	translate([0, 0, 17-0.2])cylinder(r1 = 1.65, r2 = 1.65 + 0.5, h = 0.5);
}

module nut_hole(){
	translate([0, 0, -10 + 3.5])cube([5.8, 5.8, 20], center=true);
	translate([0, 0, -10 + 3.5 + 0.5])cube([5.8, 3.3, 20], center=true);
	translate([0, 0, -10 + 3.5 + 0.5*2])cube([3.3, 3.3, 20], center=true);
}

difference(){
	union(){
		// base
		cube([51.5, 84.5, 17]);
		translate([-8.5, 40.7, 0])cube([8.5 + 1/2, 84.5 - 40.7, 17]);
		
		// bed levelling sensor mount
		translate([45.5, 2.3, 12])rotate([-90, 0, 0])cylinder(r = 8, h = 10);
	}
	translate([-2.5, 81.5, -1/2])rotate([0, 0, 45])cube([10, 10, 20]);
	
	// trim around nozzle
	difference(){
		translate([12.6, 5.5, -0.5]){
			rotate([0, 0, -152])cube([20, 10, 20]);
			rotate([0, 0, -90])cube([10, 24.9, 20]);
			translate([24.9, 0, 0]){
				difference(){
					rotate([0, 0, -90-45])cube([10, 10, 20]);
					translate([2, -10, -0.5])cube([10, 10, 25]);
				}
				translate([0, 0, 12 + 0.5])rotate([0, 0, -90])cube([10, 20, 10]);
				translate([0, -3.2, 0])rotate([0, 0, -90])cube([10, 20, 20]);
			}
		}
		translate([45.5, 2.3, 12])rotate([-90, 0, 0])cylinder(r = 8, h = 10); // same as bed leveling sensor mount, line 16
	}
	
	// V6 Hotend cutout
	translate([22.75, 0, 17])rotate([-90, 0, 0]){
		cylinder(r = 11.5, h = 32.6);
		cylinder(r = 8.1, h = 38.25);
		translate([0, 0, 38.25])cylinder(r1 = 8.1, r2 = 6.1, h = 1);
		translate([0, 0, 38.25 + 1])cylinder(r = 6.1, h = 4);
		translate([0, 0, 38.25 + 1 + 4])cylinder(r1 = 6.1, r2 = 8.1, h = 1);
		translate([0, 0, 38.25 + 1 + 4 + 1])cylinder(r = 8.1, h = 4);
		translate([0, 0, 38.25 + 1 + 4 + 1 + 4])cylinder(r1 = 8.1, r2 = 6.1, h = 1);
		cylinder(r = 5, h = 51.75);
		translate([0, 0, 38.25 + 1 + 4 + 1 + 4 + 1 + 2.5])cylinder(r1 = 4.1, r2 = 2.1, h = 2);
		cylinder(r = 2.1, h = 58.25);
		cylinder(r = 1.2, h = 85);
	}
	
	// heatsink air channel area
	translate([22.75, 12.3 + 8, 4.2])cube([55, 20.5 - 8, 20]);
	translate([22.75, 12.3, 4.2])cube([36.5 - 22.75, 20.5, 20]);
	translate([22.75, 12.3, 4.2 + 2.5])cube([55, 20.5, 20]);
	translate([36.5, 12.3, 4.2])rotate([0, 0, 70])cube([10, 10, 20]);
	translate([22.75, 6.5, 17])rotate([-90, 0, 0])cylinder(r = 12.8, h = 20.5 + 12.3 - 6.5);
	translate([-0.5, 20.5, 20])rotate([0, 90, 0])cylinder(r = 19.5, h = 1.5);
	translate([-0.5 + 1.5, 20.5, 20])rotate([0, 90, 0])cylinder(r1 = 19.5, r2 = 10, h = 15);
	translate([-1/2, 8.5, 5.85])cube([25, 21, 20]);
	intersection(){
		translate([-1/2, 29.5, 5.85])rotate([45, 0, 0])cube([25, 21, 20]);
		translate([-1/2, 29.5-1/2, 5.85])cube([25, 3.3+1/2, 20]);
	}
	
	// hotend heatsink fan mount
	// screw holes
	translate([-0.5, 4.5, 4])rotate([0, 90, 0])cylinder(r = 1.4, h = 7);
	translate([-0.5, 4.5 + 32, 4])rotate([0, 90, 0])cylinder(r = 1.4, h = 7);
	// lip and wiring channel
	translate([2.5, 40.5 + 2.5, -1/2])cylinder(r = 2.5, h = 20);
	translate([2.5-7, 40.5, -1/2])cube([7, 2.5*2, 20]);
	intersection(){
		translate([-4.5, 45.5, -1/2])rotate([0, 0, -90-45])cube([5, 5, 20]);
		translate([-6.5, 43.5 + 2, -1/2])rotate([0, 0, -90])cube([10, 10, 20]);
	}
	translate([-6.5, 41.7, -1/2])rotate([0, 0, 180 + 45])cube([5, 1, 20]);
	translate([-8.5 - 0.5, 49.7, -1/2])cube([8.5 - 2.5 + 0.5, 50, 20]);
	translate([-2.5 - 2.5, 49.7, -1/2])cylinder(r = 2.5, h = 20);
	translate([-5.3, 47.7, -1/2])rotate([0, 0, 90 + 45])cube([10, 10, 20]);
	
	// lower x carriage mounting bolt holes
	translate([12.5, 27.5, 0]){
		translate([0, 0, 0.2 - 1])cylinder(r1 = 1.65 + 1, r2 = 1.65, h = 1);
		translate([0, 0, -1/2])cylinder(r = 1.65, h = 20);
		translate([0, 0, 3.52])cylinder(r = 3.15, h = 20);
	}
	translate([12.5 + 20, 27.5, 0]){
		translate([0, 0, 0.2 - 1])cylinder(r1 = 1.65 + 1, r2 = 1.65, h = 1);
		translate([0, 0, -1/2])cylinder(r = 1.65, h = 20);
		translate([0, 0, 3.52])cylinder(r = 3.15, h = 20);
	}
	
	// inductive probe mount
	translate([45.5, 0, 12])rotate([-90, 0, 0])cylinder(r = 4.1, h = 15);
	
	// trim above induction probe
	translate([39.5, 20.3, -1/2])cube([20, 80, 20]);
	intersection(){
		translate([39.5, 20.3, -1/2])rotate([0, 0, -45])cube([20, 80, 20]);
		translate([39.5, 20.3 -8, -1/2])cube([20, 80, 20]);
	}
	
	// extruder gears cutout
	translate([17, 64, -1/2])cylinder(r = 5, h = 20);
	translate([17 + 1.8, 64, 0])extruder_gear_hole();
	translate([17 + 9.6, 64, 0])extruder_gear_hole();
	
	translate([11.95, 59, -1/2])cube([6.8, 10, 10 + 1/2]);
	intersection(){
		translate([11.95, 59, -1/2])cube([6.8, 10, 20]);
		translate([17, 64, 10])cylinder(r1 = sqrt((17-11.95)^2 + (10/2)^2), r2 = 5, h = 2);
	}
	
	// idler door cutout
	difference(){
		translate([36.72, 51.5, 1.75])cube([10, 35, 20]);
		translate([34, 79.5, 1.75])cylinder(r = 5.5, h = 20);
	}
	translate([36.72, 51.5, 1.75])rotate([0, 0, 143.84 - 90])cube([8, 15, 20]);
	difference(){
		translate([28.68, 78.12, 1.75])rotate([0, 0, -180 + 77.85])cube([17, 15, 20]);
		translate([34, 79.5, 1.75])cylinder(r = 5.5, h = 20);
	}
	// pin mount
	translate([34, 79.5, 6.5])cylinder(r = 5.5, h = 20);
	translate([39.5, 81.5, -1/2])rotate([0, 0, 45])cube([10, 10, 20]);
	translate([34, 79.5, 6.5])cube([10, 10, 20]);
	translate([34, 79.5, -1/2])cylinder(r = 1.65, h = 20);
	translate([34, 79.5, 0])cylinder(r1 = 1.85, r2 = 1.65, h = 0.2);
	translate([34, 79.5, 6.5 - 0.5])cylinder(r1 = 1.65, r2 = 2.15, h = 0.5);
	
	// idler tensioning screw cutout
	translate([-8, 56.5, 13])rotate([0, 90, 0])cylinder(r = 1.7, h = 50);
	translate([-8, 56.5, 13])rotate([0, 90, 0])cylinder(r = 3.5, h = 12.5 + 8);
	translate([-2.5, 53, 13])cube([6, 3.5*2, 10]);
	translate([29.5, 56.5, 13])rotate([0, 90, 0])cylinder(r = 4.5, h = 50);
	translate([29.5, 56.5 - 4.5, 13])cube([10, 4.5, 5]);
	
	// fillament sensor arm and pin cutout
	translate([6.5, 64.5, 9])cylinder(r = 4.13, h = 20);
	translate([6.5, 64.5, -1/2])cylinder(r = 1.4, h = 20);
	translate([6.5, 64.5, 9 - 0.5])cylinder(r1 = 1.4, r2 = 1.4 + 1, h = 1);
	difference(){
		translate([4.5, 68.11, 8.7])cube([6, 7.39, 10]);
		translate([6.5, 64.5, 0])cylinder(r = 4.13, h = 9);
	}
	translate([4.5, 75.5, 8.7])rotate([0, 0, -21.8])cube([5, 2.15, 10]);
	translate([5.3, 77.5 - 1.2, 8.7])cube([5, 1.2, 10]);
	difference(){
		translate([10.61, 64.8, 8.7])rotate([0, 0, 90 - 10])cube([10.86, 5, 20]);
		translate([6.5, 64.5, 0])cylinder(r = 4.13, h = 9);
	}
	translate([12.5, 75.5, 8.7])rotate([0, 0, 90])cube([5.2, 4.8, 20]);
	translate([7.7, 80.7, 8.7])rotate([0, 0, -110.56])cube([5, 5, 20]);
	translate([17, 76.95, 17])rotate([0, -90, 0])cylinder(r = 4, h = 5);
	
	// fillament sensor magnet cutout
	translate([1.2, 68.7, 2])cube([2.2, 6.2, 20]);
	translate([1.2, 68.7 + 1.5, -1/2])cube([2.2, 3.2, 20]);
	
	// fillament sensor PCB cutout
	translate([5.9, 81.5, -1/2])cube([8.2, 5, 9.6 + 1/2]);
	translate([8.35, 80, -1/2])cube([1.5, 5, 7 + 1/2]);
	translate([6.3, 83.5, 15])cube([7.4, 5, 10]);
	translate([7.6, 80.7 - 1/2, 15])cube([4.45, 10, 10]);
	translate([10, 84.5, 12])rotate([90, 0, 0]){
		cylinder(r = 0.9, h = 5);
		cylinder(r1 = 1.4, r2 = 0.9, h = 0.5);
	}
	
	// fillament sensor adapter cutout
	translate([16.55, 73.5, 11.45])cube([9.45, 15, 10]);
	translate([26.05, 73.5, 13])rotate([-90, 0, 0])cylinder(r = 1.55, h = 15);
	translate([16.55, 72.45, 11.5])cube([8.4, 5, 10]);
	difference(){
		translate([16.55 + 8.4, 72.45, 11.5])rotate([0, 0, 45])cube([1.55, 5, 10]);
		translate([16.55 + 9.45, 73.5, 11.45])cube([5, 15, 10]);
	}
	translate([19.7, 80.5, 4.2])cube([5.6, 2, 20]);
	translate([22.5, 72.5, 7])rotate([-90, 0, 0])cylinder(r = 1.7, h = 15);
	
	// bolt holes
	translate([3, 48.5, 0])countersunk_hole();
	translate([34, 48.5, 0])countersunk_hole();
	translate([3, 79.5, 0])countersunk_hole();
	translate([10.5, 37.5, 0]){
		countersunk_hole();
		nut_hole();
	}
	translate([10.5 + 24, 37.5, 0]){
		countersunk_hole();
		nut_hole();
	}
	
	// version number
	translate([28, 15, 0.5])rotate([0, 180, 0])linear_extrude(1)text("R1", font = "helvetica:style=bold", size=7);
}
