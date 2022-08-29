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
    wire rom_ce;
    wire[`DataBus] ram_data_i;
    wire[`DataBus] ram_data_o;
    wire[`DataAddrBus] ram_addr;
    wire ram_we;
    wire ram_ce;

    openmips openmips_0(
    	.clk        (clk        ),
        .rst        (rst        ),
        .rom_data_i (inst       ),
        .rom_addr_o (inst_addr  ),
        .rom_ce_o   (rom_ce     ),
        .ram_data_i (ram_data_i ),
        .ram_addr_o (ram_addr   ),
        .ram_data_o (ram_data_o ),
        .ram_we_o   (ram_we     ),
        .ram_ce_o   (ram_ce     )
    );
    
    inst_rom inst_rom_0(
        .ce(rom_ce),
        .addr(inst_addr), .inst(inst)
    );

    data_ram data_ram_0(
    	.clk    (clk        ),
        .ce     (ram_ce     ),
        .we     (ram_we     ),
        .addr   (ram_addr   ),
        .data_i (ram_data_i ),
        .data_o (ram_data_o )
    );
    
    
endmodule
