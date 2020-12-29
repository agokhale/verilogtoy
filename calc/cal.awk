#!/usr/bin/awk -f
BEGIN {
	clks[0] = 10;
	clks[1] = 12;
	clks[2] = 16;
	clks[3] = 20;
	clks[4] = 24;
}
// {
	printf ("baud: %s\n", $1);
	for( i in clks) {
		printf ("	clk:%s divider:%s\n", clks[i], (clks[i]*1000000)/ $1); 
	}
}
