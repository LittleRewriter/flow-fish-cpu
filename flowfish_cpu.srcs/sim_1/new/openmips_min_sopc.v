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
    
    openmips openmips_0(
    	.clk        (clk        ),
        .rst        (rst        )
    );
    
    
endmodule
