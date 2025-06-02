// Product (AN) Code Decoder
// AN_Code_Decoder13.v
// Received codeword W = AN + e, e is single arithmetic weight error (AWE), +2^i or -2^i.
module ProductDecoder(W, N);
input 	[5:0]	W;
output	[1:0]	N;
parameter A = 13;

wire 	[1:0]	Q;
wire 	[3:0]	R;
assign Q = W / A;
assign R = W - (A * Q);

reg 	[5:0]	Delta;
always@(*) begin
	case(R)
		1: Delta = 1;
		2: Delta = 2;
		4: Delta = 4;
		8: Delta = 8;
		3: Delta = 16;
		6: Delta = 32;
		12: Delta = -1;
		11: Delta = -2;
		9: Delta = -4;
		5: Delta = -8;
		10: Delta = -16;
		7: Delta = -32;
	endcase
end

assign N = (W - Delta) / A;

endmodule
