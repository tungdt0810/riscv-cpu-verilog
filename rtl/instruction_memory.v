module instruction_memory (
    input  wire        rstn,
    input  wire [31:0] A,          // byte address (bits [1:0] ignored)
    output wire [31:0] RD          // instruction word
);
    reg [31:0] mem [1023:0];

    // Word-addressed read; return 0 during reset
    // Use A[11:2] (10-bit index) to stay within the 1024-word array,
    // consistent with data_memory.v and safe for addresses beyond 4 KB.
    assign RD = (!rstn) ? 32'h00000000 : mem[A[11:2]];

endmodule
