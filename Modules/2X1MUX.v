module mux_2X1 (
    input        select,
    input  [15:0] a,
    input  [15:0] b,
    output [15:0] q
);
    assign q = (select == 1'b0) ? a : b;
endmodule
