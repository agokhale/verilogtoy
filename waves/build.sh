#!/bin/sh -ex


srcs="hbridge.vl sawtooth.vl ../clockish.vl pwm.vl triangle.vl clocksplitter.vl "
mkdir -p obj
trg=obj/sw.vv


verilator --lint-only $srcs  || true
iverilog -Wtimescale -o $trg  \
	 tb_saw.vl  \
		${srcs}
vvp -v $trg
