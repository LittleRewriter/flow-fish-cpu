`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/31 11:13:22
// Design Name: 
// Module Name: single_led
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


module single_led(
    input wire clk,
    input wire rst,
    input wire[3:0] num,
    output reg[6:0] hex_enc
    );
    
    always @(posedge clk) begin
        case (num)
            4'b0000: hex_enc <= 7'h3f;
            4'b0001: hex_enc <= 7'h06;
            4'b0010: hex_enc <= 7'h56;
            4'b0011: hex_enc <= 7'h4f;
            4'b0100: hex_enc <= 7'h66;
            4'b0101: hex_enc <= 7'h6d;
            4'b0110: hex_enc <= 7'h7d;
            4'b0111: hex_enc <= 7'h07;
            4'b1000: hex_enc <= 7'h7f;
            4'b1001: hex_enc <= 7'h6f;
            4'b1010: hex_enc <= 7'h77;
            4'b1011: hex_enc <= 7'h7c;
            4'b1100: hex_enc <= 7'h39;
            4'b1101: hex_enc <= 7'h5e;
            4'b1110: hex_enc <= 7'h79;
            4'b1111: hex_enc <= 7'h71;
        endcase
    end
    
endmodule
