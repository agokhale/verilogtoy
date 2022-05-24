#!/bin/sh -ex


srcs="hbridge.vl sawtooth.vl ../clockish.vl pwm.vl"
mkdir -p obj
trg=obj/sw.vv


verilator --lint-only $srcs  || true
iverilog -Wtimescale -o $trg sawtooth.vl ../clockish.vl  \
	 tb_saw.vl pwm.vl clocksplitter.vl \
		hbridge.vl
vvp -v $trg
