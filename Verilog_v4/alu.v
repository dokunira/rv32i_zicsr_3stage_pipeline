`default_nettype none
`include "define.vh"

module alu(
    input wire signed [31:0] in1, in2,
    input wire [3:0] sel,
    output reg [31:0] out
    );

    always @* begin
        casex(sel)
            `ALU_SEL_ADD:  out = in1 + in2;
            `ALU_SEL_SUB:  out = in1 - in2;
            `ALU_SEL_SLL:  out = in1 << in2[4:0];
            `ALU_SEL_SLT:  out = in1 < in2;
            `ALU_SEL_SLTU: out = $unsigned(in1) < $unsigned(in2);
            `ALU_SEL_XOR:  out = in1 ^ in2;
            `ALU_SEL_SRL:  out = in1 >> in2[4:0];
            `ALU_SEL_SRA:  out = in1 >>> in2[4:0];
            `ALU_SEL_OR:   out = in1 | in2;
            `ALU_SEL_AND:  out = in1 & in2;
            default:            out = in1;
        endcase
    end
    
endmodule

`default_nettype wire