
rot.bin: rot.v rot.pcf
	yosys -q -p "synth_ice40 -device hx -top top  -json rot.json" rot.v
	nextpnr-ice40 --hx4k --json rot.json --pcf rot.pcf --asc rot.asc
	#arachne-pnr -p rot.pcf rot.blif -o rot.txt
	icebox_explain rot.asc > rot.ex
	icepack rot.asc rot.bin

clean:
	rm -f rot.blif rot.txt rot.ex rot.bin rot.json
