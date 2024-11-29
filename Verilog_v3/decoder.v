`default_nettype none
`include "define.vh"

module decoder(
    input wire [31:0] inst,
    input wire [4:0] e_rd_addr,
    input wire e_reg_we,
    input wire e_load,
    output reg [31:0] imm,
    output reg alu_in1_sel,
    output reg alu_in2_sel,
    output reg [3:0] alu_sel,
    output reg reg_we,
    output reg [1:0] e_out_sel,
    output reg jump,
    output reg branch,
    output reg load,
    output reg store,
    output reg zicsr,
    output reg ecall,
    output reg illegal_inst,
    output reg mret,
    output reg rs1_sel,
    output reg rs2_sel,
    output wire lduse
    );

    reg use_rs1;
    reg use_rs2;
    // Unimplemented instructions are treated as NOP.
    always @* begin
        illegal_inst = 1'b0;
        casex(inst)
            `BITPAT_OP: begin
                imm = 32'bx;
                alu_in1_sel = `ALU_IN1_SEL_RS1_DATA;
                alu_in2_sel = `ALU_IN2_SEL_RS2_DATA;
                reg_we = 1'b1;
                e_out_sel = `E_OUT_SEL_ALU_OUT;
                casex(inst)
                    `BITPAT_ADD:    alu_sel = `ALU_SEL_ADD;
                    `BITPAT_SUB:    alu_sel = `ALU_SEL_SUB;
                    `BITPAT_SLL:    alu_sel = `ALU_SEL_SLL;
                    `BITPAT_SLT:    alu_sel = `ALU_SEL_SLT;
                    `BITPAT_SLTU:   alu_sel = `ALU_SEL_SLTU;
                    `BITPAT_XOR:    alu_sel = `ALU_SEL_XOR;
                    `BITPAT_SRL:    alu_sel = `ALU_SEL_SRL;
                    `BITPAT_SRA:    alu_sel = `ALU_SEL_SRA;
                    `BITPAT_OR:     alu_sel = `ALU_SEL_OR;
                    `BITPAT_AND:    alu_sel = `ALU_SEL_AND;
                    default: begin
                        reg_we = 1'b0;
                        alu_sel = `ALU_SEL_X;
                        illegal_inst = 1'b1;
                    end
                endcase
                jump = 1'b0;
                branch = 1'b0;
                load = 1'b0;
                store = 1'b0;
                zicsr = 1'b0;
                ecall = 1'b0;
                mret = 1'b0;
                use_rs1 = 1'b1;
                use_rs2 = 1'b1;
            end
            
            `BITPAT_OP_IMM: begin
                imm = {{20{inst[31]}}, inst[31:20]};
                alu_in1_sel = `ALU_IN1_SEL_RS1_DATA;
                alu_in2_sel = `ALU_IN2_SEL_IMM;
                reg_we = 1'b1;
                e_out_sel = `E_OUT_SEL_ALU_OUT;
                casex(inst)
                    `BITPAT_ADDI:   alu_sel = `ALU_SEL_ADD;
                    `BITPAT_SLTI:   alu_sel = `ALU_SEL_SLT;
                    `BITPAT_SLTIU:  alu_sel = `ALU_SEL_SLTU;
                    `BITPAT_XORI:   alu_sel = `ALU_SEL_XOR;
                    `BITPAT_ORI:    alu_sel = `ALU_SEL_OR;
                    `BITPAT_ANDI:   alu_sel = `ALU_SEL_AND;
                    `BITPAT_SLLI:   alu_sel = `ALU_SEL_SLL;
                    `BITPAT_SRLI:   alu_sel = `ALU_SEL_SRL;
                    `BITPAT_SRAI:   alu_sel = `ALU_SEL_SRA;
                    default: begin
                        reg_we = 1'b0;
                        alu_sel = `ALU_SEL_X;
                        illegal_inst = 1'b1;
                    end
                endcase
                jump = 1'b0;
                branch = 1'b0;
                load = 1'b0;
                store = 1'b0;
                zicsr = 1'b0;
                ecall = 1'b0;
                mret = 1'b0;
                use_rs1 = 1'b1;
                use_rs2 = 1'b0;
            end

            // Combining LUI and ADDI can create any immediate value.
            `BITPAT_LUI: begin
                imm = {inst[31:12], 12'b0};
                alu_in1_sel = `ALU_IN1_SEL_X;
                alu_in2_sel = `ALU_IN2_SEL_X;
                alu_sel = `ALU_SEL_X;
                reg_we = 1'b1;
                e_out_sel = `E_OUT_SEL_IMM;
                jump = 1'b0;
                branch = 1'b0;
                load = 1'b0;
                store = 1'b0;
                zicsr = 1'b0;
                ecall = 1'b0;
                mret = 1'b0;
                use_rs1 = 1'b0;
                use_rs2 = 1'b0;
            end

            // Combining AUIPC and JALR can transfer control to any 32-bit PC-relative address.
            `BITPAT_AUIPC: begin
                imm = {inst[31:12], 12'b0};
                alu_in1_sel = `ALU_IN1_SEL_PC;
                alu_in2_sel = `ALU_IN2_SEL_IMM;
                alu_sel = `ALU_SEL_ADD;
                reg_we = 1'b1;
                e_out_sel = `E_OUT_SEL_ALU_OUT;
                jump = 1'b0;
                branch = 1'b0;
                load = 1'b0;
                store = 1'b0;
                zicsr = 1'b0;
                ecall = 1'b0;
                mret = 1'b0;
                use_rs1 = 1'b0;
                use_rs2 = 1'b0;
            end

            `BITPAT_JAL: begin
                imm = {{12{inst[31]}}, inst[19:12], inst[20], inst[30:21], 1'b0};
                alu_in1_sel = `ALU_IN1_SEL_PC;
                alu_in2_sel = `ALU_IN2_SEL_IMM;
                alu_sel = `ALU_SEL_ADD;
                reg_we = 1'b1;
                e_out_sel = `E_OUT_SEL_PC_PLUS4;
                jump = 1'b1;
                branch = 1'b0;
                load = 1'b0;
                store = 1'b0;
                zicsr = 1'b0;
                ecall = 1'b0;
                mret = 1'b0;
                use_rs1 = 1'b0;
                use_rs2 = 1'b0;
            end

            `BITPAT_JALR: begin
                imm = {{20{inst[31]}}, inst[31:20]};
                alu_in1_sel = `ALU_IN1_SEL_RS1_DATA;
                alu_in2_sel = `ALU_IN2_SEL_IMM;
                alu_sel = `ALU_SEL_ADD;
                reg_we = 1'b1;
                e_out_sel = `E_OUT_SEL_PC_PLUS4;
                jump = 1'b1;
                branch = 1'b0;
                load = 1'b0;
                store = 1'b0;
                zicsr = 1'b0;
                ecall = 1'b0;
                mret = 1'b0;
                use_rs1 = 1'b1;
                use_rs2 = 1'b0;
            end

            `BITPAT_BRANCH: begin
                imm = {{20{inst[31]}}, inst[7], inst[30:25], inst[11:8], 1'b0};
                alu_in1_sel = `ALU_IN1_SEL_PC;
                alu_in2_sel = `ALU_IN2_SEL_IMM;
                alu_sel = `ALU_SEL_ADD;
                reg_we = 1'b0;
                e_out_sel = `E_OUT_SEL_ALU_OUT;
                jump = 1'b0;
                branch = 1'b1;
                casex(inst)
                    `BITPAT_BEQ:; 
                    `BITPAT_BNE:;
                    `BITPAT_BLT:;
                    `BITPAT_BGE:;
                    `BITPAT_BLTU:;
                    `BITPAT_BGEU:;
                    default: begin
                        branch = 1'b0;
                        illegal_inst = 1'b1;
                    end
                endcase
                load = 1'b0;
                store = 1'b0;
                zicsr = 1'b0;
                ecall = 1'b0;
                mret = 1'b0;
                use_rs1 = 1'b1;
                use_rs2 = 1'b1;
            end

            `BITPAT_LOAD: begin
                imm = {{20{inst[31]}}, inst[31:20]};
                alu_in1_sel = `ALU_IN1_SEL_RS1_DATA;
                alu_in2_sel = `ALU_IN2_SEL_IMM;
                alu_sel = `ALU_SEL_ADD;
                reg_we = 1'b1;
                e_out_sel = `E_OUT_SEL_ALU_OUT;
                jump = 1'b0;
                branch = 1'b0;
                load = 1'b1;
                store = 1'b0;
                casex(inst)
                    `BITPAT_LB:;
                    `BITPAT_LH:;
                    `BITPAT_LW:;
                    `BITPAT_LBU:;
                    `BITPAT_LHU:;
                    default: begin
                        load = 1'b0;
                        illegal_inst = 1'b1;
                    end
                endcase
                zicsr = 1'b0;
                ecall = 1'b0;
                mret = 1'b0;
                use_rs1 = 1'b1;
                use_rs2 = 1'b0;
            end

            `BITPAT_STORE: begin
                imm = {{20{inst[31]}}, inst[31:25], inst[11:7]};
                alu_in1_sel = `ALU_IN1_SEL_RS1_DATA;
                alu_in2_sel = `ALU_IN2_SEL_IMM;
                alu_sel = `ALU_SEL_ADD;
                reg_we = 1'b0;
                e_out_sel = `E_OUT_SEL_ALU_OUT;
                jump = 1'b0;
                branch = 1'b0;
                load = 1'b0;
                store = 1'b1;
                casex(inst)
                    `BITPAT_SB:;
                    `BITPAT_SH:;
                    `BITPAT_SW:;
                    default: begin
                        store = 1'b0;
                        illegal_inst = 1'b1;
                    end
                endcase
                zicsr = 1'b0;
                ecall = 1'b0;
                mret = 1'b0;
                use_rs1 = 1'b1;
                use_rs2 = 1'b1;
            end

            `BITPAT_SYSTEM: begin
                imm = 32'bx;
                alu_in1_sel = `ALU_IN1_SEL_X;
                alu_in2_sel = `ALU_IN2_SEL_X;
                alu_sel = `ALU_SEL_X;
                reg_we = 1'b1;
                e_out_sel = `E_OUT_SEL_CSR_R_DATA;
                jump = 1'b0;
                branch = 1'b0;
                load = 1'b0;
                store = 1'b0;
                casex(inst)
                    `BITPAT_ECALL: begin
                        zicsr = 1'b0;
                        ecall = 1'b1;
                        mret = 1'b0;
                        use_rs1 = 1'b0;
                    end
                    `BITPAT_CSRRW: begin
                        zicsr = 1'b1;
                        ecall = 1'b0;
                        mret = 1'b0;
                        use_rs1 = 1'b1;
                    end
                    `BITPAT_CSRRS: begin
                        zicsr = 1'b1;
                        ecall = 1'b0;
                        mret = 1'b0;
                        use_rs1 = 1'b1;
                    end
                    `BITPAT_CSRRC: begin
                        zicsr = 1'b1;
                        ecall = 1'b0;
                        mret = 1'b0;
                        use_rs1 = 1'b1;
                    end
                    `BITPAT_CSRRWI: begin
                        zicsr = 1'b1;
                        ecall = 1'b0;
                        mret = 1'b0;
                        use_rs1 = 1'b0;
                    end
                    `BITPAT_CSRRSI: begin
                        zicsr = 1'b1;
                        ecall = 1'b0;
                        mret = 1'b0;
                        use_rs1 = 1'b0;
                    end
                    `BITPAT_CSRRCI: begin
                        zicsr = 1'b1;
                        ecall = 1'b0;
                        mret = 1'b0;
                        use_rs1 = 1'b0;
                    end
                    `BITPAT_MRET: begin
                        zicsr = 1'b0;
                        ecall = 1'b0;
                        mret = 1'b1;
                        use_rs1 = 1'b0;
                    end
                    default: begin
                        reg_we = 1'b0;
                        zicsr = 1'b0;
                        ecall = 1'b0;
                        mret = 1'b0;
                        use_rs1 = 1'b0;
                        illegal_inst = 1'b1;
                    end
                endcase
                use_rs2 = 1'b0;
            end
            
            default: begin
                imm = 32'bx;
                alu_in1_sel = `ALU_IN1_SEL_X;
                alu_in2_sel = `ALU_IN2_SEL_X;
                alu_sel = `ALU_SEL_X;
                reg_we = 1'b0;
                e_out_sel = `E_OUT_SEL_X;
                jump = 1'b0;
                branch = 1'b0;
                load = 1'b0;
                store = 1'b0;
                zicsr = 1'b0;
                ecall = 1'b0;
                mret = 1'b0;
                use_rs1 = 1'b0;
                use_rs2 = 1'b0;
            end
        endcase
    end

    reg lduse_rs1;
    reg lduse_rs2;
    always @* begin
        if (use_rs1) begin
            if (e_reg_we & (e_rd_addr != 5'b0) & (inst[19:15] == e_rd_addr)) begin
                if (e_load) begin
                    rs1_sel = `RS1_SEL_X;
                    lduse_rs1 = 1'b1;
                end else begin
                    rs1_sel = `RS1_SEL_E_OUT;
                    lduse_rs1 = 1'b0;
                end
            end else begin
                rs1_sel = `RS1_SEL_TMP_RS1_DATA;
                lduse_rs1 = 1'b0;
            end
        end else begin
            rs1_sel = `RS1_SEL_X;
            lduse_rs1 = 1'b0;
        end
        if (use_rs2) begin 
            if (e_reg_we & (e_rd_addr != 5'b0) & (inst[24:20] == e_rd_addr)) begin
                if (e_load) begin
                    rs2_sel = `RS2_SEL_X;
                    lduse_rs2 = 1'b1;
                end else begin
                    rs2_sel = `RS2_SEL_E_OUT;
                    lduse_rs2 = 1'b0;
                end
            end else begin
                rs2_sel = `RS2_SEL_TMP_RS2_DATA;
                lduse_rs2 = 1'b0;
            end
        end else begin
            rs2_sel = `RS2_SEL_X;
            lduse_rs2 = 1'b0;
        end
    end
    assign lduse = lduse_rs1 | lduse_rs2;
    
endmodule

`default_nettype wire