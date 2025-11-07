// PRUSA iteration4
// Print fan support
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org



translate([0, 0, 8])rotate([0, 90, 0])difference(){
	// base
    union(){
        translate([1,  0,0]) rotate([0,0,0])cylinder(h = 5, r=5);
        translate([3,-10,0]) rotate([0,0,0]) cube([5,15,30]);
        translate([0, -5,0]) rotate([0,0,0]) cube([8,10,5]);
        translate([0, -1,22]) rotate([48,0,0])cylinder(h = 10, r=6, $fn=6);
	}
	
	
    translate([0,-1,22]) rotate([48,0,0])cylinder(h = 30, r=1.65);
        
    difference(){
		// tapered hex hole 
        union(){
            translate([0, -1,22]) rotate([48,0,0])cylinder(h = 6, r=3.1, $fn=6);
            translate([0,-.9,22]) rotate([48,0,0])cylinder(h = 4, r2=3.1,r1=4, $fn=6);
        }
        translate([3,-8,17]) rotate([0,0.6,0]) cube([10,10,10]);
    }
   
   	// conterbored bolt hole
    translate([0,0,-13]) rotate([0,0,0])cylinder(h = 25, r=1.65);
    translate([0,0,4]) rotate([0,0,0])cylinder(h = 1.1, r=3.1);
    
    translate([15, -38,-8]) rotate([0,-48,90]) cube([60,50,20]);
    translate([-10,-24,-8]) rotate([10,0,0]) cube([50,20,40]);
    translate([-10,  6,-8]) rotate([5,0,0]) cube([50,20,40]);
    translate([-10,8.5,21]) rotate([48,0,0]) cube([20,20,20]);
    translate([-10,-13,29.5]) rotate([0,0,0]) cube([20,20,20]);
}
