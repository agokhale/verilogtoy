#!/bin/sh -xe

mkdir -p obj
rm -f *.vcd obj/*
iverilog -o obj/helo helo.vl
vvp helo
iverilog -o obj/ctr  ctr.vl
iverilog -o obj/async_ctr  async_ctr.vl
iverilog -o obj/clockbench clockbench.vl
vvp -v obj/clockbench
