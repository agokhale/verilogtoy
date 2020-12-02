`timescale 1ns/1ns
// model a 83.3333 ns clock @ ~12mhz
`define cfrq_mhz (12.0)
//periodicity is the lenght(ns) where the master frequency locks up with the ns
`define periodicity 250
`define cfrq_hz (`cfrq_mhz * 1000000.0)
`define ns_per_sec 1000000000.0
`define clockperiod_ns   (`ns_per_sec) / (`cfrq_hz )

`define sim_length_ns 1000000

`define timeslot_ns(A) ($floor( `clockperiod_ns * A ))
`define timeslot_ns1 ($floor( `clockperiod_ns ) -1)

module basicticker;
reg i;

initial
begin
	$dumpfile ("dumpfileclock.vcd");
	$dumpvars;
	$display ("hz %d",`cfrq_hz);
	$display ("period %f ns",`clockperiod_ns);
	$display ("timeslot 0 %d ns",`timeslot_ns(0) );
	$display ("timeslot 1 %d ns",`timeslot_ns(1) );
	$display ("timeslot 2 %d ns",`timeslot_ns(2) );
	$display ("timeslot 3 %d ns",`timeslot_ns(3) );
	i=0;
	#`sim_length_ns $finish;
end
	always begin
		#1 if (($time % `periodicity) - `timeslot_ns(2) == 0) i=~i;
		else if (($time % `periodicity) - `timeslot_ns(1) == 0) i=~i;
		else if (($time % `periodicity) - `timeslot_ns(0) == 0) i=~i;
	end

endmodule
