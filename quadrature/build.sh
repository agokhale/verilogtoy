#!/bin/sh -ex

mkdir -p obj
trg=q2r

iverilog -Wtimescale -o obj/$trg ${trg}.vl clockish.vl tb.vl tbupdown.vl
vvp -v obj/$trg
