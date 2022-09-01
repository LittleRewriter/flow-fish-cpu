`timescale 1ns / 1ps
`include "defines.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/24 11:15:22
// Design Name: 
// Module Name: openmips_min_spoc_tb
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


module flowfishmips_min_spoc_tb();
    reg CLOCK_50;
    reg rst;
    
    initial begin
        CLOCK_50 = 1'b0;
        forever #10 CLOCK_50 = ~CLOCK_50;
    end
    
    initial begin
        rst = `RstEnable;
        #195 rst = `RstDisable;
        #10000 $stop;
    end
    
    flowfishmips_min_sopc flowfishmips_min_sopc_0(
        .clk(CLOCK_50),
        .rst(rst)
    );
    
endmodule
