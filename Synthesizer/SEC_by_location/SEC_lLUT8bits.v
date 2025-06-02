// Product (AN) Code SEC l-LUT
// SEC_lLUT8bits.v
// Received single error location l, output remainder r.
module SEC_lLUT8bits(l, r);
input	signed	[5:0]	l;
output	reg	[10:0]	r;
always@(*) begin
	case(l)
		1: r = 1;
		-1: r = 1938;
		2: r = 2;
		-2: r = 1937;
		3: r = 4;
		-3: r = 1935;
		4: r = 8;
		-4: r = 1931;
		5: r = 16;
		-5: r = 1923;
		6: r = 32;
		-6: r = 1907;
		7: r = 64;
		-7: r = 1875;
		8: r = 128;
		-8: r = 1811;
		9: r = 256;
		-9: r = 1683;
		10: r = 512;
		-10: r = 1427;
		11: r = 1024;
		-11: r = 915;
		12: r = 109;
		-12: r = 1830;
		13: r = 218;
		-13: r = 1721;
		14: r = 436;
		-14: r = 1503;
		15: r = 872;
		-15: r = 1067;
		16: r = 1744;
		-16: r = 195;
		17: r = 1549;
		-17: r = 390;
		18: r = 1159;
		-18: r = 780;
		19: r = 379;
		-19: r = 1560;
		default: r = 0;
	endcase
end

endmodule
