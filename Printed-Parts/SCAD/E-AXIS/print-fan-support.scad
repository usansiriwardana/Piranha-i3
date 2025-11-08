// PIRANHA iteration1
// Print Fan Support
// GNU GPL v3
// Usan Siriwardana <usiriwar@uwaterloo.ca> and contributors
// based on Prusa i3 MK3S
// https://reprap.org/wiki/Prusa_i3_MK3

translate([0, 0, 8])rotate([0, 90, 0])difference(){
	// base
    union(){
        translate([1,  0,0]) rotate([0,0,0])cylinder(h = 5, r=5);
        translate([3,-10,0]) rotate([0,0,0]) cube([5,15,30]);
        translate([0, -5,0]) rotate([0,0,0]) cube([8,10,5]);
        translate([0, -1,22]) rotate([48,0,0])cylinder(h = 10, r=6, $fn=6);
	}
	
	
    translate([0,-1,22]) rotate([48,0,0])translate([0, 0, -1])cylinder(h = 30, r=1.65);
        
	// square nut slot
    translate([0, -1,22]) rotate([48,0,0])translate([-5, 0, 4.9])cube([15.8, 5.8, 2.2], center = true);
   
   	// conterbored bolt hole
    translate([0,0,-13]) rotate([0,0,0])cylinder(h = 25, r=1.65);
    translate([0,0,4]) rotate([0,0,0])cylinder(h = 1.1, r=3.1);
    
    // trim to size
    translate([15, -38,-8]) rotate([0,-48,90]) cube([60,50,20]);
    translate([-10,-24,-8]) rotate([10,0,0]) cube([50,20,40]);
    translate([-10,  6,-8]) rotate([5,0,0]) cube([50,20,40]);
    translate([-10,8.5,21]) rotate([48,0,0]) cube([20,20,20]);
    translate([-10,-13,29.5]) rotate([0,0,0]) cube([20,20,20]);
}
