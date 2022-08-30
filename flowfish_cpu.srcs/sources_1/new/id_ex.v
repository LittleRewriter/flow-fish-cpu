`timescale 1ns / 1ps
`include "defines.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/23 20:18:21
// Design Name: 
// Module Name: id_ex
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

module id_ex(
    input wire rst,
    input wire clk,
    input wire[`AluSelBus] id_alusel,
    input wire[`AluOpBus] id_aluop,
    input wire[`RegBus] id_reg1,
    input wire[`RegBus] id_reg2,
    input wire[`RegAddrBus] id_wd,
    input wire id_wreg,
    input wire[`InstBus] id_inst,
    input wire[5:0] stall_i,
    input wire[`RegBus] id_link_address,
    input wire id_is_in_delayslot, 
    input wire next_inst_in_delayslot_i,

    output reg[`AluSelBus] ex_alusel,
    output reg[`AluOpBus] ex_aluop,
    output reg[`RegBus] ex_reg1,
    output reg[`RegBus] ex_reg2,
    output reg[`RegAddrBus] ex_wd,
    output reg ex_wreg,
    output reg[`InstBus] ex_inst,
    output reg[`RegBus] ex_link_address,
    output reg ex_is_in_delayslot,
    output reg is_in_delayslot_o
    );
    
    always @(posedge clk) begin
        if (rst == `RstEnable) begin
            ex_aluop <= `EXE_NOP_OP;
            ex_alusel <= `EXE_RES_NOP;
            ex_reg1 <= `ZeroWord;
            ex_reg2 <= `ZeroWord;
            ex_wd <= `NOPRegAddr;
            ex_wreg <= `WriteDisable;
            ex_inst <= `ZeroWord;
            ex_link_address <= `ZeroWord;
            ex_is_in_delayslot <= 1'b0;
            is_in_delayslot_o <= 1'b0;
        end else if(stall_i[2] == 1'b1 && stall_i[3] == 1'b0) begin 
            ex_aluop <= `EXE_NOP_OP;
            ex_alusel <= `EXE_RES_NOP;
            ex_reg1 <= `ZeroWord;
            ex_reg2 <= `ZeroWord;
            ex_wd <= `NOPRegAddr;
            ex_wreg <= `WriteDisable;
            ex_inst <= `ZeroWord;
            ex_link_address <= `ZeroWord;
            ex_is_in_delayslot <= 1'b0;
        end else if(stall_i[2] == 1'b0) begin
            ex_aluop <= id_aluop;
            ex_alusel <= id_alusel;
            ex_reg1 <= id_reg1;
            ex_reg2 <= id_reg2;
            ex_wd <= id_wd;
            ex_wreg <= id_wreg;
            ex_inst <= id_inst;
            ex_link_address <= id_link_address;
            ex_is_in_delayslot <= id_is_in_delayslot;
            is_in_delayslot_o <= next_inst_in_delayslot_i;
        end
    end
    
endmodule
