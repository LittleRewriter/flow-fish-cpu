`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/31 11:32:50
// Design Name: 
// Module Name: led
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


module led(
    input wire clk,
    input wire rst,
    input wire [31:0] input_data,
    input wire[20:0] div_num,
    output wire [1:0] sel_a,
    output wire [6:0] enc_a,
    output wire [1:0] sel_b,
    output wire [6:0] enc_b
    );
    
    wire clk_div;
    wire [6:0] enc_a_i;
    wire [6:0] enc_b_i;
    
    time_div time_div_0(
        .rst(rst), 
        .clk_i(clk),
        .div(div_num),
        .clk_o(clk_div)
    );
    
    wire[3:0] data_0, data_1, data_2, data_3, data_4, data_5, data_6, data_7;
    
    assign {data_7, data_6, data_5, data_4, data_3, data_2, data_1, data_0} = input_data;
    
    reg[1:0] div_cnt;
    reg[3:0] single_data_a;
    reg[3:0] single_data_b;
    
    always @(posedge clk_div or posedge rst) begin
        if (rst == 1'b1) begin
            div_cnt <= 2'b0;
        end else if (div_cnt == 2'b11) begin
            div_cnt <= 2'b0;
        end else begin
            div_cnt <= div_cnt + 2'b01;
        end
    end
    
    always @(*) begin
        case (div_cnt)
            2'b00: single_data_a <= data_0;
            2'b01: single_data_a <= data_1;
            2'b10: single_data_a <= data_2;
            2'b11: single_data_a <= data_3;
        endcase
    end
    
    always @(*) begin
        case (div_cnt)
            2'b00: single_data_b <= data_4;
            2'b01: single_data_b <= data_5;
            2'b10: single_data_b <= data_6;
            2'b11: single_data_b <= data_7;
        endcase
    end
    
    
    single_led single_led_0(
        .clk(clk_div),
        .rst(rst),
        .num(single_data_a),
        .hex_enc(enc_a_i)
    );
    
    single_led single_led_1(
        .clk(clk_div),
        .rst(rst),
        .num(single_data_b),
        .hex_enc(enc_b_i)
    );
    
    assign sel_a = div_cnt[1:0];
    assign sel_b = div_cnt[1:0];
    
    assign enc_a = enc_a_i;
    assign enc_b = enc_b_i;
endmodule
