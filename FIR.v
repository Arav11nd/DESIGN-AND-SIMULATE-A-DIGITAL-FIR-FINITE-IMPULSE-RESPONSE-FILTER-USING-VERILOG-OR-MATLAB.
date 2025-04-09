module fir_filter (
    input clk,              // Clock signal
    input reset,            // Reset signal
    input [15:0] x,         // Input data (16-bit)
    output reg [15:0] y     // Output data (16-bit)
);

    // Coefficients for the 3-tap FIR filter
    reg [15:0] b0 = 16'd1;
    reg [15:0] b1 = 16'd2;
    reg [15:0] b2 = 16'd1;

    // Registers to store previous input values
    reg [15:0] x_reg1, x_reg2;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            x_reg1 <= 16'b0;
            x_reg2 <= 16'b0;
            y <= 16'b0;
        end else begin
            // Shift the input values
            x_reg2 <= x_reg1;
            x_reg1 <= x;
            
            // Compute the FIR filter output
            y <= (b0 * x) + (b1 * x_reg1) + (b2 * x_reg2);
        end
    end

endmodule
