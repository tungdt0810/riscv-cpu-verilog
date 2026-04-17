module data_memory (
    input  wire        clk,
    input  wire        rstn,
    input  wire        WE,          // 1 = write (store instruction)
    input  wire [3:0]  BE,          // byte enable: which lanes to write
    input  wire [31:0] A,           // byte address
    input  wire [31:0] WD,          // write data (pre-shifted to correct lane)
    output wire [31:0] RD           // full 32-bit word read (for load)
);
    reg [31:0] mem [1023:0];
    assign RD = (!rstn) ? 32'h00000000 : mem[A[11:2]];
    always @(posedge clk) begin
        if (WE) begin
            if (BE[0]) mem[A[11:2]][7:0]   <= WD[7:0];
            if (BE[1]) mem[A[11:2]][15:8]  <= WD[15:8];
            if (BE[2]) mem[A[11:2]][23:16] <= WD[23:16];
            if (BE[3]) mem[A[11:2]][31:24] <= WD[31:24];
        end
    end
endmodule