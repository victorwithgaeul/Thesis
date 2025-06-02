// Product (AN) Code SEC l-LUT
// SEC_lLUT12bits.v
// Received single error location l, output remainder r.
module SEC_lLUT12bits(l, r);
input	signed	[5:0]	l;
output	reg	[11:0]	r;
always@(*) begin
	case(l)
		1: r = 1;
		-1: r = 3348;
		2: r = 2;
		-2: r = 3347;
		3: r = 4;
		-3: r = 3345;
		4: r = 8;
		-4: r = 3341;
		5: r = 16;
		-5: r = 3333;
		6: r = 32;
		-6: r = 3317;
		7: r = 64;
		-7: r = 3285;
		8: r = 128;
		-8: r = 3221;
		9: r = 256;
		-9: r = 3093;
		10: r = 512;
		-10: r = 2837;
		11: r = 1024;
		-11: r = 2325;
		12: r = 2048;
		-12: r = 1301;
		13: r = 747;
		-13: r = 2602;
		14: r = 1494;
		-14: r = 1855;
		15: r = 2988;
		-15: r = 361;
		16: r = 2627;
		-16: r = 722;
		17: r = 1905;
		-17: r = 1444;
		18: r = 461;
		-18: r = 2888;
		19: r = 922;
		-19: r = 2427;
		20: r = 1844;
		-20: r = 1505;
		21: r = 339;
		-21: r = 3010;
		22: r = 678;
		-22: r = 2671;
		23: r = 1356;
		-23: r = 1993;
		24: r = 2712;
		-24: r = 637;
		default: r = 0;
	endcase
end

endmodule
