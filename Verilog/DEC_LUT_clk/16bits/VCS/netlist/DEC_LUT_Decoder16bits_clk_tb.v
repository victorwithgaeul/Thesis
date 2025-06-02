`timescale 1ns/1ps
`define CYCLE 40

module DEC_LUT_Decoder8bits_clk_tb;
parameter W_BITS = 30, N_BITS = 17;

reg clk, rst_n;
reg [W_BITS-1:0] W;
wire [N_BITS-1:0] N;
wire found;

initial begin
    $fsdbDumpfile("DEC_LUT_Decoder16bits_clk.fsdb");
    $fsdbDumpvars(0, "+mda");
    $fsdbDumpvars();
end

// DUT
DEC_LUT_Decoder16bits_clk dut (
    .clk(clk), .rst_n(rst_n),
    .W(W), .found(found), .N(N)
);

// import pre-sim .sdf file
  initial begin
     $sdf_annotate("../dc/DEC_LUT_Decoder16bits_clk_syn.sdf", dut);
  end

// Clock generation
initial clk = 0;
always #(`CYCLE/2) clk = ~clk;

// Pattern file and variables
integer pattern_file;
reg [W_BITS-1:0] test_input;
integer status;
integer total_count, error_count;

initial begin
    total_count = 0;
    error_count = 0;

    // Reset
    rst_n = 1;
    #(`CYCLE/2);
    rst_n = 0;
    #(`CYCLE/4);
    rst_n = 1;

    // Open pattern file
    pattern_file = $fopen("test_vectors.txt", "r");
    if (pattern_file == 0) begin
        $display("❌ Error: Failed to open test_vectors.txt");
        $finish;
    end

    // Test pattern loop
    while (!$feof(pattern_file)) begin
        status = $fscanf(pattern_file, "%d\n", test_input);
        if (status == 1) begin
	    // @(negedge clk);
            W = test_input;
            @(negedge clk);
 					
            wait (found === 1'b1);
            #(`CYCLE);

            total_count = total_count + 1;

            if (N !== 16'd65535) begin
                $display("❌ FAIL: W = %d, N = %d (expected 65535)", W, N);
		$display("💀💀💀💀💀💀💀💀(◞‸◟) Fail!!! (◞‸◟)💀💀💀💀💀💀💀💀\n");
                error_count = error_count + 1;
            end else begin
                $display("✅ PASS: W = %d, N = %d", W, N);
		$display("✨✨✨✨✨✨✨✨(^u^) PASS!!! (^u^)-✨✨✨✨✨✨✨✨\n");
            end

            //@(posedge clk); // next pattern
        end
    end

    $fclose(pattern_file);
    $display("=============================================================");
    $display("✅ All patterns tested: Total = %0d, Pass = %0d, Fail = %0d",
             total_count, total_count - error_count, error_count);
    $display("=============================================================");

    #(`CYCLE);
    $finish;
end

endmodule

