`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/08/30 15:02:00
// Design Name: 
// Module Name: light_show
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

module light_show(                  //定义输入输出端口
    input       I_clk,              //时钟时钟
    input       I_rst,              //复位信号
    input       [7:0] I_show_num,   
    output      [6:0] O_led,
    output      [1:0] O_px
    );
    
    parameter   C_COUNTER_NUM = 1000000;
    
    reg  [3:0]  R_temp;
    reg  [1:0]  R_px_temp;
    reg  [32:0] R_counter;
    
    wire [7:0]  W_show_num;
    
    assign W_show_num = I_show_num;
    
    always@(posedge I_clk or negedge I_rst)
    begin
        if(!I_rst)
        begin
            R_px_temp <= 2'b01;
            R_counter <= 0;
        end
        else if(R_px_temp == 2'b01 && R_counter >= C_COUNTER_NUM)
        begin
            R_temp <= W_show_num[7:4];
            R_px_temp <= 2'b10;
            R_counter <= 0;
        end
        else if(R_px_temp == 2'b10 && R_counter >= C_COUNTER_NUM)
        begin
            R_temp <= W_show_num[3:0];
            R_px_temp <= 2'b01;
            R_counter <= 0;
        end
        else
        begin
            R_counter <= R_counter + 1;
        end
    end
    
    assign O_led[0] = (R_temp == 4'b0000||R_temp == 4'b0001||R_temp == 4'b0111
                            ||R_temp == 4'b1100)?0:1;
    assign O_led[1] = (R_temp == 4'b0001||R_temp == 4'b0010||R_temp == 4'b0011
                            ||R_temp == 4'b0111||R_temp == 4'b1101)?0:1;
    assign O_led[2] = (R_temp == 4'b0001||R_temp == 4'b0011||R_temp == 4'b0100
                            ||R_temp == 4'b0101||R_temp == 4'b0111||R_temp == 4'b1001)?0:1;
    assign O_led[3] = (R_temp == 4'b0001||R_temp == 4'b0100||R_temp == 4'b0111
                            ||R_temp == 4'b1010||R_temp == 4'b1111)?0:1;
    assign O_led[4] = (R_temp == 4'b0010||R_temp == 4'b1100||R_temp == 4'b1110
                            ||R_temp == 4'b1111)?0:1;
    assign O_led[5] = (R_temp == 4'b0101||R_temp == 4'b0110||R_temp == 4'b1011
                            ||R_temp == 4'b1100||R_temp == 4'b1110||R_temp == 4'b1111)?0:1;
    assign O_led[6] = (R_temp == 4'b0001||R_temp == 4'b0100||R_temp == 4'b1011
                            ||R_temp == 4'b1101)?0:1;
    assign O_px = R_px_temp;   
endmodule

