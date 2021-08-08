#!/bin/sh -ex

mkdir -p obj
trg=obj/595.vv

iverilog -Wtimescale -o $trg 595.vl clockish.vl tb_595.vl
vvp -v $trg
