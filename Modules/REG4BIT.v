module REG4BIT (
    input S1,
    input S0,
    input CLOCK,
    input ENABLE,
    input LIN,
    input RIN,
    input [3:0] IN,
    output reg [3:0] OUT
);
    always @(posedge CLOCK) begin
        if (ENABLE) begin
            // when enable asserted, load parallel input
            OUT <= IN;
        end else begin
            case ({S1,S0})
                2'b00: OUT <= OUT;                 // HOLD
                2'b01: OUT <= {RIN, OUT[3:1]};    // Right shift with serial input RIN
                2'b10: OUT <= {OUT[2:0], LIN};    // Left shift with serial input LIN
                2'b11: OUT <= IN;                 // Parallel load
                default: OUT <= OUT;
            endcase
        end
    end
endmodule
