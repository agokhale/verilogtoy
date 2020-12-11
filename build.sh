#!/bin/sh -xe

mkdir -p obj
rm -f *.vcd obj/*
iverilog -o obj/clockbench clockbench.vl
iverilog -o obj/helo helo.vl
iverilog -o obj/ctr  ctr.vl
iverilog -o obj/async_ctr  async_ctr.vl
vvp helo
vvp -v obj/clockbench
