`timescale 1ns / 1ps

module ALUTEST;

    reg [15:0] a, b;
    reg [3:0]  op;
    wire [15:0] out;
    wire zero;

    // DUT - Device Under Test
    ALU uut (
        .out(out),
        .zero(zero),
        .a(a),
        .b(b),
        .op(op)
    );

    initial begin
        $display("====== ALU 4-bit ALUOp TEST ======");

        // Test ADD
        a = 16'd10; b = 16'd5; op = 4'b0000;
        #10;
        $display("ADD: a=%d b=%d op=%b out=%d zero=%b",
                 a, b, op, out, zero);

        // Test SUB
        a = 16'd10; b = 16'd10; op = 4'b0001;
        #10;
        $display("SUB: a=%d b=%d op=%b out=%d zero=%b (Expect zero=1)",
                 a, b, op, out, zero);

        // Test AND
        a = 16'b1010; b = 16'b1100; op = 4'b0010;
        #10;
        $display("AND: a=%b b=%b out=%b zero=%b",
                 a, b, out, zero);

        // Test OR
        a = 16'b1010; b = 16'b0101; op = 4'b0011;
        #10;
        $display("OR : a=%b b=%b out=%b zero=%b",
                 a, b, out, zero);

        // Test SHIFT LEFT
        a = 16'b0000_0000_0000_1010; b = 0; op = 4'b0100;
        #10;
        $display("LSL: a=%b out=%b zero=%b",
                 a, out, zero);

        // Test default
        a = 16'hFFFF; b = 16'hAAAA; op = 4'b1111;
        #10;
        $display("DEFAULT: op=%b out=%b zero=%b",
                 op, out, zero);

        $display("====== TEST COMPLETE ======");
        $stop;
    end
endmodule
