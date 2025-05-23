`timescale 1ns/1ps
`define CYCLE 20
module Tradeoff_20bits_tb;
parameter W_BITS = 34, N_BITS = 21;
    reg clk, rst_n;
    reg [W_BITS-1:0] W;
    wire [N_BITS-1:0] N;
    wire found;

initial begin
    	$fsdbDumpfile("Tradeoff_20bits.fsdb");
        $fsdbDumpvars(0, "+mda");
        $fsdbDumpvars();
      end

    // Instantiate the DUT
    Tradeoff_20bits dut (
        .clk(clk), .rst_n(rst_n),
        .W(W), .found(found), .N(N)
    );

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
		
                if (N !== 20'd1048575) begin
                    $display("❌ FAIL: W = %d, N = %d (expected 1048575)", W, N);
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
