#!/bin/sh -ex
trg=obj/595.vv

iverilog -o $trg 595.vl clockish.vl tb_595.vl
vvp -v $trg