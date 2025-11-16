OPENSCAD_ARGS = -D '$$fn=128'
EXTRUSION_ARG = -D 'extrusion_size=30'

# build all files for a Piranha from scratch (3030 extrusions, RAMPS board, MK52 bed, etc.)
scratch: scaffold x-axis y-axis z-axis lcd e-axis

# build all files for a Piranha using salvaged parts from a Tevo Tarantula (2040 extrusions, MKS GEN L v1.0 board, MK2 bed, etc.)
tarantula: EXTRUSION_ARG= -D 'extrusion_size=20'

tarantula: scaffold x-axis y-axis z-axis lcd e-axis

# lay out folder structure
scaffold:
	mkdir bin || true
	mkdir bin/Y-AXIS || true
	mkdir bin/X-AXIS || true
	mkdir bin/Z-AXIS || true
	mkdir bin/LCD || true
	mkdir bin/E-AXIS || true

y-axis: bin/Y-AXIS/y-rod-holder.stl bin/Y-AXIS/y-belt-idler.stl bin/Y-AXIS/y-motor-holder.stl bin/Y-AXIS/y-belt-holder.stl bin/Y-AXIS/y-belt-tensioner.stl

x-axis: bin/X-AXIS/x-carriage-back.stl bin/X-AXIS/x-carriage.stl bin/X-AXIS/x-end-idler.stl bin/X-AXIS/x-end-motor.stl

z-axis: bin/Z-AXIS/z-axis-top.stl bin/Z-AXIS/z-axis-bottom.stl bin/Z-AXIS/z-screw-cover.stl

lcd: bin/LCD/LCD-cover.stl bin/LCD/LCD-knob.stl bin/LCD/lcd-supports.stl

e-axis: bin/E-AXIS/adapter-printer.stl bin/E-AXIS/print-fan-support.stl

# generic compile rule
bin/%.stl: Printed-Parts/SCAD/%.scad
	openscad -o $@ ${OPENSCAD_ARGS} $<

# some files require additional arguments (extrusion size, main board type, bed type, etc.)
bin/Y-AXIS/y-rod-holder.stl: Printed-Parts/SCAD/Y-AXIS/y-rod-holder.scad
	openscad -o $@ ${OPENSCAD_ARGS} ${EXTRUSION_ARG} $<

clean:
	rm -r bin
