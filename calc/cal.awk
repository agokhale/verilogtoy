#!/usr/bin/awk -f
BEGIN {
	clks[0] = 10;
	clks[1] = 12;
	clks[2] = 16;
	clks[3] = 20;
	clks[4] = 24;
	clks[5] = 25;
}
// {
	printf ("baud: %s\n", $1);
	for( i in clks) {
		ratio = (clks[i]*1000000)/ $1;
		printf ("	clk:%s divider:%s ", clks[i], ratio); 
		if ( floor ( ratio ) == ratio ) { 
			printf ( " -ven- %s ", floor(ratio) - ratio );
		}
		printf ("\n");
	}
}
