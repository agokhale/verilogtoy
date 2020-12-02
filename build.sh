#!/bin/sh -xe

rm -f *.vcd
iverilog -o clockbench clockbench.v
iverilog -o helo helo.vl
vvp helo
vvp -v clockbench
