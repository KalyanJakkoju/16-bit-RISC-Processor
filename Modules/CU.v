module CU (
    input  [3:0] opcode,
    output reg regDest,
    output reg jump,
    output reg branch,
    output reg memRead,
    output reg memToReg,
    output reg [3:0] ALUOp,
    output reg memWrite,
    output reg ALUSrc,
    output reg regWrite
);

    always @(*) begin
        regDest  = 0;
        jump     = 0;
        branch   = 0;
        memRead  = 0;
        memToReg = 0;
        ALUOp    = 4'b0000;   // default = ADD
        memWrite = 0;
        ALUSrc   = 0;
        regWrite = 0;

        case (opcode)
            4'b0000: begin  // ADD
                ALUOp    = 4'b0000;
                regWrite = 1;
            end

            4'b0001: begin  // SUB
                ALUOp    = 4'b0001;
                regWrite = 1;
            end

            4'b0010: begin // AND
                ALUOp    = 4'b0010;
                regWrite = 1;
            end

            4'b0011: begin // OR
                ALUOp    = 4'b0011;
                regWrite = 1;
            end

            4'b0100: begin // SHIFT LEFT
                ALUOp    = 4'b0100;
                regWrite = 1;
            end

            4'b1000: begin // LOAD
                ALUOp    = 4'b0000; // base+offset
                memRead  = 1;
                memToReg = 1;
                regWrite = 1;
                ALUSrc   = 1;
            end

            4'b1010: begin // STORE
                ALUOp    = 4'b0000;
                memWrite = 1;
                ALUSrc   = 1;
            end

            4'b1110: begin // BNE
                ALUOp  = 4'b0001; // SUB for comparison
                branch = 1;
            end

            4'b1111: begin // JUMP
                jump = 1;
            end
        endcase
    end
endmodule
