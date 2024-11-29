`default_nettype none
`include "define.vh"

module r_data_fmt(
    input wire [1:0] low_addr,
    input wire [31:0] in_data,
    input wire [1:0] len,
    input wire uns, clk,
    output reg [31:0] out_data
    );
    
    reg [23:0] prev_data;
    wire [31:0] shifted_data;

    always @(posedge clk) begin
        prev_data <= in_data[23:0];
    end

    assign shifted_data = {prev_data, in_data} >> (low_addr * 8);

    always @* begin
        case(len)
            `MA_LEN_1B: begin
                if (uns) begin
                    out_data = {24'b0, shifted_data[7:0]};
                end else begin
                    out_data = {{24{shifted_data[7]}}, shifted_data[7:0]};
                end
            end
            `MA_LEN_2B: begin
                if (uns) begin
                    out_data = {16'b0, shifted_data[15:0]};
                end else begin
                    out_data = {{16{shifted_data[15]}}, shifted_data[15:0]};
                end
            end
            `MA_LEN_4B: begin
                out_data = shifted_data;
            end
            default: out_data = shifted_data;   
        endcase
    end

endmodule

`default_nettype wire