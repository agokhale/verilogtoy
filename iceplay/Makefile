
rot.bin: rot.v rot.pcf
	yosys -q -p "hierarchy -top top; synth_ice40 -blif rot.blif" rot.v
	arachne-pnr -p rot.pcf rot.blif -o rot.txt
	icebox_explain rot.txt > rot.ex
	icepack rot.txt rot.bin

clean:
	rm -f rot.blif rot.txt rot.ex rot.bin
