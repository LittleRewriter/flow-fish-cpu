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

    output reg reg1_read_o,
    output reg reg2_read_o,
    output reg[`RegAddrBus] reg1_addr_o,
    output reg[`RegAddrBus] reg2_addr_o,
    output reg[`AluOpBus] aluop_o,
    output reg[`AluSelBus] alusel_o,
    output reg[`RegBus] reg1_o,
    output reg[`RegBus] reg2_o,
    output reg[`RegAddrBus] wd_o,
    output reg wreg_o
    );
    
    wire[5:0] inst = inst_i[31:26];
    wire[4:0] op2 = inst_i[10:6];
    wire[5:0] func = inst_i[5:0];
    wire[4:0] op4 = inst_i[20:16];
    wire[10:0] op5 = inst_i[31:21];
    
    reg[`RegBus] imm;
    reg instvalid;
    
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
            case (inst)
                `EXE_SPECIAL: begin
                    case(op2)
                        5'b00000: begin
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
                `EXE_PREF: begin
                    wreg_o <= `WriteDisable;
                    aluop_o <= `EXE_NOP_OP;
                    alusel_o <= `EXE_RES_NOP;
                    reg1_read_o <= 1'b0;
                    reg2_read_o <= 1'b0;
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
        if (rst == `RstEnable) begin
            reg1_o <= `ZeroWord;
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
        if (rst == `RstEnable) begin
            reg2_o <= `ZeroWord;
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
    
endmodule
