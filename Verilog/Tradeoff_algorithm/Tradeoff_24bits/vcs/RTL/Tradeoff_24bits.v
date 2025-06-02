`timescale 1ns/1ps
module Tradeoff_24bits(clk, rst_n, W, found, N);

//=========================================================================
//   PARAMETER AND LOCALPARAM FOR FSM
//   W_BITS 要考慮 OVERFLOW 問題
//   N_BITS 也要考慮 OVERFLOW 問題
//=========================================================================
parameter A = 13837 , W_BITS = 39, A_BITS = 14 , N_BITS = 25 , L_BITS = 6;
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
SEC_rLUT24bits rLUT_inst (
    .r(R2),
    .l(l_val) 
);

reg signed [L_BITS:0] h1, h2;
wire  [A_BITS-1:0] r_val;
SEC_lLUT24bits lLUT_inst (
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
// SEC_lLUT24bits.v
// Received single error location l, output remainder r.
module SEC_lLUT24bits(l, r);
input	signed	[6:0]	l;
output	reg	[13:0]	r;
always@(*) begin
	case(l)
		1: r = 1;
		-1: r = 13836;
		2: r = 2;
		-2: r = 13835;
		3: r = 4;
		-3: r = 13833;
		4: r = 8;
		-4: r = 13829;
		5: r = 16;
		-5: r = 13821;
		6: r = 32;
		-6: r = 13805;
		7: r = 64;
		-7: r = 13773;
		8: r = 128;
		-8: r = 13709;
		9: r = 256;
		-9: r = 13581;
		10: r = 512;
		-10: r = 13325;
		11: r = 1024;
		-11: r = 12813;
		12: r = 2048;
		-12: r = 11789;
		13: r = 4096;
		-13: r = 9741;
		14: r = 8192;
		-14: r = 5645;
		15: r = 2547;
		-15: r = 11290;
		16: r = 5094;
		-16: r = 8743;
		17: r = 10188;
		-17: r = 3649;
		18: r = 6539;
		-18: r = 7298;
		19: r = 13078;
		-19: r = 759;
		20: r = 12319;
		-20: r = 1518;
		21: r = 10801;
		-21: r = 3036;
		22: r = 7765;
		-22: r = 6072;
		23: r = 1693;
		-23: r = 12144;
		24: r = 3386;
		-24: r = 10451;
		25: r = 6772;
		-25: r = 7065;
		26: r = 13544;
		-26: r = 293;
		27: r = 13251;
		-27: r = 586;
		28: r = 12665;
		-28: r = 1172;
		29: r = 11493;
		-29: r = 2344;
		30: r = 9149;
		-30: r = 4688;
		31: r = 4461;
		-31: r = 9376;
		32: r = 8922;
		-32: r = 4915;
		33: r = 4007;
		-33: r = 9830;
		34: r = 8014;
		-34: r = 5823;
		35: r = 2191;
		-35: r = 11646;
		36: r = 4382;
		-36: r = 9455;
		37: r = 8764;
		-37: r = 5073;
		38: r = 3691;
		-38: r = 10146;
		default: r = 0;
	endcase
end

endmodule

// Product (AN) Code SEC r-LUT
// SEC_rLUT24bits.v
// Received remainder r, output single error location.
module SEC_rLUT24bits(r, l);
input 	[13:0]	r;
output	reg	signed	[6:0]	l;
always@(*) begin
	case(r)
		1: l = +1;
		13836: l = -1;
		2: l = +2;
		13835: l = -2;
		4: l = +3;
		13833: l = -3;
		8: l = +4;
		13829: l = -4;
		16: l = +5;
		13821: l = -5;
		32: l = +6;
		13805: l = -6;
		64: l = +7;
		13773: l = -7;
		128: l = +8;
		13709: l = -8;
		256: l = +9;
		13581: l = -9;
		512: l = +10;
		13325: l = -10;
		1024: l = +11;
		12813: l = -11;
		2048: l = +12;
		11789: l = -12;
		4096: l = +13;
		9741: l = -13;
		8192: l = +14;
		5645: l = -14;
		2547: l = +15;
		11290: l = -15;
		5094: l = +16;
		8743: l = -16;
		10188: l = +17;
		3649: l = -17;
		6539: l = +18;
		7298: l = -18;
		13078: l = +19;
		759: l = -19;
		12319: l = +20;
		1518: l = -20;
		10801: l = +21;
		3036: l = -21;
		7765: l = +22;
		6072: l = -22;
		1693: l = +23;
		12144: l = -23;
		3386: l = +24;
		10451: l = -24;
		6772: l = +25;
		7065: l = -25;
		13544: l = +26;
		293: l = -26;
		13251: l = +27;
		586: l = -27;
		12665: l = +28;
		1172: l = -28;
		11493: l = +29;
		2344: l = -29;
		9149: l = +30;
		4688: l = -30;
		4461: l = +31;
		9376: l = -31;
		8922: l = +32;
		4915: l = -32;
		4007: l = +33;
		9830: l = -33;
		8014: l = +34;
		5823: l = -34;
		2191: l = +35;
		11646: l = -35;
		4382: l = +36;
		9455: l = -36;
		8764: l = +37;
		5073: l = -37;
		3691: l = +38;
		10146: l = -38;
		default: l = 0;
	endcase
end

endmodule
