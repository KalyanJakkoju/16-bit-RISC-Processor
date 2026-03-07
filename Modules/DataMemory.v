module DataMemory (
    input              clk,
    input      [3:0]   addr,      // 4-bit address for 16 words
    input      [15:0]  datain,
    input              memRead,
    input              memWrite,
    output reg [15:0]  dataout
);
    reg [15:0] mem [0:15];

    // combinational read
    always @(*) begin
        if (memRead)
            dataout = mem[addr];
        else
            dataout = 16'b0;
    end

    // synchronous write
    always @(posedge clk) begin
        if (memWrite)
            mem[addr] <= datain;
    end
endmodule
