`timescale 1ns / 1ps
`include "defines.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/23 18:14:57
// Design Name: 
// Module Name: id
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module id(
    input wire rst,
    input wire[`InstAddrBus] pc_i,
    input wire[`InstBus] inst_i,
    input wire[`RegBus] reg1_data_i,
    input wire[`RegBus] reg2_data_i,
    
    // added for receiving reg message from exe and mem period
    input wire[0:0] ex_wreg_i, // whether exe write into reg
    input wire[`RegAddrBus] ex_wd_i,// write into which reg
    input wire[`RegBus] ex_wdata_i, //write what into reg
    input wire[0:0] mem_wreg_i, // whether read data from mem to reg
    input wire[`RegAddrBus] mem_wd_i,
    input wire[`RegBus] mem_wdata_i,
    input wire is_in_delayslot_i, // whether curr inst ad id-period is in delay_slot

    input wire[`AluOpBus] ex_aluop_i, // the instruction emit in ex-period

    output reg reg1_read_o,
    output reg reg2_read_o,
    output reg[`RegAddrBus] reg1_addr_o,
    output reg[`RegAddrBus] reg2_addr_o,
    output reg[`AluOpBus] aluop_o,
    output reg[`AluSelBus] alusel_o,
    output reg[`RegBus] reg1_o,
    output reg[`RegBus] reg2_o,
    output reg[`RegAddrBus] wd_o,
    output reg wreg_o,
    output wire[`InstBus] inst_id_o,

    output reg next_inst_in_delayslot_o, 
    output reg branch_flag_o, // whether branch happen
    output reg[`RegBus] branch_target_address_o,
    output reg[`RegBus] link_addr_o, // ret addr of branch inst(save current pc addr?)
    output reg is_in_delayslot_o,
    output wire stallreq
    );
    
    wire[5:0] inst = inst_i[31:26];
    wire[4:0] op2 = inst_i[10:6];
    wire[5:0] func = inst_i[5:0];
    wire[4:0] op4 = inst_i[20:16];
    wire[10:0] op5 = inst_i[31:21];
    
    wire[`RegBus] pc_plus_8;
    wire[`RegBus] pc_plus_4;
    wire[`RegBus] imm_sll2_signedext; //?? 

    reg[`RegBus] imm;
    reg instvalid;

    assign inst_id_o = inst_i;
    assign pc_plus_8 = pc_i + 32'h00000008;
    assign pc_plus_4 = pc_i + 32'h00000004;
    assign imm_sll2_signedext = {{14{inst_i[15]}}, inst_i[15:0], 2'b00};

    reg stallreq_for_reg1_loadrelate; // reg1 has load havard
    reg stallreq_for_reg2_loadrelate; // reg2 has load havard
    wire pre_inst_is_load;  // whether pre is load

    assign pre_inst_is_load = ((ex_aluop_i == `EXE_LW) || (ex_aluop_i == `EXE_SW)) ? 1'b1 : 1'b0;
    
    always @(*) begin
        if (rst == `RstEnable) begin
            aluop_o <= `EXE_NOP_OP;
            alusel_o <= `EXE_RES_NOP;
            wd_o <= `NOPRegAddr;
            wreg_o <= `WriteDisable;
            instvalid <= `InstValid;
            reg1_read_o <= 1'b0;
            reg2_read_o <= 1'b0;
            reg1_addr_o <= `NOPRegAddr;
            reg2_addr_o <= `NOPRegAddr;
            imm <= `ZeroWord;
            link_addr_o <= `ZeroWord;
            branch_target_address_o <= `ZeroWord;
            branch_flag_o <=1'b0;
            next_inst_in_delayslot_o <= 1'b0;
        end else begin
            aluop_o <= `EXE_NOP_OP;
            alusel_o <= `EXE_RES_NOP;
            wd_o <= inst_i[15:11];
            wreg_o <= `WriteDisable;
            instvalid <= `InstValid;
            reg1_read_o <= 1'b0;
            reg2_read_o <= 1'b0;
            // get reg1 addr from inst
            reg1_addr_o <= inst_i[25:21];
            // get reg2 addr from inst
            reg2_addr_o <= inst_i[20:16];
            imm <= `ZeroWord;
            link_addr_o <= `ZeroWord;
            branch_target_address_o <= `ZeroWord;
            branch_flag_o <= 1'b0;
            next_inst_in_delayslot_o <= 1'b0;
            case (inst)
                `EXE_SPECIAL: begin
                    case(op2)
                        5'b00000: begin
                            case (func)
                                `FUNC_MOVN: begin
                                    if(reg2_o == `ZeroWord) begin
                                        wreg_o <= `WriteEnable;
                                    end else begin
                                        wreg_o <= `WriteDisable;
                                    end
                                    wreg_o <= `WriteEnable;
                                    aluop_o <= {2'b00, func};

                                    alusel_o <= `EXE_RES_MOV;
                                    reg1_addr_o <= 1'b1;
                                    reg2_read_o <= 1'b1;
                                    instvalid <= `InstValid;
                                end
                                `FUNC_MOVZ: begin
                                    if(reg2_o == `ZeroWord) begin
                                        wreg_o <= `WriteEnable;
                                    end else begin
                                        wreg_o <= `WriteDisable;
                                    end
                                    aluop_o <= {2'b00, func};

                                    alusel_o <= `EXE_RES_MOV;
                                    reg1_addr_o <= 1'b1;
                                    reg2_read_o <= 1'b1;
                                    instvalid <= `InstValid;
                                end
                                `FUNC_SLT: begin
                                    wreg_o <= `WriteEnable;

                                    aluop_o <= {2'b00, func};

                                    alusel_o <= `EXE_RES_ARITHMETIC;
                                    reg1_addr_o <= 1'b1;
                                    reg2_read_o <= 1'b1;
                                    instvalid <= `InstValid;
                                end
                                `FUNC_SLTU: begin
                                    wreg_o <= `WriteEnable;

                                    aluop_o <= {2'b00, func};

                                    alusel_o <= `EXE_RES_ARITHMETIC;
                                    reg1_addr_o <= 1'b1;
                                    reg2_read_o <= 1'b1;
                                    instvalid <= `InstValid;
                                end
                                `FUNC_ADD: begin
                                    wreg_o <= `WriteEnable;

                                    aluop_o <= {2'b00, func};

                                    alusel_o <= `EXE_RES_ARITHMETIC;
                                    reg1_addr_o <= 1'b1;
                                    reg2_read_o <= 1'b1;
                                    instvalid <= `InstValid;
                                end
                                `FUNC_ADDU: begin
                                    wreg_o <= `WriteEnable;

                                    aluop_o <= {2'b00, func};

                                    alusel_o <= `EXE_RES_ARITHMETIC;
                                    reg1_addr_o <= 1'b1;
                                    reg2_read_o <= 1'b1;
                                    instvalid <= `InstValid;
                                end
                                `FUNC_SUB: begin
                                    wreg_o <= `WriteEnable;

                                    aluop_o <= {2'b00, func};

                                    alusel_o <= `EXE_RES_ARITHMETIC;
                                    reg1_addr_o <= 1'b1;
                                    reg2_read_o <= 1'b1;
                                    instvalid <= `InstValid;
                                end
                                `FUNC_SUBU: begin
                                    wreg_o <= `WriteEnable;

                                    aluop_o <= {2'b00, func};

                                    alusel_o <= `EXE_RES_ARITHMETIC;
                                    reg1_addr_o <= 1'b1;
                                    reg2_read_o <= 1'b1;
                                    instvalid <= `InstValid;
                                end
                                default: begin
                                    // for shift and logic
                                    wreg_o <= `WriteEnable;
                                    // observe that aluop is:
                                    // 1. concat 00 to inst code, for and or nor xor
                                    // 2. concat 00 to inst code and set bitstream[2] as 1, for sllv srlv srav 
                                    aluop_o <= {2'b00, func}|8'h04;

                                    alusel_o <= `EXE_RES_LOGIC;
                                    reg1_addr_o <= 1'b1;
                                    reg2_read_o <= 1'b1;
                                    instvalid <= `InstValid;
                                end
                            endcase
                        end
                        default: begin
                            
                        end
                    endcase
                end
                `EXE_ORI: begin
                    // write enabled
                    wreg_o <= `WriteEnable;
                    // switch alu into 'or' mode
                    aluop_o <= `EXE_OR_OP;
                    // select logic operation for alu
                    alusel_o <= `EXE_RES_LOGIC;
                    // reg 1 read needed
                    reg1_read_o <= 1'b1;
                    // reg 2 read not need (imm)
                    reg2_read_o <= 1'b0;
                    // get imm from inst
                    imm <= {16'h0, inst_i[15:0]};
                    // dst reg addr
                    wd_o <= inst_i[20:16];
                    // is valid inst
                    instvalid <= `InstValid;
                end
                `EXE_ANDI: begin
                    wreg_o <= `WriteEnable;
                    aluop_o <= `EXE_AND_OP;
                    alusel_o <= `EXE_RES_LOGIC;
                    reg1_read_o <= 1'b1;
                    reg2_read_o <= 1'b0;
                    imm <= {16'h0, inst_i[15:0]};
                    wd_o <= inst_i[20:16];
                    instvalid <= `InstValid;
                end
                `EXE_XORI: begin
                    wreg_o <= `WriteEnable;
                    aluop_o <= `EXE_XOR_OP;
                    alusel_o <= `EXE_RES_LOGIC;
                    reg1_read_o <= 1'b1;
                    reg2_read_o <= 1'b0;
                    imm <= {16'h0, inst_i[15:0]};
                    wd_o <= inst_i[20:16];
                    instvalid <= `InstValid;
                end
                `EXE_LUI: begin
                    wreg_o <= `WriteEnable;
                    aluop_o <= `EXE_XOR_OP;
                    alusel_o <= `EXE_RES_LOGIC;
                    reg1_read_o <= 1'b1;
                    reg2_read_o <= 1'b0;
                    imm <= {inst_i[15:0], 16'h0};
                    wd_o <= inst_i[20:16];
                    instvalid <= `InstValid;
                end
                `EXE_SLTI: begin
                    wreg_o <= `WriteEnable;
                    aluop_o <= {2'b00, func};
                    alusel_o <= `EXE_RES_ARITHMETIC;
                    reg1_read_o <= `ReadEnable;
                    reg2_read_o <= `ReadDisable;
                    imm <= {{16{inst_i[15]}}, inst_i[15:0]};
                    wd_o <= inst_i[20:16];
                    instvalid <= `InstValid;
                end
                `EXE_ADDI: begin
                    wreg_o <= `WriteEnable;
                    aluop_o <= {2'b00, func};
                    alusel_o <= `EXE_RES_ARITHMETIC;
                    reg1_read_o <= `ReadEnable;
                    reg2_read_o <= `ReadDisable;
                    imm <= {{16{inst_i[15]}}, inst_i[15:0]};
                    wd_o <= inst_i[20:16];
                    instvalid <= `InstValid;
                end
                `EXE_ADDIU: begin
                    wreg_o <= `WriteEnable;
                    aluop_o <= {2'b00, inst};
                    alusel_o <= `EXE_RES_ARITHMETIC;
                    reg1_read_o <= `ReadEnable;
                    reg2_read_o <= `ReadDisable;
                    imm <= {{16{inst_i[15]}}, inst_i[15:0]};
                    wd_o <= inst_i[20:16];
                    instvalid <= `InstValid;
                end
                `EXE_PREF: begin
                    wreg_o <= `WriteDisable;
                    aluop_o <= `EXE_NOP_OP;
                    alusel_o <= `EXE_RES_NOP;
                    reg1_read_o <= 1'b0;
                    reg2_read_o <= 1'b0;
                    instvalid <= `InstValid;
                end
                `EXE_J: begin
                    wreg_o <= `WriteDisable;
                    aluop_o <= {2'b00, inst};
                    alusel_o <= `EXE_RES_JUMP_BRANCH;
                    reg1_read_o <= 1'b0;
                    reg2_read_o <= 1'b0;
                    link_addr_o <= `ZeroWord;
                    branch_flag_o <= 1'b1;
                    next_inst_in_delayslot_o <= 1'b1;
                    instvalid <= `InstValid;
                    branch_target_address_o <=
                    {pc_plus_4[31:28], inst_i[25:0], 2'b00};
                end
                `EXE_BEQ: begin
                    wreg_o <= `WriteDisable;
                    aluop_o <= {2'b00, inst};
                    alusel_o <= `EXE_RES_JUMP_BRANCH;
                    reg1_read_o <= 1'b1;
                    reg2_read_o <= 1'b1;
                    instvalid <= `InstValid;
                    if(reg1_o == reg2_o) begin
                        branch_target_address_o <= pc_plus_4 + imm_sll2_signedext;
                        branch_flag_o <= 1'b1;
                        next_inst_in_delayslot_o <= 1'b1;
                    end
                
                end
                `EXE_LW:begin
                    wreg_o <= `WriteEnable;
                    aluop_o <= `EXE_LW;
                    alusel_o <= `EXE_RES_LOAD_STORE;
                    reg1_read_o <= `ReadEnable;
                    reg2_read_o <= `ReadDisable;
                    wd_o <= inst_i[20:16];
                    instvalid <= `InstValid;
                end
                `EXE_SW: begin
                    wreg_o <=`WriteDisable;
                    aluop_o <= `EXE_SW;
                    alusel_o <= `EXE_RES_LOAD_STORE;
                    reg1_read_o <= `ReadEnable;
                    reg2_read_o <= `ReadEnable;
                    instvalid <= `InstValid;
                end
                default: begin

                end
            endcase

            if(op5 == 11'h0) begin
                wreg_o <= `WriteEnable;
                alusel_o <= `EXE_RES_SHIFT;
                reg1_read_o <= 1'b0;
                reg2_read_o <= 1'b1;
                imm[4:0] <= inst_i[10:6];
                wd_o <= inst_i[15:11];
                instvalid <= `InstValid;
                case (func)
                    `FUNC_SLL: begin
                        aluop_o <= `EXE_SLL_OP;
                    end
                    `FUNC_SRL: begin
                        aluop_o <= `EXE_SRL_OP;
                    end
                    `FUNC_SRA: begin
                        aluop_o <= `EXE_SRA_OP;
                    end 
                    default: begin 
                        
                    end 
                endcase
            end
        end
    end
    
    always @(*) begin
        stallreq_for_reg1_loadrelate <= 1'b0;
        if (rst == `RstEnable) begin
            reg1_o <= `ZeroWord;
        end else if (pre_inst_is_load == 1'b1 && ex_wd_i == reg1_addr_o && reg1_read_o == 1'b1) begin
            stallreq_for_reg1_loadrelate <= 1'b1;
        end else if ((reg1_read_o == 1'b1) && (ex_wreg_i == 1'b1) && (ex_wd_i == reg1_addr_o)) begin
            reg1_o <= ex_wdata_i;
        end else if ((reg1_read_o == 1'b1) && (mem_wreg_i == 1'b1) && (mem_wd_i == reg1_addr_o)) begin
            reg1_o <= mem_wdata_i;
        end else if (reg1_read_o == 1'b1) begin
            reg1_o <= reg1_data_i;
        end else if (reg1_read_o == 1'b0) begin
            reg1_o <= imm;
        end else begin
            reg1_o <= `ZeroWord;
        end
    end
    
    always @(*) begin
        stallreq_for_reg2_loadrelate <= 1'b0;
        if (rst == `RstEnable) begin
            reg2_o <= `ZeroWord;
        end else if (pre_inst_is_load == 1'b1 && ex_wd_i == reg2_addr_o && reg2_read_o == 1'b1) begin
            stallreq_for_reg2_loadrelate <= 1'b1;
        end else if ((reg2_read_o == 1'b1) && (ex_wreg_i == 1'b1) && (ex_wd_i == reg2_addr_o)) begin
            reg2_o <= ex_wdata_i;
        end else if ((reg2_read_o == 1'b1) && (mem_wreg_i == 1'b1) && (mem_wd_i == reg2_addr_o)) begin
            reg2_o <= mem_wdata_i;
        end else if (reg2_read_o == 1'b1) begin
            reg2_o <= reg2_data_i;
        end else if (reg2_read_o == 1'b0) begin
            reg2_o <= imm;
        end else begin
            reg2_o <= `ZeroWord;
        end
    end

    always @(*) begin
        if(rst == `RstEnable) begin
            is_in_delayslot_o <= 1'b0;
        end else begin
            is_in_delayslot_o <= is_in_delayslot_i;
        end
    end

    assign stallreq = stallreq_for_reg1_loadrelate | stallreq_for_reg2_loadrelate;
    
endmodule
