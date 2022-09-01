`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/01 16:31:43
// Design Name: 
// Module Name: top
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


module top(
    input wire clk,
    input wire rst,
    output wire [1:0] sel_a,
    output wire [6:0] enc_a,
    output wire [1:0] sel_b,
    output wire [6:0] enc_b
    );
    
    wire[31:0] o_data;
    
    wire[31:0] dump_data;
    assign dump_data = 31'h890abcef;
    
    flowfishmips flowfishmips_0(
    	.clk        (clk        ),
        .rst        (rst        ),
        .data_o     (o_data     )
    );
    
    wire[20:0] div_n;
   
    
    assign div_n = 21'd1000000;
    
    led_0 led_00 (
        .clk        (clk        ),
        .rst        (rst        ),
        .input_data (dump_data     ),
        .div_num    (div_n      ),
        .sel_a      (sel_a      ),
        .enc_a      (enc_a      ),
        .sel_b      (sel_b      ),
        .enc_b      (enc_b      )
    );
    
    ila ila0 (
	.clk(clk), // input wire clk
	.probe0(o_data), // input wire [7:0]  probe0  
	.probe1({sel_a, sel_b}), // input wire [3:0]  probe1 
	.probe2({clk, clk, clk, clk}) // input wire [3:0]  probe2
);
    
endmodule
