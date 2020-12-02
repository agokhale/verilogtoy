`timescale 1ns/1ns
// model a 83.3333 ns clock @ ~12mhz
`define cfrq_mhz (12.0 * 2)
//periodicity is the lenght(ns) where the master frequency locks up with the ns
`define periodicity 125
`define cfrq_hz (`cfrq_mhz * 1000000.0)
`define ns_per_sec 1000000000.0
`define clockperiod_ns   (`ns_per_sec) / (`cfrq_hz )

`define sim_length_ns 1000000

`define timeslot_ns(A) ($floor( `clockperiod_ns * A ))
`define timeslot_nowterm(A) (($time % `periodicity) - `timeslot_ns(A) == 0)

module basicticker;
reg i;

	integer j;
initial
begin
	$dumpfile ("dumpfileclock.vcd");
	$dumpvars;
	$display ("hz %d",`cfrq_hz);
	$display ("period %f ns",`clockperiod_ns);
	for( j=3; j>=0; j = j-1) 
		$display ("timeslot %d %d ns",j,`timeslot_ns(j) );
	i=0;
	#`sim_length_ns $finish;
end
	always begin
		#1 if `timeslot_nowterm(2) i=~i;
		else if `timeslot_nowterm(1)  i=~i;
		else if `timeslot_nowterm(0)  i=~i;
	end

endmodule
