`timescale 1ns/1ps
module Tradeoff_20bits(clk, rst_n, W, found, N);

//=========================================================================
//   PARAMETER AND LOCALPARAM FOR FSM
//   W_BITS 要考慮 OVERFLOW 問題
//   N_BITS 也要考慮 OVERFLOW 問題
//=========================================================================
parameter A = 6311 , W_BITS = 34, A_BITS = 13 , N_BITS = 21 , L_BITS = 6;
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
SEC_rLUT20bits rLUT_inst (
    .r(R2),
    .l(l_val) 
);

reg signed [L_BITS:0] h1, h2;
wire  [A_BITS-1:0] r_val;
SEC_lLUT20bits lLUT_inst (
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


// Product (AN) Code SEC l-LUT
// SEC_lLUT20bits.v
// Received single error location l, output remainder r.
module SEC_lLUT20bits(l, r);
input	signed	[6:0]	l;
output	reg	[12:0]	r;
always@(*) begin
	case(l)
		1: r = 1;
		-1: r = 6310;
		2: r = 2;
		-2: r = 6309;
		3: r = 4;
		-3: r = 6307;
		4: r = 8;
		-4: r = 6303;
		5: r = 16;
		-5: r = 6295;
		6: r = 32;
		-6: r = 6279;
		7: r = 64;
		-7: r = 6247;
		8: r = 128;
		-8: r = 6183;
		9: r = 256;
		-9: r = 6055;
		10: r = 512;
		-10: r = 5799;
		11: r = 1024;
		-11: r = 5287;
		12: r = 2048;
		-12: r = 4263;
		13: r = 4096;
		-13: r = 2215;
		14: r = 1881;
		-14: r = 4430;
		15: r = 3762;
		-15: r = 2549;
		16: r = 1213;
		-16: r = 5098;
		17: r = 2426;
		-17: r = 3885;
		18: r = 4852;
		-18: r = 1459;
		19: r = 3393;
		-19: r = 2918;
		20: r = 475;
		-20: r = 5836;
		21: r = 950;
		-21: r = 5361;
		22: r = 1900;
		-22: r = 4411;
		23: r = 3800;
		-23: r = 2511;
		24: r = 1289;
		-24: r = 5022;
		25: r = 2578;
		-25: r = 3733;
		26: r = 5156;
		-26: r = 1155;
		27: r = 4001;
		-27: r = 2310;
		28: r = 1691;
		-28: r = 4620;
		29: r = 3382;
		-29: r = 2929;
		30: r = 453;
		-30: r = 5858;
		31: r = 906;
		-31: r = 5405;
		32: r = 1812;
		-32: r = 4499;
		33: r = 3624;
		-33: r = 2687;
		default: r = 0;
	endcase
end

endmodule

// Product (AN) Code SEC r-LUT
// SEC_rLUT20bits.v
// Received remainder r, output single error location.
module SEC_rLUT20bits(r, l);
input 	[12:0]	r;
output	reg	signed	[6:0]	l;
always@(*) begin
	case(r)
		1: l = +1;
		6310: l = -1;
		2: l = +2;
		6309: l = -2;
		4: l = +3;
		6307: l = -3;
		8: l = +4;
		6303: l = -4;
		16: l = +5;
		6295: l = -5;
		32: l = +6;
		6279: l = -6;
		64: l = +7;
		6247: l = -7;
		128: l = +8;
		6183: l = -8;
		256: l = +9;
		6055: l = -9;
		512: l = +10;
		5799: l = -10;
		1024: l = +11;
		5287: l = -11;
		2048: l = +12;
		4263: l = -12;
		4096: l = +13;
		2215: l = -13;
		1881: l = +14;
		4430: l = -14;
		3762: l = +15;
		2549: l = -15;
		1213: l = +16;
		5098: l = -16;
		2426: l = +17;
		3885: l = -17;
		4852: l = +18;
		1459: l = -18;
		3393: l = +19;
		2918: l = -19;
		475: l = +20;
		5836: l = -20;
		950: l = +21;
		5361: l = -21;
		1900: l = +22;
		4411: l = -22;
		3800: l = +23;
		2511: l = -23;
		1289: l = +24;
		5022: l = -24;
		2578: l = +25;
		3733: l = -25;
		5156: l = +26;
		1155: l = -26;
		4001: l = +27;
		2310: l = -27;
		1691: l = +28;
		4620: l = -28;
		3382: l = +29;
		2929: l = -29;
		453: l = +30;
		5858: l = -30;
		906: l = +31;
		5405: l = -31;
		1812: l = +32;
		4499: l = -32;
		3624: l = +33;
		2687: l = -33;
		default: l = 0;
	endcase
end

endmodule
