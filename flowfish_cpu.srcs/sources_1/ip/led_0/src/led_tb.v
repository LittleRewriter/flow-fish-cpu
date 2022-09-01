`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/31 12:09:20
// Design Name: 
// Module Name: led_tb
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


module led_tb();
    reg CLOCK_50;
    reg rst;
    
    wire [1:0] sel_a;
    wire [6:0] enc_a;
    wire [1:0] sel_b;
    wire [6:0] enc_b;
    
    reg[31:0] data;
    
    initial begin
        CLOCK_50 = 1'b0;
        forever #1 CLOCK_50 = ~CLOCK_50;
    end
    
    initial begin
        data = 32'h0;
        forever #1000 data = data + 32'h01919810;
    end
    
    initial begin
        rst = 1'b1;
        #100 rst = 1'b0;
        #10000 $stop;
    end
    
    led led_0(
        .clk(CLOCK_50),
        .rst(rst),
        .input_data(data),
        .sel_a(sel_a),
        .enc_a(enc_a),
        .sel_b(sel_b),
        .enc_b(enc_b)
    );
    
endmodule
