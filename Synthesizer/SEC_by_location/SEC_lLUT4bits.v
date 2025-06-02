// Product (AN) Code SEC l-LUT
// SEC_lLUT4bits.v
// Received single error location l, output remainder r.
module SEC_lLUT4bits(l, r);
input	signed	[4:0]	l;
output	reg	[9:0]	r;
always@(*) begin
	case(l)
		1: r = 1;
		-1: r = 654;
		2: r = 2;
		-2: r = 653;
		3: r = 4;
		-3: r = 651;
		4: r = 8;
		-4: r = 647;
		5: r = 16;
		-5: r = 639;
		6: r = 32;
		-6: r = 623;
		7: r = 64;
		-7: r = 591;
		8: r = 128;
		-8: r = 527;
		9: r = 256;
		-9: r = 399;
		10: r = 512;
		-10: r = 143;
		11: r = 369;
		-11: r = 286;
		12: r = 83;
		-12: r = 572;
		13: r = 166;
		-13: r = 489;
		14: r = 332;
		-14: r = 323;
		default: r = 0;
	endcase
end

endmodule
