`timescale 1ns / 1ps
`include "defines.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/23 17:14:29
// Design Name: 
// Module Name: if_id
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


module if_id(
    input wire rst,
    input wire clk,
    input wire[`InstAddrBus] if_pc,
    input wire[`InstBus] if_inst,
    input wire[5:0] stall_i,
    output reg[`InstAddrBus] id_pc,
    output reg[`InstBus] id_inst
    );
    
    always @ (posedge clk) begin
        if (rst == `RstEnable) begin
            id_pc <= `ZeroWord;
            id_inst <= `ZeroWord;
        end else if(stall_i[1] == 1'b1 && stall_i[2] == 1'b0) begin 
            id_pc <= `ZeroWord;
            id_inst <= `ZeroWord;
        end else if (stall_i[1] == 1'b0) begin
            id_pc <= if_pc;
            id_inst <= if_inst;
        end
    end
    
endmodule
