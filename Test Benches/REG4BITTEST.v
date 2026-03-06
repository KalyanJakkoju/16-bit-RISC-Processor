`timescale 1ns/1ps
`include "../Modules/REG4BIT.v"
module REG4BITTEST;
    reg S1,S0;
    reg CLOCK,ENABLE;
    reg LIN,RIN;
    reg [3:0] IN;
    wire [3:0] OUT;

    REG4BIT RB(.S1(S1), .S0(S0), .IN(IN), .LIN(LIN), .RIN(RIN), .OUT(OUT), .CLOCK(CLOCK), .ENABLE(ENABLE));

    initial CLOCK = 1'b0;
    always #50 CLOCK = ~CLOCK;

    initial begin
        ENABLE = 1'b0;
        LIN = 1'b0; RIN = 1'b1;
        IN = 4'b1100;
        #10 $display("IN=%b", IN);

        // HOLD
        S1 = 0; S0 = 0; #100 $display("OUT=%b (HOLD)", OUT);

        // Right shift
        S1 = 0; S0 = 1; #100 $display("OUT=%b (RSHIFT)", OUT);

        // Left shift
        S1 = 1; S0 = 0; #100 $display("OUT=%b (LSHIFT)", OUT);

        // Parallel load (ENABLE asserted causes parallel load on next posedge)
        ENABLE = 1'b1; S1 = 1; S0 = 1; #120 $display("OUT=%b (PARALLEL LOAD)", OUT);

        $finish;
    end
endmodule
