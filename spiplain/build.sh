#!/bin/sh -xe
mkdir -p obj
src=spiplain
moresrc=""
trgobj=obj/$src.vv
iverilog -Wtimescale -o $trgobj  $src.vl $moresrc
vvp -v $trgobj
