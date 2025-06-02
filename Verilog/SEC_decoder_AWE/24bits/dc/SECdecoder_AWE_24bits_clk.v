// Product (AN) Code Conventional SECdecoder
// SECdecoder_AWE_24bits.v
// Used to do SEC by Galois Field, and corrected AWE
// Received remainder r, output single AWE.
module SECdecoder_AWE_24bits_clk(clk, rst_n, W, found, N);

//=========================================================================
//   PARAMETER AND LOCALPARAM FOR FSM
//   W_BITS 要考慮 OVERFLOW 問題
//   N_BITS 也要考慮 OVERFLOW 問題
//=========================================================================
parameter A = 67 , W_BITS = 32, A_BITS = 7 , N_BITS = 25;

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

reg	signed	[33:0]	AWE;
always@(*) begin
	case(r)
		1: AWE = +(1 << 0);
		2: AWE = +(1 << 1);
		4: AWE = +(1 << 2);
		8: AWE = +(1 << 3);
		16: AWE = +(1 << 4);
		32: AWE = +(1 << 5);
		64: AWE = +(1 << 6);
		61: AWE = +(1 << 7);
		55: AWE = +(1 << 8);
		43: AWE = +(1 << 9);
		19: AWE = +(1 << 10);
		38: AWE = +(1 << 11);
		9: AWE = +(1 << 12);
		18: AWE = +(1 << 13);
		36: AWE = +(1 << 14);
		5: AWE = +(1 << 15);
		10: AWE = +(1 << 16);
		20: AWE = +(1 << 17);
		40: AWE = +(1 << 18);
		13: AWE = +(1 << 19);
		26: AWE = +(1 << 20);
		52: AWE = +(1 << 21);
		37: AWE = +(1 << 22);
		7: AWE = +(1 << 23);
		14: AWE = +(1 << 24);
		28: AWE = +(1 << 25);
		56: AWE = +(1 << 26);
		45: AWE = +(1 << 27);
		23: AWE = +(1 << 28);
		46: AWE = +(1 << 29);
		25: AWE = +(1 << 30);
		50: AWE = +(1 << 31);
		33: AWE = +(1 << 32);
		66: AWE = -(1 << 0);
		65: AWE = -(1 << 1);
		63: AWE = -(1 << 2);
		59: AWE = -(1 << 3);
		51: AWE = -(1 << 4);
		35: AWE = -(1 << 5);
		3: AWE = -(1 << 6);
		6: AWE = -(1 << 7);
		12: AWE = -(1 << 8);
		24: AWE = -(1 << 9);
		48: AWE = -(1 << 10);
		29: AWE = -(1 << 11);
		58: AWE = -(1 << 12);
		49: AWE = -(1 << 13);
		31: AWE = -(1 << 14);
		62: AWE = -(1 << 15);
		57: AWE = -(1 << 16);
		47: AWE = -(1 << 17);
		27: AWE = -(1 << 18);
		54: AWE = -(1 << 19);
		41: AWE = -(1 << 20);
		15: AWE = -(1 << 21);
		30: AWE = -(1 << 22);
		60: AWE = -(1 << 23);
		53: AWE = -(1 << 24);
		39: AWE = -(1 << 25);
		11: AWE = -(1 << 26);
		22: AWE = -(1 << 27);
		44: AWE = -(1 << 28);
		21: AWE = -(1 << 29);
		42: AWE = -(1 << 30);
		17: AWE = -(1 << 31);
		34: AWE = -(1 << 32);
		default: AWE = 0;
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
		 W_new <= W - AWE;
		 ps <= done;
		end
	    done: begin
		  if(AWE != 0)begin
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

