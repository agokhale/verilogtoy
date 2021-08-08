#!/bin/sh -ex

mkdir -p obj
trg=q2r

iverilog -Wtimescale -o $trg ${trg}.vl clockish.vl tb.vl
vvp -v $trg
