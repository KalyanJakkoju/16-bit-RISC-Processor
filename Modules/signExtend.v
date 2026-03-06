`timescale 1ns / 1ps
module signExtend (inp, out);
    input [11:0] inp;
    output [15:0] out;
    reg [15:0] intr;

    always @(*) begin
        intr[11:0] = inp;
        intr[15:12] = inp[11] ? 4'b1111 : 4'b0000; // replicate sign bit
    end

    assign out = intr;
endmodule

