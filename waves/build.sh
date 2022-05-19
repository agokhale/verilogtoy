#!/bin/sh -ex

mkdir -p obj
trg=obj/sw.vv

iverilog -Wtimescale -o $trg sawtooth.vl ../clockish.vl  \
	 tb_saw.vl pwm.vl clocksplitter.vl
vvp -v $trg
