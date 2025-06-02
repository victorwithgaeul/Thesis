`timescale 1ns/1ps
module Tradeoff_28bits(clk, rst_n, W, found, N);

//=========================================================================
//   PARAMETER AND LOCALPARAM FOR FSM
//   W_BITS 要考慮 OVERFLOW 問題
//   N_BITS 也要考慮 OVERFLOW 問題
//=========================================================================
parameter A = 17619 , W_BITS = 44, A_BITS = 15 , N_BITS = 29 , L_BITS = 6;
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
SEC_rLUT28bits rLUT_inst (
    .r(R2),
    .l(l_val) 
);

reg signed [L_BITS:0] h1, h2;
wire  [A_BITS-1:0] r_val;
SEC_lLUT28bits lLUT_inst (
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
// SEC_lLUT28bits.v
// Received single error location l, output remainder r.
module SEC_lLUT28bits(l, r);
input	signed	[6:0]	l;
output	reg	[14:0]	r;
always@(*) begin
	case(l)
		1: r = 1;
		-1: r = 17618;
		2: r = 2;
		-2: r = 17617;
		3: r = 4;
		-3: r = 17615;
		4: r = 8;
		-4: r = 17611;
		5: r = 16;
		-5: r = 17603;
		6: r = 32;
		-6: r = 17587;
		7: r = 64;
		-7: r = 17555;
		8: r = 128;
		-8: r = 17491;
		9: r = 256;
		-9: r = 17363;
		10: r = 512;
		-10: r = 17107;
		11: r = 1024;
		-11: r = 16595;
		12: r = 2048;
		-12: r = 15571;
		13: r = 4096;
		-13: r = 13523;
		14: r = 8192;
		-14: r = 9427;
		15: r = 16384;
		-15: r = 1235;
		16: r = 15149;
		-16: r = 2470;
		17: r = 12679;
		-17: r = 4940;
		18: r = 7739;
		-18: r = 9880;
		19: r = 15478;
		-19: r = 2141;
		20: r = 13337;
		-20: r = 4282;
		21: r = 9055;
		-21: r = 8564;
		22: r = 491;
		-22: r = 17128;
		23: r = 982;
		-23: r = 16637;
		24: r = 1964;
		-24: r = 15655;
		25: r = 3928;
		-25: r = 13691;
		26: r = 7856;
		-26: r = 9763;
		27: r = 15712;
		-27: r = 1907;
		28: r = 13805;
		-28: r = 3814;
		29: r = 9991;
		-29: r = 7628;
		30: r = 2363;
		-30: r = 15256;
		31: r = 4726;
		-31: r = 12893;
		32: r = 9452;
		-32: r = 8167;
		33: r = 1285;
		-33: r = 16334;
		34: r = 2570;
		-34: r = 15049;
		35: r = 5140;
		-35: r = 12479;
		36: r = 10280;
		-36: r = 7339;
		37: r = 2941;
		-37: r = 14678;
		38: r = 5882;
		-38: r = 11737;
		39: r = 11764;
		-39: r = 5855;
		40: r = 5909;
		-40: r = 11710;
		41: r = 11818;
		-41: r = 5801;
		42: r = 6017;
		-42: r = 11602;
		43: r = 12034;
		-43: r = 5585;
		default: r = 0;
	endcase
end

endmodule

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
