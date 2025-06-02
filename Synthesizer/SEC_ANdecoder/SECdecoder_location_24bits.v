// Product (AN) Code Conventional SECdecoder
// SECdecoder_location_24bits.v
// Used to do SEC by Galois Field, and corrected by location, not AWE
// Received remainder r, output error location.
module SECdecoder_location_24bits(r, l);
input 	[6:0]	r;
output	reg	signed	[5:0]	l;
always@(*) begin
	case(r)
		1: l = +1;
		2: l = +2;
		4: l = +3;
		8: l = +4;
		16: l = +5;
		32: l = +6;
		64: l = +7;
		61: l = +8;
		55: l = +9;
		43: l = +10;
		19: l = +11;
		38: l = +12;
		9: l = +13;
		18: l = +14;
		36: l = +15;
		5: l = +16;
		10: l = +17;
		20: l = +18;
		40: l = +19;
		13: l = +20;
		26: l = +21;
		52: l = +22;
		37: l = +23;
		7: l = +24;
		14: l = +25;
		28: l = +26;
		56: l = +27;
		45: l = +28;
		23: l = +29;
		46: l = +30;
		25: l = +31;
		50: l = +32;
		33: l = +33;
		66: l = -1;
		65: l = -2;
		63: l = -3;
		59: l = -4;
		51: l = -5;
		35: l = -6;
		3: l = -7;
		6: l = -8;
		12: l = -9;
		24: l = -10;
		48: l = -11;
		29: l = -12;
		58: l = -13;
		49: l = -14;
		31: l = -15;
		62: l = -16;
		57: l = -17;
		47: l = -18;
		27: l = -19;
		54: l = -20;
		41: l = -21;
		15: l = -22;
		30: l = -23;
		60: l = -24;
		53: l = -25;
		39: l = -26;
		11: l = -27;
		22: l = -28;
		44: l = -29;
		21: l = -30;
		42: l = -31;
		17: l = -32;
		34: l = -33;
		default: l = 0;
	endcase
end

endmodule
