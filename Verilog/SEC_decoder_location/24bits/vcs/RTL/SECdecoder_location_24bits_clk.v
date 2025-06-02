// Product (AN) Code Conventional SECdecoder
// SECdecoder_location_24bits.v
// Used to do SEC by Galois Field, and corrected by location, not AWE
// Received remainder r, output error location.
module SECdecoder_location_24bits_clk(clk, rst_n, W, found, N);

//=========================================================================
//   PARAMETER AND LOCALPARAM FOR FSM
//   W_BITS 要考慮 OVERFLOW 問題
//   N_BITS 也要考慮 OVERFLOW 問題
//=========================================================================
parameter A = 67 , W_BITS = 32, A_BITS = 7 , N_BITS = 25, L_BITS = 6;

localparam [2:0] idle=3'b000, pre=3'b001,load=3'b010, LUT=3'b011, done=3'd100;
reg [2:0] ps;
//==========================================
//   INPUT AND OUTPUT DECLARATION
//==========================================
input   clk, rst_n;
input 	[W_BITS-1:0]	W;
output	reg  [N_BITS-1:0] N;
output  reg  found;

reg 	[N_BITS-1:0]	Q;
reg 	[A_BITS-1:0]	r;

//==========================================
//    FUNCTION FOR |h1| |h2| value 
//==========================================
function [L_BITS:0] abs;
    input signed [L_BITS:0] val;
    abs = val[L_BITS] ? ~val + 1 : val;
endfunction

reg	signed	[L_BITS:0]  l;
always@(*) begin
	case(r)
		1: l = +1;
		2: l = +2;
		4: l = +3;
		8: l = +4;
		16: l = +5;
		32: l = +6;
		64: l = +7;
		61: l = +8;
		55: l = +9;
		43: l = +10;
		19: l = +11;
		38: l = +12;
		9: l = +13;
		18: l = +14;
		36: l = +15;
		5: l = +16;
		10: l = +17;
		20: l = +18;
		40: l = +19;
		13: l = +20;
		26: l = +21;
		52: l = +22;
		37: l = +23;
		7: l = +24;
		14: l = +25;
		28: l = +26;
		56: l = +27;
		45: l = +28;
		23: l = +29;
		46: l = +30;
		25: l = +31;
		50: l = +32;
		33: l = +33;
		66: l = -1;
		65: l = -2;
		63: l = -3;
		59: l = -4;
		51: l = -5;
		35: l = -6;
		3: l = -7;
		6: l = -8;
		12: l = -9;
		24: l = -10;
		48: l = -11;
		29: l = -12;
		58: l = -13;
		49: l = -14;
		31: l = -15;
		62: l = -16;
		57: l = -17;
		47: l = -18;
		27: l = -19;
		54: l = -20;
		41: l = -21;
		15: l = -22;
		30: l = -23;
		60: l = -24;
		53: l = -25;
		39: l = -26;
		11: l = -27;
		22: l = -28;
		44: l = -29;
		21: l = -30;
		42: l = -31;
		17: l = -32;
		34: l = -33;
		default: l = 0;
	endcase
end

reg [W_BITS-1:0]  W_new;
always@(posedge clk or negedge rst_n) begin
   if(!rst_n) begin
     	ps <= idle;
    end
   else begin
        case(ps)
            idle: begin
                found <= 0;
                r <= 0;
        	Q <= 0;
                ps <= pre;
                end
	    pre: begin
		 Q <= W / A;
		 ps <= load;
		end
            load: begin
                 r <= W - (A * Q);
		 ps <= LUT;
		end
	    LUT: begin
		 W_new <= W - ((l[L_BITS] ? -1 : 1) * (1 << (abs(l) - 1)));
		 ps <= done;
		end
	    done: begin
		  if(l != 0)begin
		      N <=  W_new / A ;	
		      found <= 1;
                      ps <= idle;
		  end
		  else begin
		      N <= Q;
		      found <= 1;
                      ps <= idle;
		  end
		end
	endcase
    end
end

endmodule

