// PIRANHA iteration1
// LCD knob
// GNU GPL v3
// Usan Siriwardana <usiriwar@uwaterloo.ca> and contributors
// based on Prusa i3 MK3S
// https://reprap.org/wiki/Prusa_i3_MK3

module handle(){
    difference(){
        cube([3, 12, 8], center = true);
        translate([0, 15, -1]) rotate([-30, 0, 0])cube(20, center=true);
    }
}

module main(){
    difference(){
        union(){
            // central hub
            cylinder(8, 8, 11);
        
            // handles
            rotate([0, 0, 0]) translate([0, 13, 4]) handle();
            rotate([0, 0, 120]) translate([0, 13, 4]) handle();
            rotate([0, 0, -120]) translate([0, 13, 4]) handle();
        }
        translate([0, 0, 8]) cylinder(1, 8, 8, center=true);
        translate([0, 0, 5]) cube([15, 1, 6], center = true);
        
        // cut out fingers to grab encoder shaft
        translate([0, 0, 2]) union(){
            difference(){
                cylinder(6, 6, 6);
                cylinder(6.1, 5, 5);
            }
            translate([0, 0, 1.7]) cylinder(4.3, 3, 3);
        }
    }
    
}


//handle();
main();
