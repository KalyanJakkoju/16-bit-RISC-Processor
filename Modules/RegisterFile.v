// 16 registers of 16-bit each
module RegisterFile (
    input              clk,
    input              clrbar,   // active-low synchronous clear
    input              load,     // write enable
    input  [3:0]       Aaddr,
    input  [3:0]       Baddr,
    input  [3:0]       Caddr,
    input  [15:0]      C,        // write data
    output reg [15:0]  A,
    output reg [15:0]  B
);
    reg [15:0] REG16BIT [0:15];
    integer i;

    // Initialize registers for visibility
    initial begin
        for (i = 0; i < 16; i = i + 1)
            REG16BIT[i] = i;   // preload each register with its index
    end

    // Combinational read
    always @(*) begin
        A = REG16BIT[Aaddr];
        B = REG16BIT[Baddr];
    end

    // Synchronous write and clear
    always @(posedge clk) begin
        if (!clrbar) begin
            for (i = 0; i < 16; i = i + 1)
                REG16BIT[i] <= 16'b0;
        end else if (load) begin
            REG16BIT[Caddr] <= C;
            $display("Time=%0t | Write REG[%0d] = %0d", $time, Caddr, C);
        end
    end
endmodule
