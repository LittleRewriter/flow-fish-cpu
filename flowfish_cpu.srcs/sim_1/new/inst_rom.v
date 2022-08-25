`timescale 1ns / 1ps
`include "defines.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/24 10:57:25
// Design Name: 
// Module Name: inst_rom
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


module inst_rom(
    input wire ce,
    input wire[`InstAddrBus] addr,
    output reg[`InstBus] inst
    );
    
    reg[`InstBus] inst_mem[0:`InstMemNum - 1];
    
    initial $readmemh("inst_rom.data", inst_mem);
    
    always @(*) begin
        if (ce == `ChipDisable) begin
            inst <= `ZeroWord;
        end else begin
            // �ֽڶ��룬��Ҫ����4������ȡ����2λ֮��Ĳ���
            inst <= inst_mem[addr[`InstMemNumLog2+1:2]];
        end
    end
    
endmodule
