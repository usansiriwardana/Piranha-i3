OPENSCAD_ARGS = -D '$$fn=128'
EXTRUSION_ARG = -D 'extrusion_size=30'

# build all files for a Piranha from scratch (3030 extrusions, RAMPS board, MK52 bed, etc.)
scratch: scaffold x-axis y-axis z-axis lcd e-axis

# build all files for a Piranha using salvaged parts from a Tevo Tarantula (2040 extrusions, MKS GEN L v1.0 board, MK2 bed, longer lead screws, etc.)
tarantula: EXTRUSION_ARG= -D 'extrusion_size=20'
tarantula: LEADSCREW_ARG= -D 'lead_screw_hole=true'

tarantula: scaffold x-axis y-axis z-axis lcd e-axis

# lay out folder structure
scaffold:
	mkdir bin || true
	mkdir bin/Y-AXIS || true
	mkdir bin/X-AXIS || true
	mkdir bin/Z-AXIS || true
	mkdir bin/LCD || true
	mkdir bin/E-AXIS || true

y-axis: bin/Y-AXIS/y-rod-holder.3mf bin/Y-AXIS/y-belt-idler.3mf bin/Y-AXIS/y-motor-holder.3mf bin/Y-AXIS/y-belt-holder.3mf bin/Y-AXIS/y-belt-tensioner.3mf

x-axis: bin/X-AXIS/x-carriage-back.3mf bin/X-AXIS/x-carriage.3mf bin/X-AXIS/x-end-idler.3mf bin/X-AXIS/x-end-motor.3mf

z-axis: bin/Z-AXIS/z-axis-top.3mf bin/Z-AXIS/z-axis-bottom.3mf bin/Z-AXIS/z-screw-cover.3mf

lcd: bin/LCD/LCD-cover.3mf bin/LCD/LCD-knob.3mf bin/LCD/lcd-supports.3mf

e-axis: bin/E-AXIS/adapter-printer.3mf bin/E-AXIS/print-fan-support.3mf bin/E-AXIS/fs-lever.3mf bin/E-AXIS/fs-cover.3mf bin/E-AXIS/extruder-idler.3mf bin/E-AXIS/adapter-printer.3mf bin/E-AXIS/extruder-cover.3mf bin/E-AXIS/extruder-body.3mf

# generic compile rule
bin/%.3mf: Printed-Parts/SCAD/%.scad
	openscad -o $@ ${OPENSCAD_ARGS} $<

# some files require additional arguments (extrusion size, main board type, bed type, etc.)
bin/Y-AXIS/y-rod-holder.3mf: Printed-Parts/SCAD/Y-AXIS/y-rod-holder.scad
	openscad -o $@ ${OPENSCAD_ARGS} ${EXTRUSION_ARG} $<

bin/Z-AXIS/z-axis-top.3mf: Printed-Parts/SCAD/Z-AXIS/z-axis-top.scad
	openscad -o $@ ${OPENSCAD_ARGS} ${LEADSCREW_ARG} $<

clean:
	rm -r bin
