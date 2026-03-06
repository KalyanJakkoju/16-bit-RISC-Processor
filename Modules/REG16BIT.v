// Small module that demonstrates an array of 4 x 16-bit registers and initializes them.
module REG16BIT;
    reg [15:0] REG4BIT [0:3];
    integer i;
    initial begin
        for (i = 0; i < 4; i = i + 1) begin
            REG4BIT[i] = i; // assign small value
            #1 $display("REG4BIT[%0d] = %h", i, REG4BIT[i]);
        end
    end
endmodule
