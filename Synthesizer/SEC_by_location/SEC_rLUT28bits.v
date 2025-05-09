// Product (AN) Code SEC r-LUT
// SEC_rLUT28bits.v
// Received remainder r, output single error location.
module SEC_rLUT28bits(r, l);
input 	[14:0]	r;
output	reg	signed	[6:0]	l;
always@(*) begin
	case(r)
		1: l = +1;
		17618: l = -1;
		2: l = +2;
		17617: l = -2;
		4: l = +3;
		17615: l = -3;
		8: l = +4;
		17611: l = -4;
		16: l = +5;
		17603: l = -5;
		32: l = +6;
		17587: l = -6;
		64: l = +7;
		17555: l = -7;
		128: l = +8;
		17491: l = -8;
		256: l = +9;
		17363: l = -9;
		512: l = +10;
		17107: l = -10;
		1024: l = +11;
		16595: l = -11;
		2048: l = +12;
		15571: l = -12;
		4096: l = +13;
		13523: l = -13;
		8192: l = +14;
		9427: l = -14;
		16384: l = +15;
		1235: l = -15;
		15149: l = +16;
		2470: l = -16;
		12679: l = +17;
		4940: l = -17;
		7739: l = +18;
		9880: l = -18;
		15478: l = +19;
		2141: l = -19;
		13337: l = +20;
		4282: l = -20;
		9055: l = +21;
		8564: l = -21;
		491: l = +22;
		17128: l = -22;
		982: l = +23;
		16637: l = -23;
		1964: l = +24;
		15655: l = -24;
		3928: l = +25;
		13691: l = -25;
		7856: l = +26;
		9763: l = -26;
		15712: l = +27;
		1907: l = -27;
		13805: l = +28;
		3814: l = -28;
		9991: l = +29;
		7628: l = -29;
		2363: l = +30;
		15256: l = -30;
		4726: l = +31;
		12893: l = -31;
		9452: l = +32;
		8167: l = -32;
		1285: l = +33;
		16334: l = -33;
		2570: l = +34;
		15049: l = -34;
		5140: l = +35;
		12479: l = -35;
		10280: l = +36;
		7339: l = -36;
		2941: l = +37;
		14678: l = -37;
		5882: l = +38;
		11737: l = -38;
		11764: l = +39;
		5855: l = -39;
		5909: l = +40;
		11710: l = -40;
		11818: l = +41;
		5801: l = -41;
		6017: l = +42;
		11602: l = -42;
		12034: l = +43;
		5585: l = -43;
		default: l = 0;
	endcase
end

endmodule
