`timescale 1ns / 1ps
`include "defines.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/23 17:24:03
// Design Name: 
// Module Name: regfile
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


module regfile(
    input wire rst,
    input wire clk,
    input wire[`RegAddrBus] waddr,
    input wire[`RegBus]wdata,
    input wire we,
    input wire[`RegAddrBus]raddr1,
    input wire re1,
    output reg [`RegBus] rdata1,
    input wire[`RegAddrBus] raddr2,
    input wire re2,
    output reg [`RegBus] rdata2
    );
    
    reg[`RegBus] regs[0:`RegNum-1];
    
    always @ (posedge clk) begin
        if (rst == `RstDisable) begin
            // in MIPS, r0 equals 0 forever, so we must ban the write
            if ((we == `WriteEnable) && (waddr != `RegNumLog2'h0)) begin
                regs[waddr] <= wdata;
            end
        end
    end
    
    always @ (*) begin
        // reset 或 a0
        if (rst == `RstEnable) begin
            rdata1 <= `ZeroWord;
        end else if (raddr1 == `RegNumLog2'h0) begin
            rdata1 <= `ZeroWord;
        // 同一时刻的写入和读出信号
        end else if ((raddr1 == waddr) && (we == `WriteEnable)
                        && (re1 == `ReadEnable)) begin
            rdata1 <= wdata;
        // 直接读出
        end else if (re1 == `ReadEnable) begin
            rdata1 <= regs[raddr1];
        end else begin
            rdata1 <= `ZeroWord;
        end
    end
    
     always @ (*) begin
        // reset 或 a0
        if (rst == `RstEnable) begin
            rdata2 <= `ZeroWord;
        end else if (raddr2 == `RegNumLog2'h0) begin
            rdata2 <= `ZeroWord;
        // 同一时刻的写入和读出信号
        end else if ((raddr2 == waddr) && (we == `WriteEnable)
                        && (re2 == `ReadEnable)) begin
            rdata2 <= wdata;
        // 直接读出
        end else if (re2 == `ReadEnable) begin
            rdata2 <= regs[raddr2];
        end else begin
            rdata2 <= `ZeroWord;
        end
    end
    
endmodule
