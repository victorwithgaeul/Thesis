`timescale 1ns/1ps
module Tradeoff_30bits(clk, rst_n, W, found, N);

//=========================================================================
//   PARAMETER AND LOCALPARAM FOR FSM
//   W_BITS 要考慮 OVERFLOW 問題
//   N_BITS 也要考慮 OVERFLOW 問題
//=========================================================================
parameter A = 18613 , W_BITS = 46, A_BITS = 15 , N_BITS = 31 , L_BITS = 6;
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
SEC_rLUT30bits rLUT_inst (
    .r(R2),
    .l(l_val) 
);

reg signed [L_BITS:0] h1, h2;
wire  [A_BITS-1:0] r_val;
SEC_lLUT30bits lLUT_inst (
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
// SEC_lLUT30bits.v
// Received single error location l, output remainder r.
module SEC_lLUT30bits(l, r);
input	signed	[6:0]	l;
output	reg	[14:0]	r;
always@(*) begin
	case(l)
		1: r = 1;
		-1: r = 18612;
		2: r = 2;
		-2: r = 18611;
		3: r = 4;
		-3: r = 18609;
		4: r = 8;
		-4: r = 18605;
		5: r = 16;
		-5: r = 18597;
		6: r = 32;
		-6: r = 18581;
		7: r = 64;
		-7: r = 18549;
		8: r = 128;
		-8: r = 18485;
		9: r = 256;
		-9: r = 18357;
		10: r = 512;
		-10: r = 18101;
		11: r = 1024;
		-11: r = 17589;
		12: r = 2048;
		-12: r = 16565;
		13: r = 4096;
		-13: r = 14517;
		14: r = 8192;
		-14: r = 10421;
		15: r = 16384;
		-15: r = 2229;
		16: r = 14155;
		-16: r = 4458;
		17: r = 9697;
		-17: r = 8916;
		18: r = 781;
		-18: r = 17832;
		19: r = 1562;
		-19: r = 17051;
		20: r = 3124;
		-20: r = 15489;
		21: r = 6248;
		-21: r = 12365;
		22: r = 12496;
		-22: r = 6117;
		23: r = 6379;
		-23: r = 12234;
		24: r = 12758;
		-24: r = 5855;
		25: r = 6903;
		-25: r = 11710;
		26: r = 13806;
		-26: r = 4807;
		27: r = 8999;
		-27: r = 9614;
		28: r = 17998;
		-28: r = 615;
		29: r = 17383;
		-29: r = 1230;
		30: r = 16153;
		-30: r = 2460;
		31: r = 13693;
		-31: r = 4920;
		32: r = 8773;
		-32: r = 9840;
		33: r = 17546;
		-33: r = 1067;
		34: r = 16479;
		-34: r = 2134;
		35: r = 14345;
		-35: r = 4268;
		36: r = 10077;
		-36: r = 8536;
		37: r = 1541;
		-37: r = 17072;
		38: r = 3082;
		-38: r = 15531;
		39: r = 6164;
		-39: r = 12449;
		40: r = 12328;
		-40: r = 6285;
		41: r = 6043;
		-41: r = 12570;
		42: r = 12086;
		-42: r = 6527;
		43: r = 5559;
		-43: r = 13054;
		44: r = 11118;
		-44: r = 7495;
		45: r = 3623;
		-45: r = 14990;
		default: r = 0;
	endcase
end

endmodule

// Product (AN) Code SEC r-LUT
// SEC_rLUT30bits.v
// Received remainder r, output single error location.
module SEC_rLUT30bits(r, l);
input 	[14:0]	r;
output	reg	signed	[6:0]	l;
always@(*) begin
	case(r)
		1: l = +1;
		18612: l = -1;
		2: l = +2;
		18611: l = -2;
		4: l = +3;
		18609: l = -3;
		8: l = +4;
		18605: l = -4;
		16: l = +5;
		18597: l = -5;
		32: l = +6;
		18581: l = -6;
		64: l = +7;
		18549: l = -7;
		128: l = +8;
		18485: l = -8;
		256: l = +9;
		18357: l = -9;
		512: l = +10;
		18101: l = -10;
		1024: l = +11;
		17589: l = -11;
		2048: l = +12;
		16565: l = -12;
		4096: l = +13;
		14517: l = -13;
		8192: l = +14;
		10421: l = -14;
		16384: l = +15;
		2229: l = -15;
		14155: l = +16;
		4458: l = -16;
		9697: l = +17;
		8916: l = -17;
		781: l = +18;
		17832: l = -18;
		1562: l = +19;
		17051: l = -19;
		3124: l = +20;
		15489: l = -20;
		6248: l = +21;
		12365: l = -21;
		12496: l = +22;
		6117: l = -22;
		6379: l = +23;
		12234: l = -23;
		12758: l = +24;
		5855: l = -24;
		6903: l = +25;
		11710: l = -25;
		13806: l = +26;
		4807: l = -26;
		8999: l = +27;
		9614: l = -27;
		17998: l = +28;
		615: l = -28;
		17383: l = +29;
		1230: l = -29;
		16153: l = +30;
		2460: l = -30;
		13693: l = +31;
		4920: l = -31;
		8773: l = +32;
		9840: l = -32;
		17546: l = +33;
		1067: l = -33;
		16479: l = +34;
		2134: l = -34;
		14345: l = +35;
		4268: l = -35;
		10077: l = +36;
		8536: l = -36;
		1541: l = +37;
		17072: l = -37;
		3082: l = +38;
		15531: l = -38;
		6164: l = +39;
		12449: l = -39;
		12328: l = +40;
		6285: l = -40;
		6043: l = +41;
		12570: l = -41;
		12086: l = +42;
		6527: l = -42;
		5559: l = +43;
		13054: l = -43;
		11118: l = +44;
		7495: l = -44;
		3623: l = +45;
		14990: l = -45;
		default: l = 0;
	endcase
end

endmodule
