`timescale 1ns/1ps
module Tradeoff_12bits(clk, rst_n, W, found, N);

//=========================================================================
//   PARAMETER AND LOCALPARAM FOR FSM
//   W_BITS 要考慮 OVERFLOW 問題
//   N_BITS 也要考慮 OVERFLOW 問題
//=========================================================================
parameter A = 3349 , W_BITS = 25, A_BITS = 12 , N_BITS = 13 , L_BITS = 5;
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
SEC_rLUT12bits rLUT_inst (
    .r(R2),
    .l(l_val) 
);

reg signed [L_BITS:0] h1, h2;
wire  [A_BITS-1:0] r_val;
SEC_lLUT12bits lLUT_inst (
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
// SEC_rLUT12bits.v
// Received remainder r, output single error location.
module SEC_rLUT12bits(r, l);
input 	[11:0]	r;
output	reg	signed	[5:0]	l;
always@(*) begin
	case(r)
		1: l = +1;
		3348: l = -1;
		2: l = +2;
		3347: l = -2;
		4: l = +3;
		3345: l = -3;
		8: l = +4;
		3341: l = -4;
		16: l = +5;
		3333: l = -5;
		32: l = +6;
		3317: l = -6;
		64: l = +7;
		3285: l = -7;
		128: l = +8;
		3221: l = -8;
		256: l = +9;
		3093: l = -9;
		512: l = +10;
		2837: l = -10;
		1024: l = +11;
		2325: l = -11;
		2048: l = +12;
		1301: l = -12;
		747: l = +13;
		2602: l = -13;
		1494: l = +14;
		1855: l = -14;
		2988: l = +15;
		361: l = -15;
		2627: l = +16;
		722: l = -16;
		1905: l = +17;
		1444: l = -17;
		461: l = +18;
		2888: l = -18;
		922: l = +19;
		2427: l = -19;
		1844: l = +20;
		1505: l = -20;
		339: l = +21;
		3010: l = -21;
		678: l = +22;
		2671: l = -22;
		1356: l = +23;
		1993: l = -23;
		2712: l = +24;
		637: l = -24;
		default: l = 0;
	endcase
end

endmodule


// Product (AN) Code SEC l-LUT
// SEC_lLUT12bits.v
// Received single error location l, output remainder r.
module SEC_lLUT12bits(l, r);
input	signed	[5:0]	l;
output	reg	[11:0]	r;
always@(*) begin
	case(l)
		1: r = 1;
		-1: r = 3348;
		2: r = 2;
		-2: r = 3347;
		3: r = 4;
		-3: r = 3345;
		4: r = 8;
		-4: r = 3341;
		5: r = 16;
		-5: r = 3333;
		6: r = 32;
		-6: r = 3317;
		7: r = 64;
		-7: r = 3285;
		8: r = 128;
		-8: r = 3221;
		9: r = 256;
		-9: r = 3093;
		10: r = 512;
		-10: r = 2837;
		11: r = 1024;
		-11: r = 2325;
		12: r = 2048;
		-12: r = 1301;
		13: r = 747;
		-13: r = 2602;
		14: r = 1494;
		-14: r = 1855;
		15: r = 2988;
		-15: r = 361;
		16: r = 2627;
		-16: r = 722;
		17: r = 1905;
		-17: r = 1444;
		18: r = 461;
		-18: r = 2888;
		19: r = 922;
		-19: r = 2427;
		20: r = 1844;
		-20: r = 1505;
		21: r = 339;
		-21: r = 3010;
		22: r = 678;
		-22: r = 2671;
		23: r = 1356;
		-23: r = 1993;
		24: r = 2712;
		-24: r = 637;
		default: r = 0;
	endcase
end

endmodule
