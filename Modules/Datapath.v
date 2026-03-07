`timescale 1ns / 1ps

`include "ALU.v"
`include "DataMemory.v"
`include "InstructionMemory.v"
`include "RegisterFile.v"
`include "signExtend.v"
`include "CU.v"
`include "ADDER.v"

module Datapath (
    input  wire CLK,
    input  wire RESET
);

    wire [15:0] instruction;
    wire [15:0] readData1, readData2;
    wire [15:0] aluResult, memData, signExtImm;
    wire [15:0] pcAddr;

    wire [3:0] opcode, rs, rt, rd;
    wire zeroFlag;
    wire memRead, memWrite, memToReg, regWrite, aluSrc, jump, branch;
    wire [3:0] aluOp;
    wire regDest;

    reg [15:0] pc;

    // Program Counter
    always @(posedge CLK or posedge RESET) begin
        if (RESET)
            pc <= 16'd0;
        else
            pc <= pc + 16'd2;
    end
    assign pcAddr = pc;

    // Instruction Memory
    InstructionMemory imem (
        .insAddr(pcAddr),
        .out(instruction)
    );

    
    // Control Unit
    CU control_unit (
        .opcode(opcode),
        .regDest(regDest),
        .jump(jump),
        .branch(branch),
        .memRead(memRead),
        .memToReg(memToReg),
        .ALUOp(aluOp),
        .memWrite(memWrite),
        .ALUSrc(aluSrc),
        .regWrite(regWrite)
    );

    // Decode
    assign opcode = instruction[15:12];
    assign rs     = instruction[11:8];
    assign rt     = instruction[7:4];
    assign rd     = instruction[3:0];

    // Sign Extend
    signExtend sign_ext_inst (
        .inp(instruction[11:0]),
        .out(signExtImm)
    );

    // Register File
    RegisterFile regfile_inst (
        .clk(CLK),
        .clrbar(~RESET),
        .load(regWrite),
        .Aaddr(rs),
        .Baddr(rt),
        .Caddr(rd),
        .C(aluResult),
        .A(readData1),
        .B(readData2)
    );

    // ALU
    ALU alu_inst (
        .out(aluResult),
        .zero(zeroFlag),
        .a(readData1),
        .b(readData2),
        .op(aluOp)
    );

    // Data Memory
    DataMemory data_mem_inst (
        .clk(CLK),
        .addr(aluResult[3:0]),
        .datain(readData2),
        .memRead(memRead),
        .memWrite(memWrite),
        .dataout(memData)
    );

endmodule

