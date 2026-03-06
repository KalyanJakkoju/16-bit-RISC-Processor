module mux_2X1Addr (
    input        select,
    input  [3:0] a,
    input  [3:0] b,
    output [3:0] q
);
    assign q = (select == 1'b0) ? a : b;
endmodule
