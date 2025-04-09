module fir_filter_tb;

    // Declare signals for the testbench
    reg clk;
    reg reset;
    reg [15:0] x;
    wire [15:0] y;

    // Instantiate the FIR filter
    fir_filter uut (
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y)
    );

    // Clock generation
    always #5 clk = ~clk;  // Toggle clock every 5 time units

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        x = 16'b0;

        // Apply reset
        #10 reset = 0;

        // Provide test input values
        #10 x = 16'd1;  // First input sample
        #10 x = 16'd2;  // Second input sample
        #10 x = 16'd3;  // Third input sample
        #10 x = 16'd4;  // Fourth input sample
        #10 x = 16'd5;  // Fifth input sample

        // Finish simulation
        #10 $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time = %0t, x = %d, y = %d", $time, x, y);
    end

endmodule
