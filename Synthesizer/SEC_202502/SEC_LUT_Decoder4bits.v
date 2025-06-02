// Product (AN) Code SEC_LUT_Decoder
// SEC_LUT_Decoder4bits.v
// Received codeword W = AN + e, e is single arithmetic weight error (AWE), +2^i or -2^i.
module SEC_LUT_Decoder4bits(W, N);
input 	[13:0]	W;
output	[3:0]	N;
parameter A = 665;

wire 	[3:0]	Q;
wire 	[9:0]	R;
assign Q = W / A;
assign R = W - (A * Q);

reg	signed	[14:0]	Delta;
always@(*) begin
	case(R)
		1: Delta = 15'sb000000000000001;
		664: Delta = 15'sb111111111111111;
		2: Delta = 15'sb000000000000010;
		663: Delta = 15'sb111111111111110;
		4: Delta = 15'sb000000000000100;
		661: Delta = 15'sb111111111111100;
		8: Delta = 15'sb000000000001000;
		657: Delta = 15'sb111111111111000;
		16: Delta = 15'sb000000000010000;
		649: Delta = 15'sb111111111110000;
		32: Delta = 15'sb000000000100000;
		633: Delta = 15'sb111111111100000;
		64: Delta = 15'sb000000001000000;
		601: Delta = 15'sb111111111000000;
		128: Delta = 15'sb000000010000000;
		537: Delta = 15'sb111111110000000;
		256: Delta = 15'sb000000100000000;
		409: Delta = 15'sb111111100000000;
		512: Delta = 15'sb000001000000000;
		153: Delta = 15'sb111111000000000;
		359: Delta = 15'sb000010000000000;
		306: Delta = 15'sb111110000000000;
		53: Delta = 15'sb000100000000000;
		612: Delta = 15'sb111100000000000;
		106: Delta = 15'sb001000000000000;
		559: Delta = 15'sb111000000000000;
		212: Delta = 15'sb010000000000000;
		453: Delta = 15'sb110000000000000;
		default: Delta =15'sb0;
	endcase
end

assign N = (W - Delta) / A;

endmodule
