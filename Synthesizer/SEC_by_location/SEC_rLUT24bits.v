// Product (AN) Code SEC r-LUT
// SEC_rLUT24bits.v
// Received remainder r, output single error location.
module SEC_rLUT24bits(r, l);
input 	[13:0]	r;
output	reg	signed	[6:0]	l;
always@(*) begin
	case(r)
		1: l = +1;
		13836: l = -1;
		2: l = +2;
		13835: l = -2;
		4: l = +3;
		13833: l = -3;
		8: l = +4;
		13829: l = -4;
		16: l = +5;
		13821: l = -5;
		32: l = +6;
		13805: l = -6;
		64: l = +7;
		13773: l = -7;
		128: l = +8;
		13709: l = -8;
		256: l = +9;
		13581: l = -9;
		512: l = +10;
		13325: l = -10;
		1024: l = +11;
		12813: l = -11;
		2048: l = +12;
		11789: l = -12;
		4096: l = +13;
		9741: l = -13;
		8192: l = +14;
		5645: l = -14;
		2547: l = +15;
		11290: l = -15;
		5094: l = +16;
		8743: l = -16;
		10188: l = +17;
		3649: l = -17;
		6539: l = +18;
		7298: l = -18;
		13078: l = +19;
		759: l = -19;
		12319: l = +20;
		1518: l = -20;
		10801: l = +21;
		3036: l = -21;
		7765: l = +22;
		6072: l = -22;
		1693: l = +23;
		12144: l = -23;
		3386: l = +24;
		10451: l = -24;
		6772: l = +25;
		7065: l = -25;
		13544: l = +26;
		293: l = -26;
		13251: l = +27;
		586: l = -27;
		12665: l = +28;
		1172: l = -28;
		11493: l = +29;
		2344: l = -29;
		9149: l = +30;
		4688: l = -30;
		4461: l = +31;
		9376: l = -31;
		8922: l = +32;
		4915: l = -32;
		4007: l = +33;
		9830: l = -33;
		8014: l = +34;
		5823: l = -34;
		2191: l = +35;
		11646: l = -35;
		4382: l = +36;
		9455: l = -36;
		8764: l = +37;
		5073: l = -37;
		3691: l = +38;
		10146: l = -38;
		default: l = 0;
	endcase
end

endmodule
