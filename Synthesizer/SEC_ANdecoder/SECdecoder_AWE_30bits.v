// Product (AN) Code Conventional SECdecoder
// SECdecoder_AWE_30bits.v
// Used to do SEC by Galois Field, and corrected AWE
// Received remainder r, output single AWE.
module SECdecoder_AWE_30bits(r, AWE);
input 	[6:0]	r;
output	reg	signed	[41:0]	AWE;
always@(*) begin
	case(r)
		1: AWE = +(1 << 0);
		2: AWE = +(1 << 1);
		4: AWE = +(1 << 2);
		8: AWE = +(1 << 3);
		16: AWE = +(1 << 4);
		32: AWE = +(1 << 5);
		64: AWE = +(1 << 6);
		45: AWE = +(1 << 7);
		7: AWE = +(1 << 8);
		14: AWE = +(1 << 9);
		28: AWE = +(1 << 10);
		56: AWE = +(1 << 11);
		29: AWE = +(1 << 12);
		58: AWE = +(1 << 13);
		33: AWE = +(1 << 14);
		66: AWE = +(1 << 15);
		49: AWE = +(1 << 16);
		15: AWE = +(1 << 17);
		30: AWE = +(1 << 18);
		60: AWE = +(1 << 19);
		37: AWE = +(1 << 20);
		74: AWE = +(1 << 21);
		65: AWE = +(1 << 22);
		47: AWE = +(1 << 23);
		11: AWE = +(1 << 24);
		22: AWE = +(1 << 25);
		44: AWE = +(1 << 26);
		5: AWE = +(1 << 27);
		10: AWE = +(1 << 28);
		20: AWE = +(1 << 29);
		40: AWE = +(1 << 30);
		80: AWE = +(1 << 31);
		77: AWE = +(1 << 32);
		71: AWE = +(1 << 33);
		59: AWE = +(1 << 34);
		35: AWE = +(1 << 35);
		70: AWE = +(1 << 36);
		57: AWE = +(1 << 37);
		31: AWE = +(1 << 38);
		62: AWE = +(1 << 39);
		41: AWE = +(1 << 40);
		82: AWE = -(1 << 0);
		81: AWE = -(1 << 1);
		79: AWE = -(1 << 2);
		75: AWE = -(1 << 3);
		67: AWE = -(1 << 4);
		51: AWE = -(1 << 5);
		19: AWE = -(1 << 6);
		38: AWE = -(1 << 7);
		76: AWE = -(1 << 8);
		69: AWE = -(1 << 9);
		55: AWE = -(1 << 10);
		27: AWE = -(1 << 11);
		54: AWE = -(1 << 12);
		25: AWE = -(1 << 13);
		50: AWE = -(1 << 14);
		17: AWE = -(1 << 15);
		34: AWE = -(1 << 16);
		68: AWE = -(1 << 17);
		53: AWE = -(1 << 18);
		23: AWE = -(1 << 19);
		46: AWE = -(1 << 20);
		9: AWE = -(1 << 21);
		18: AWE = -(1 << 22);
		36: AWE = -(1 << 23);
		72: AWE = -(1 << 24);
		61: AWE = -(1 << 25);
		39: AWE = -(1 << 26);
		78: AWE = -(1 << 27);
		73: AWE = -(1 << 28);
		63: AWE = -(1 << 29);
		43: AWE = -(1 << 30);
		3: AWE = -(1 << 31);
		6: AWE = -(1 << 32);
		12: AWE = -(1 << 33);
		24: AWE = -(1 << 34);
		48: AWE = -(1 << 35);
		13: AWE = -(1 << 36);
		26: AWE = -(1 << 37);
		52: AWE = -(1 << 38);
		21: AWE = -(1 << 39);
		42: AWE = -(1 << 40);
		default: AWE = 0;
	endcase
end

endmodule
