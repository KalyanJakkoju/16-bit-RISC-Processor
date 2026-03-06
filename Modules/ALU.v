`timescale 1ns / 1ps

module ALU (
    output reg [15:0] out,
    output reg        zero,
    input      [15:0] a,
    input      [15:0] b,
    input      [3:0]  op
);
    always @(*) begin
        case (op)
            4'b0000: out = a + b;        // ADD
            4'b0001: out = a - b;        // SUB
            4'b0010: out = a & b;        // AND
            4'b0011: out = a | b;        // OR
            4'b0100: out = a << 1;       // LSHIFT
            default: out = 16'b0;
        endcase

        zero = (out == 16'b0);
    end
endmodule
