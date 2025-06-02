`timescale 1ns/1ps
module Tradeoff_16bits(clk, rst_n, W, found, N);

//=========================================================================
//   PARAMETER AND LOCALPARAM FOR FSM
//   W_BITS 要考慮 OVERFLOW 問題
//   N_BITS 也要考慮 OVERFLOW 問題
//=========================================================================
parameter A = 4547 , W_BITS = 30, A_BITS = 13 , N_BITS = 17 , L_BITS = 5;
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
SEC_rLUT16bits rLUT_inst (
    .r(R2),
    .l(l_val) 
);

reg signed [L_BITS:0] h1, h2;
wire  [A_BITS-1:0] r_val;
SEC_lLUT16bits lLUT_inst (
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
// SEC_lLUT16bits.v
// Received single error location l, output remainder r.
module SEC_lLUT16bits(l, r);
input	signed	[5:0]	l;
output	reg	[12:0]	r;
always@(*) begin
	case(l)
		1: r = 1;
		-1: r = 4546;
		2: r = 2;
		-2: r = 4545;
		3: r = 4;
		-3: r = 4543;
		4: r = 8;
		-4: r = 4539;
		5: r = 16;
		-5: r = 4531;
		6: r = 32;
		-6: r = 4515;
		7: r = 64;
		-7: r = 4483;
		8: r = 128;
		-8: r = 4419;
		9: r = 256;
		-9: r = 4291;
		10: r = 512;
		-10: r = 4035;
		11: r = 1024;
		-11: r = 3523;
		12: r = 2048;
		-12: r = 2499;
		13: r = 4096;
		-13: r = 451;
		14: r = 3645;
		-14: r = 902;
		15: r = 2743;
		-15: r = 1804;
		16: r = 939;
		-16: r = 3608;
		17: r = 1878;
		-17: r = 2669;
		18: r = 3756;
		-18: r = 791;
		19: r = 2965;
		-19: r = 1582;
		20: r = 1383;
		-20: r = 3164;
		21: r = 2766;
		-21: r = 1781;
		22: r = 985;
		-22: r = 3562;
		23: r = 1970;
		-23: r = 2577;
		24: r = 3940;
		-24: r = 607;
		25: r = 3333;
		-25: r = 1214;
		26: r = 2119;
		-26: r = 2428;
		27: r = 4238;
		-27: r = 309;
		28: r = 3929;
		-28: r = 618;
		29: r = 3311;
		-29: r = 1236;
		default: r = 0;
	endcase
end

endmodule

// Product (AN) Code SEC r-LUT
// SEC_rLUT16bits.v
// Received remainder r, output single error location.
module SEC_rLUT16bits(r, l);
input 	[12:0]	r;
output	reg	signed	[5:0]	l;
always@(*) begin
	case(r)
		1: l = +1;
		4546: l = -1;
		2: l = +2;
		4545: l = -2;
		4: l = +3;
		4543: l = -3;
		8: l = +4;
		4539: l = -4;
		16: l = +5;
		4531: l = -5;
		32: l = +6;
		4515: l = -6;
		64: l = +7;
		4483: l = -7;
		128: l = +8;
		4419: l = -8;
		256: l = +9;
		4291: l = -9;
		512: l = +10;
		4035: l = -10;
		1024: l = +11;
		3523: l = -11;
		2048: l = +12;
		2499: l = -12;
		4096: l = +13;
		451: l = -13;
		3645: l = +14;
		902: l = -14;
		2743: l = +15;
		1804: l = -15;
		939: l = +16;
		3608: l = -16;
		1878: l = +17;
		2669: l = -17;
		3756: l = +18;
		791: l = -18;
		2965: l = +19;
		1582: l = -19;
		1383: l = +20;
		3164: l = -20;
		2766: l = +21;
		1781: l = -21;
		985: l = +22;
		3562: l = -22;
		1970: l = +23;
		2577: l = -23;
		3940: l = +24;
		607: l = -24;
		3333: l = +25;
		1214: l = -25;
		2119: l = +26;
		2428: l = -26;
		4238: l = +27;
		309: l = -27;
		3929: l = +28;
		618: l = -28;
		3311: l = +29;
		1236: l = -29;
		default: l = 0;
	endcase
end

endmodule
