`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/31 12:20:19
// Design Name: 
// Module Name: time_div
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


module time_div(
    input wire rst,
    input wire clk_i,
    input wire[15:0] div,
    output reg clk_o
    );
    
    reg[15:0] cnt;
    
    always @(posedge clk_i) begin
        if (rst == 1'b1) begin
            cnt <= 1'b0;
            clk_o <= 1'b0;
        end else begin
            if (cnt == div) begin
                clk_o <= ~clk_o;
                cnt <= 1'b0;
            end else begin
                cnt <= cnt + 1'b1;
            end
        end
    end
    
    
    
endmodule
