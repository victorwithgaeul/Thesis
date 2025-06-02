`timescale 1ns/1ps

`define CYCLE 40

module Tradeoff_8bits_tb;
parameter W_BITS = 20, N_BITS = 9;
    reg clk, rst_n;
    reg [W_BITS-1:0] W;
    wire [N_BITS-1:0] N;
    wire found;

 initial begin
    	   $fsdbDumpfile("Tradeoff_8bits_syn.fsdb");
           $fsdbDumpvars(0, "+mda");
           $fsdbDumpvars();
	end

    // Instantiate the DUT
    Tradeoff_8bits dut (
        .clk(clk), .rst_n(rst_n),
        .W(W), .found(found), .N(N)
    );

// import pre-sim .sdf file
  initial begin
     $sdf_annotate("../dc/Tradeoff_8bits_syn.sdf", dut);
  end

    // Clock generation
    initial clk = 0;
    always #(`CYCLE/2) clk = ~clk;

    integer pattern_file;
    reg [W_BITS-1:0] test_input;
    integer status;
    
    integer total_count;
    integer error_count;
    
    initial begin
        // Initialize counters
        total_count = 0;
        error_count = 0;

        // Reset
        rst_n = 1;
        #(`CYCLE/2);
        rst_n = 0;
        #(`CYCLE/4);
        rst_n = 1;

        // Open test_vectors.txt
        pattern_file = $fopen("test_vectors.txt", "r");
        if (pattern_file == 0) begin
            $display("❌ Error: Failed to open test_vectors.txt");
            $finish;
        end

         // Read and test each pattern
        while (!$feof(pattern_file)) begin
            status = $fscanf(pattern_file, "%d\n", test_input);
            if (status == 1) begin

                W = test_input;
                @(negedge clk);

                wait (found === 1'b1);
		#(`CYCLE);

                total_count = total_count + 1;
		
                if (N !== 8'd255) begin
                    $display("❌ FAIL: W = %d, N = %d (expected 255)", W, N);
                    $display("💀💀💀💀💀💀💀💀(◞‸◟) Fail!!! (◞‸◟)💀💀💀💀💀💀💀💀\n");
                    error_count = error_count + 1;
                end 
		else begin
                    $display("✅ PASS: W = %d, N = %d", W, N);
                    $display("✨✨✨✨✨✨✨✨(^u^) PASS!!! (^u^)-✨✨✨✨✨✨✨✨\n");
                end
                // @(posedge clk);
            end
        end

        $fclose(pattern_file);
        $display("=============================================================");
        $display("✅ All patterns tested: 總筆數 = %0d, 通過 = %0d, 錯誤 = %0d", 
                 total_count, total_count - error_count, error_count);
        $display("=============================================================");
        
        $finish;
        #(`CYCLE);
	$stop;
    end

endmodule

/* `timescale 1ns/1ps
`define CYCLE 20
module Tradeoff_8bits_tb;

    reg clk, rst_n;
    reg [18:0] W;
    wire [7:0] N;
    wire found;

    // Instantiate the DUT
    Tradeoff_8bits dut (
        .clk(clk), .rst_n(rst_n),
        .W(W), .found(found), .N(N)
    );

    // Clock generation
    initial clk = 0;
    always #(`CYCLE/2) clk = ~clk;

    // Pattern array
    reg [18:0] pattern [0:9];
    integer i;

    initial begin
        // Initialize patterns
        pattern[0] = 19'd494446;
        pattern[1] = 19'd494444;
        pattern[2] = 19'd494447;
        pattern[3] = 19'd494443;
        pattern[4] = 19'd494449;
        pattern[5] = 19'd494441;
        pattern[6] = 19'd494453;
        pattern[7] = 19'd494437;
        pattern[8] = 19'd494461;
        pattern[9] = 19'd494429;

        // Reset
        rst_n = 1;
        #(`CYCLE/2);
        rst_n = 0;
        #(`CYCLE/2);
        rst_n = 1;

        for (i = 0; i < 10; i = i + 1) begin
            W = pattern[i];
            @(posedge clk);
            wait (found == 1);
            if (N !== 8'd255) begin
                $display("❌ FAIL: W = %d, N = %d (expected 255)", W, N);
                $display("--------------(◞‸◟) Fail!!! (◞‸◟)---------------------\n");
            end else begin
                $display("✅ PASS: W = %d, N = %d", W, N);
                $display("--------------(^u^) PASS!!! (^u^)----------------------\n");
            end
            @(posedge clk);
        end

        $display("✅ All patterns tested.");
        $finish;
        #(`CYCLE);
	    $stop;
    end

initial 
    begin
        $fsdbDumpfile("Tradeoff_8bits.fsdb");
        $fsdbDumpMDA;
        $fsdbDumpvars;
    end

endmodule
*/

