// Product (AN) Code SEC r-LUT
// SEC_rLUT12bits.v
// Received remainder r, output single error location.
module SEC_rLUT12bits(r, l);
input 	[11:0]	r;
output	reg	signed	[5:0]	l;
always@(*) begin
	case(r)
		1: l = +1;
		3348: l = -1;
		2: l = +2;
		3347: l = -2;
		4: l = +3;
		3345: l = -3;
		8: l = +4;
		3341: l = -4;
		16: l = +5;
		3333: l = -5;
		32: l = +6;
		3317: l = -6;
		64: l = +7;
		3285: l = -7;
		128: l = +8;
		3221: l = -8;
		256: l = +9;
		3093: l = -9;
		512: l = +10;
		2837: l = -10;
		1024: l = +11;
		2325: l = -11;
		2048: l = +12;
		1301: l = -12;
		747: l = +13;
		2602: l = -13;
		1494: l = +14;
		1855: l = -14;
		2988: l = +15;
		361: l = -15;
		2627: l = +16;
		722: l = -16;
		1905: l = +17;
		1444: l = -17;
		461: l = +18;
		2888: l = -18;
		922: l = +19;
		2427: l = -19;
		1844: l = +20;
		1505: l = -20;
		339: l = +21;
		3010: l = -21;
		678: l = +22;
		2671: l = -22;
		1356: l = +23;
		1993: l = -23;
		2712: l = +24;
		637: l = -24;
		default: l = 0;
	endcase
end

endmodule
