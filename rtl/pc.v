module pc (
    input  wire        clk,
    input  wire        rstn,      // active-low synchronous reset
    input  wire        en,        // 1 = update, 0 = hold (pipeline stall)
    input  wire [31:0] PCNext,
    output reg  [31:0] PC
);
    always @(posedge clk) begin
        if (!rstn) begin
            PC <= 32'h00000000;
        end else if (en) begin
            PC <= PCNext;
        end
        // else: en=0, hold current PC (stall)
    end
endmodule
