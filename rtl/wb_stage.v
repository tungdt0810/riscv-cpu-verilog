module wb_stage (
    input  wire [1:0]  ResultSrcW,
    input  wire [31:0] ALUResultW,
    input  wire [31:0] ReadDataW,
    input  wire [31:0] PCPlus4W,
    output wire [31:0] ResultW        // writeback value (combinational)
);
    mux_3_1 wb_mux (
        .d0(ALUResultW),
        .d1(ReadDataW),
        .d2(PCPlus4W),
        .s (ResultSrcW),
        .y (ResultW)
    );
endmodule
