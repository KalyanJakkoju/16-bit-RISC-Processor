// 16-word Instruction Memory: Combinational read
`timescale 1ns / 1ps

module InstructionMemory (
    input  [15:0] insAddr,
    output reg [15:0] out
);
    reg [15:0] ins [0:15];

    initial begin
        // Instruction format: [opcode(4)][rs(4)][rt(4)][rd(4)]

        ins[0] = 16'b0000000100100011; // ADD  R1,R2,R3  => opcode=0000
        ins[1] = 16'b0001001101000100; // SUB  R3,R4,R4  => opcode=0001
        ins[2] = 16'b0010010000110101; // AND  R4,R3,R5  => opcode=0010
        ins[3] = 16'b0011010100000110; // OR   R5,R0,R6  => opcode=0011
        ins[4] = 16'b0100001101000111; // SHIFT R3,R4,R7 => opcode=0100
        ins[5] = 16'b1111000000000000; // HALT           => opcode=1111

        // Fill rest with NOPs
        ins[6]  = 16'b0000000000000000;
        ins[7]  = 16'b0000000000000000;
        ins[8]  = 16'b0000000000000000;
        ins[9]  = 16'b0000000000000000;
        ins[10] = 16'b0000000000000000;
        ins[11] = 16'b0000000000000000;
        ins[12] = 16'b0000000000000000;
        ins[13] = 16'b0000000000000000;
        ins[14] = 16'b0000000000000000;
        ins[15] = 16'b0000000000000000;
    end

    always @(*) begin
        out = ins[insAddr[3:0]]; // lower 4 bits as index
    end
endmodule
