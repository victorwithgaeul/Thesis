// Product (AN) Code Conventional SECdecoder
// SECdecoder_location_28bits.v
// Used to do SEC by Galois Field, and corrected by location, not AWE
// Received remainder r, output error location.
module SECdecoder_location_28bits(r, l);
input 	[6:0]	r;
output	reg	signed	[6:0]	l;
always@(*) begin
	case(r)
		1: l = +1;
		2: l = +2;
		4: l = +3;
		8: l = +4;
		16: l = +5;
		32: l = +6;
		64: l = +7;
		45: l = +8;
		7: l = +9;
		14: l = +10;
		28: l = +11;
		56: l = +12;
		29: l = +13;
		58: l = +14;
		33: l = +15;
		66: l = +16;
		49: l = +17;
		15: l = +18;
		30: l = +19;
		60: l = +20;
		37: l = +21;
		74: l = +22;
		65: l = +23;
		47: l = +24;
		11: l = +25;
		22: l = +26;
		44: l = +27;
		5: l = +28;
		10: l = +29;
		20: l = +30;
		40: l = +31;
		80: l = +32;
		77: l = +33;
		71: l = +34;
		59: l = +35;
		35: l = +36;
		70: l = +37;
		57: l = +38;
		31: l = +39;
		62: l = +40;
		41: l = +41;
		82: l = -1;
		81: l = -2;
		79: l = -3;
		75: l = -4;
		67: l = -5;
		51: l = -6;
		19: l = -7;
		38: l = -8;
		76: l = -9;
		69: l = -10;
		55: l = -11;
		27: l = -12;
		54: l = -13;
		25: l = -14;
		50: l = -15;
		17: l = -16;
		34: l = -17;
		68: l = -18;
		53: l = -19;
		23: l = -20;
		46: l = -21;
		9: l = -22;
		18: l = -23;
		36: l = -24;
		72: l = -25;
		61: l = -26;
		39: l = -27;
		78: l = -28;
		73: l = -29;
		63: l = -30;
		43: l = -31;
		3: l = -32;
		6: l = -33;
		12: l = -34;
		24: l = -35;
		48: l = -36;
		13: l = -37;
		26: l = -38;
		52: l = -39;
		21: l = -40;
		42: l = -41;
		default: l = 0;
	endcase
end

endmodule
