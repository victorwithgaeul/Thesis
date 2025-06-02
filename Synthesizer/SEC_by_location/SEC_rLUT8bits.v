// Product (AN) Code SEC r-LUT
// SEC_rLUT8bits.v
// Received remainder r, output single error location.
module SEC_rLUT8bits(r, l);
input 	[10:0]	r;
output	reg	signed	[5:0]	l;
always@(*) begin
	case(r)
		1: l = +1;
		1938: l = -1;
		2: l = +2;
		1937: l = -2;
		4: l = +3;
		1935: l = -3;
		8: l = +4;
		1931: l = -4;
		16: l = +5;
		1923: l = -5;
		32: l = +6;
		1907: l = -6;
		64: l = +7;
		1875: l = -7;
		128: l = +8;
		1811: l = -8;
		256: l = +9;
		1683: l = -9;
		512: l = +10;
		1427: l = -10;
		1024: l = +11;
		915: l = -11;
		109: l = +12;
		1830: l = -12;
		218: l = +13;
		1721: l = -13;
		436: l = +14;
		1503: l = -14;
		872: l = +15;
		1067: l = -15;
		1744: l = +16;
		195: l = -16;
		1549: l = +17;
		390: l = -17;
		1159: l = +18;
		780: l = -18;
		379: l = +19;
		1560: l = -19;
		default: l = 0;
	endcase
end

endmodule
