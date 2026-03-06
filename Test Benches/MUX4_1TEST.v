`timescale 1ns / 1ps
`include "../Modules/MUX4_1.v"

module MUX4_1TEST;
  // Testbench signals
    reg S0, S1;          // Select lines
    reg I0, I1, I2, I3;  // Inputs
    wire OUT;             // Output

    // Instantiate the MUX4_1 module
    MUX4_1 uut (
        .OUT(OUT),
        .S0(S0),
        .S1(S1),
        .I0(I0),
        .I1(I1),
        .I2(I2),
        .I3(I3)
    );

    // Test procedure
    initial begin
        // Display header
        $display("Time\tS1 S0 | I3 I2 I1 I0 | OUT");
        $monitor("%0dns\t%b  %b  |  %b  %b  %b  %b  |  %b", $time, S1, S0, I3, I2, I1, I0, OUT);

        // Initialize inputs
        I0 = 0; I1 = 1; I2 = 0; I3 = 1;

        // Apply all select combinations
        S1 = 0; S0 = 0; #10;
        S1 = 0; S0 = 1; #10;
        S1 = 1; S0 = 0; #10;
        S1 = 1; S0 = 1; #10;

        // Change inputs and test again
        I0 = 1; I1 = 0; I2 = 1; I3 = 0;

        S1 = 0; S0 = 0; #10;
        S1 = 0; S0 = 1; #10;
        S1 = 1; S0 = 0; #10;
        S1 = 1; S0 = 1; #10;

        // End simulation
        $finish;
    end

endmodule

