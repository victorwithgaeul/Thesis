`timescale 1ns/1ps
module Tradeoff_8bits(clk, rst_n, W, found, N);

//=========================================================================
//   PARAMETER AND LOCALPARAM FOR FSM
//   W_BITS 要考慮 OVERFLOW 問題 : 19-bits + 2^18 + 2^17
//   N_BITS 也要考慮 OVERFLOW 問題
//=========================================================================
parameter A = 1939 , W_BITS = 20, A_BITS = 11 , N_BITS = 9 , L_BITS = 5;
localparam [2:0] idle=3'b000, pre=3'b001,load=3'b010, lLUT=3'b011, 
                 R2_stage=3'b100, rLUT=3'b101, out=3'b110, done=3'b111;
				 
//==========================================
//   INPUT AND OUTPUT DECLARATION
//==========================================
input clk, rst_n;
input   [W_BITS-1:0]   W;
output reg  [N_BITS-1:0]   N;
output reg  found;

reg [2:0] ps;

//==========================================
//    INSTANTIATE r-LUT l-LUT 
//==========================================
reg [A_BITS-1 :0] R2, R1;

wire signed [L_BITS:0] l_val;
SEC_rLUT8bits rLUT_inst (
    .r(R2),
    .l(l_val) 
);

reg signed [L_BITS:0] h1, h2;
wire  [A_BITS-1:0] r_val;
SEC_lLUT8bits lLUT_inst (
    .l(h1),
    .r(r_val) 
);

//==========================================
//    FUNCTION FOR |h1| |h2| value 
//==========================================
function [L_BITS:0] abs;
    input signed [L_BITS:0] val;
    abs = val[L_BITS] ? ~val + 1 : val;
endfunction

//==========================================
//    FSM for Trade-off Algorithm
//==========================================
reg     [L_BITS:0] H;
reg     s;              // 0 for -1, 1 for +1
reg 	[N_BITS-1:0]	Q;
reg 	[A_BITS-1:0]	R;


wire signed [A_BITS:0] decide;
assign decide = R - R1;

reg [W_BITS-1:0]  W_new;


always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        ps <= idle;
        R <= 0;
        Q <= 0;
        found <= 0;
        N <= 0;
        h1 <= 0;
        h2 <= 0;
        R1 <= 0;
        R2 <= 0;
    end
    else begin
        case(ps)
            idle: begin
                found <= 0;
                s <= 0;
                H <= 0;
                ps <= pre;
                end
			pre: begin
				Q <= W / A;
				ps <= load;
			end
            load: begin
                R <= W - (A * Q);
                h1 <= (s == 0) ? -(H + 1) : (H + 1); 
                ps <= lLUT;
                end
            lLUT: begin
                if(R == 0) begin
                    N <= Q;
                    found <= 1;
                    ps <= idle;
                end
                else begin
                    R1 <= r_val;
                    ps <= R2_stage;
                    end
                end
            R2_stage: begin
                R2 <= (decide < 0) ? (decide + A) : (decide);
                ps <= rLUT;
            end
            rLUT: begin
                h2 <= l_val;
                ps <= out;
                end
	    	out: begin
		  		W_new <= W - ((s ? 1 : -1) * (1 << (abs(h1) - 1))) - ((h2[L_BITS] ? -1 : 1) * (1 << (abs(h2) - 1)));
		  		ps <= done;
				end
            done: begin
                if(h2 != 0)begin
                   N <= W_new / A ;
                   found <= 1;
                   ps <= idle;
                end
                else begin
                    ps <= load; 
                    if (s == 0) 
                        s <= 1;
                    else begin 
                        s <= 0; 
                        H <= H + 1; 
                    end
                    if (H == (W_BITS - 1) && s == 1) begin
                        ps <= idle;     // not found
                        found <= 1;
                        N <= Q;
                    end
                end
            end
        endcase
    end
end
endmodule


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

// Product (AN) Code SEC l-LUT
// SEC_lLUT8bits.v
// Received single error location l, output remainder r.
module SEC_lLUT8bits(l, r);
input	signed	[5:0]	l;
output	reg	[10:0]	r;
always@(*) begin
	case(l)
		1: r = 1;
		-1: r = 1938;
		2: r = 2;
		-2: r = 1937;
		3: r = 4;
		-3: r = 1935;
		4: r = 8;
		-4: r = 1931;
		5: r = 16;
		-5: r = 1923;
		6: r = 32;
		-6: r = 1907;
		7: r = 64;
		-7: r = 1875;
		8: r = 128;
		-8: r = 1811;
		9: r = 256;
		-9: r = 1683;
		10: r = 512;
		-10: r = 1427;
		11: r = 1024;
		-11: r = 915;
		12: r = 109;
		-12: r = 1830;
		13: r = 218;
		-13: r = 1721;
		14: r = 436;
		-14: r = 1503;
		15: r = 872;
		-15: r = 1067;
		16: r = 1744;
		-16: r = 195;
		17: r = 1549;
		-17: r = 390;
		18: r = 1159;
		-18: r = 780;
		19: r = 379;
		-19: r = 1560;
		default: r = 0;
	endcase
end

endmodule
