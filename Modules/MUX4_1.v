module MUX4_1 (
    output reg OUT,
    input S0,
    input S1,
    input I0,
    input I1,
    input I2,
    input I3
);
    always @(*) begin
        case ({S1,S0})
            2'b00: OUT = I0;
            2'b01: OUT = I1;
            2'b10: OUT = I2;
            2'b11: OUT = I3;
            default: OUT = 1'b0;
        endcase
    end
endmodule
 