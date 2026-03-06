<<<<<<< HEAD
# 16-bit-RISC-processor
A verilog implementation of a 16-bit RISC processor along with test benches
=======
Overview:::
This project implements a 16-bit RISC processor using Verilog HDL.
The processor consists of basic components such as ALU, Register File, Control Unit, Instruction Memory, Data Memory, and Datapath.

The design is simulated using ModelSim (Intel FPGA Edition).

Architecture Components:

Program Counter (PC)
Instruction Memory
Control Unit
Register File (16 registers × 16-bit)
Arithmetic Logic Unit (ALU)
Sign Extend Unit
Data Memory

Supported ALU Operations:
Opcode	Operation
0000	ADD
0001	SUB
0010	AND
0011	OR
0100	SHIFT LEFT

Simulation Tool:
ModelSim – Intel FPGA Edition

How to Run:
Compile the Design

vlib work
vmap work work
vlog RegisterFile.v
vlog MUX4_1.v
vlog REG4BITTEST.v
vlog CU.v
vlog ALUTEST.v
vlog signExtend.v
vlog REG4BIT.v
vlog ALU.v
vlog DataMemory.v
vlog REG16BIT.v
vlog MUX4_1TEST.v
vlog 2X1MUX.v
vlog MuxAddr.v
vlog Datapath.v
vlog ADDER.v
vlog InstructionMemory.v
vlog ProcessorTEST.v

Run Simulation:

vsim work.ProcessorTEST
add wave -r /*
run -all

Kalyan Jakkoju
>>>>>>> 671049de3d80835deacb4bb31f67d59cf66058fc
