// Product (AN) Code SEC r-LUT
// SEC_rLUT4bits.v
// Received remainder r, output single error location.
module SEC_rLUT4bits(r, l);
input 	[9:0]	r;
output	reg	signed	[4:0]	l;
always@(*) begin
	case(r)
		1: l = +1;
		654: l = -1;
		2: l = +2;
		653: l = -2;
		4: l = +3;
		651: l = -3;
		8: l = +4;
		647: l = -4;
		16: l = +5;
		639: l = -5;
		32: l = +6;
		623: l = -6;
		64: l = +7;
		591: l = -7;
		128: l = +8;
		527: l = -8;
		256: l = +9;
		399: l = -9;
		512: l = +10;
		143: l = -10;
		369: l = +11;
		286: l = -11;
		83: l = +12;
		572: l = -12;
		166: l = +13;
		489: l = -13;
		332: l = +14;
		323: l = -14;
		default: l = 0;
	endcase
end

endmodule
