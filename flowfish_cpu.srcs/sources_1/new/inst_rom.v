`timescale 1ns / 1ps
`include "defines.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/23 21:01:14
// Design Name: 
// Module Name: mem_wb
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

module inst_rom (
    input wire ce,
    input wire[`InstAddrBus] addr,
    output reg[`InstBus] inst
);

    reg[`InstBus] inst_mem[`InstMemNum-1:0];

    // initialize the inst_rom

    always @(*) begin
        if(ce == `ChipDisable) begin
            inst <= `ZeroWord;
        end else begin
            // equals to shift left to div 4(from word to byte)
            inst <= inst_mem[addr[`InstMemNumLog2+1:2]];
        end
    end
    
endmodule