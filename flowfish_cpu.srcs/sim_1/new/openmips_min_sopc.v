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


module flowfishmips_min_sopc(
    input wire clk,
    input wire rst
    );
    
    wire [1:0] sel_a;
    wire [6:0] enc_a;
    wire [1:0] sel_b;
    wire [6:0] enc_b;
    
    top top_0(
    	.clk        (clk        ),
        .rst        (rst        ),
        .sel_a      (sel_a      ),
        .enc_a      (enc_a      ),
        .sel_b      (sel_b      ),
        .enc_b      (enc_b      )
    );
    
    
endmodule
