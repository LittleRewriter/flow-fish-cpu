`timescale 1ns/1ps
`include "defines.vh"

module control (
    input wire rst,
    input wire stallreq_from_id,
    input wire stallreq_from_ex,
    input wire stallreq_from_if,
    input wire stallreq_from_mem,
    output reg[5:0] stall_o 
);


    always @(*) begin
        if(rst == `RstEnable) begin
            stall_o <= 6'b000000;
        end else if(stallreq_from_mem == 1'b1) begin
            stall_o <= 6'b011111;
        end else if(stallreq_from_id == 1'b1) begin
            stall_o <= 6'b001111;
        end else if(stallreq_from_ex == 1'b1) begin
            stall_o <= 6'b000111;
        end else if(stallreq_from_if == 1'b1) begin
            stall_o <= 6'b000111;
        end else begin
            stall_o <= 6'b000000;
        end
    end
endmodule