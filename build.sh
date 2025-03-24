#!/bin/sh -xe

mkdir -p obj
rm -f *.vcd obj/*
iverilog -o obj/ctr  ctr.vl
iverilog -o obj/async_ctr  async_ctr.vl
iverilog -o obj/clockbench clockbench.vl
iverilog -o obj/clockish clockish.vl
iverilog -o obj/blend clockish.vl clockbench.vl

iverilog -o obj/tbctr  clockbench.vl ctr.vl tb_ctr.vl
#vvp -v obj/clockbench
#vvp -v obj/clockish
#vvp -v obj/blend
vvp -v obj/tbctr
