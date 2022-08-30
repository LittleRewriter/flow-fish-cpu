`timescale 1ns / 1ps
`include "defines.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/23 20:54:54
// Design Name: 
// Module Name: mem
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


module mem(
    input wire rst,
    input wire[`RegAddrBus] wd_i,
    input wire wreg_i,
    input wire[`RegBus] wdata_i,
    input wire[`AluOpBus] aluop_i,
    input wire[`DataAddrBus] mem_addr_i,
    input wire[`RegBus] reg2_i,
    input wire[`DataBus] mem_data_i,
    input wire[5:0] stall_i,
    output reg[`RegAddrBus] wd_o,
    output reg wreg_o,
    output reg[`RegBus] wdata_o,
    output reg[`DataAddrBus] mem_addr_o,
    output wire mem_we_o,
    output reg[`DataBus] mem_data_o,
    output reg mem_ce_o
    );

    reg mem_we;
    assign mem_we_o = mem_we;

    always @(*) begin
        if(rst == `RstEnable) begin
            wd_o <= `NOPRegAddr;
            wreg_o <= `WriteDisable;
            wdata_o <= `ZeroWord;
            mem_addr_o <= `ZeroWord;
            mem_we <= `WriteDisable;
            mem_data_o <= `ZeroWord;
            mem_ce_o <= `ChipDisable;
        end else if(stall_i[4] == 1'b1 && stall_i[5] == 1'b0) begin 
            wd_o <= `NOPRegAddr;
            wreg_o <= `WriteDisable;
            wdata_o <= `ZeroWord;
            mem_addr_o <= `ZeroWord;
            mem_we <= `WriteDisable;
            mem_data_o <= `ZeroWord;
            mem_ce_o <= `ChipDisable;
        end else if(stall_i[4] == 1'b0) begin
            wd_o <= wd_i;
            wreg_o <= wreg_i;
            case (aluop_i)
                {2'b00, `EXE_LW}: begin
                    mem_addr_o <= mem_addr_i;
                    mem_we <= `WriteDisable;
                    wdata_o <= mem_data_i;
                    mem_ce_o <= `ChipEnable;
                end 
                {2'b00, `EXE_SW}: begin
                    mem_addr_o <= mem_addr_i;
                    mem_we <= `WriteEnable;
                    mem_data_o <= reg2_i;
                    mem_ce_o <= `ChipEnable;
                end
                default: begin
                    wdata_o <= wdata_i;
                    mem_addr_o <= `ZeroWord;
                    mem_we <= `WriteEnable;
                    mem_ce_o <= `ChipDisable;
                end
            endcase
        end
    end 
endmodule
