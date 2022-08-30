`timescale 1ns / 1ps
`include "defines.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/24 11:12:48
// Design Name: 
// Module Name: openmips_min_sopc
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


module openmips_min_sopc(
    input wire clk,
    input wire rst
    );
    
    wire[`InstAddrBus] inst_addr;
    wire[`InstBus] inst;
    wire[5:0] debug_stall;
    wire rom_ce;
    
    openmips openmips_0(
        .clk(clk), .rst(rst),
        .rom_addr_o(inst_addr), .rom_data_i(inst),
        .rom_ce_o(rom_ce),
        .debug_stall(debug_stall)
    );
    
    inst_rom inst_rom_0(
        .ce(rom_ce),
        .addr(inst_addr), .inst(inst)
    );
    
endmodule
