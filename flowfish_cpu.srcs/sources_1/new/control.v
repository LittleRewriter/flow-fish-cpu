`timescale 1ns/1ps
`include "defines.vh"

module control (
    input wire rst,
    input wire stallreq_from_id,
    input wire stallreq_from_ex,
    output reg[5:0] stall_o 
);


    always @(*) begin
        if(rst == `RstEnable) begin
            stall_o <= 6'b000000;
        end else if(stallreq_from_id == 1'b1) begin
            stall_o <= 6'b001111;
        end else if(stallreq_from_ex == 1'b1) begin
            stall_o <= 6'b000111;
        end else begin
            stall_o <= 6'b000000;
        end
    end
endmodule