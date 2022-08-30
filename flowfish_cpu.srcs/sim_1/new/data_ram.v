`timescale 1ns / 1ps
`include "defines.vh"

module data_ram (
    input wire clk,
    input wire ce,
    input wire we,
    input wire[`DataAddrBus] addr,
    input wire[`DataBus] data_i,
    output reg[`DataBus] data_o
);
    reg[0:31] data_mem[0:`DataMemNum - 1];
    always @(posedge clk) begin
        if (ce == `ChipDisable) begin
            
        end else if (we == `WriteEnable) begin
            data_mem[addr[`DataMemNumLog2+1:2]] <= data_i;
        end
    end

    always @(*) begin
        if (ce == `ChipDisable) begin
            data_o <= `ZeroWord;
        end else if (we == `WriteDisable) begin
            data_o <= data_mem[addr[`DataMemNumLog2+1:2]];
        end else begin 
            data_o <= `ZeroWord;
        end
    end

endmodule