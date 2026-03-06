`timescale 1ns / 1ps
`include "../Modules/Datapath.v"

module ProcessorTEST;
    reg CLK, RESET;

    // Instantiate the datapath
    Datapath uut (.CLK(CLK), .RESET(RESET));

    initial begin
        CLK = 0;
        forever #10 CLK = ~CLK; // 20ns clock period
    end

    initial begin
        RESET = 1;
        #50 RESET = 0; // release reset
        #1000 $stop;
    end
endmodule

