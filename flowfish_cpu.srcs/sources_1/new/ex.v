`timescale 1ns / 1ps
`include "defines.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/23 20:36:28
// Design Name: 
// Module Name: ex
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


module ex(
    input wire rst,
    input wire[`AluOpBus] aluop_i,
    input wire[`AluSelBus] alusel_i,
    input wire[`RegBus] reg1_i,
    input wire[`RegBus] reg2_i,
    input wire[`RegAddrBus] wd_i,
    input wire wreg_i,
    input wire[1:0] cnt_i, // at which period
    input wire[`InstBus] inst_i, 
    output wire[1:0] cnt_o, // next period
    output reg[`RegAddrBus] wd_o,
    output reg wreg_o,
    output reg[`RegBus] wdata_o,
    output wire[`AluOpBus] aluop_o,
    output wire[`RegBus] mem_addr_o,
    output wire[`RegBus] reg2_o
    );
    
    reg[`RegBus] logicout;
    reg[`RegBus] shiftres;
    reg[`RegBus] moveres;

    wire[0:0] ov_sum;
    wire[0:0] reg1_eq_reg2;
    wire[0:0] reg1_lt_reg2;
    reg[`RegBus] arithmeticres;
    wire[`RegBus] reg2_i_mux;
    wire[`RegBus] reg1_i_not;
    wire[`RegBus] result_sum;
    wire[`RegBus] opdata1_mult;
    wire[`RegBus] opdata2_mult;
    wire[`DoubleRegBus] hilo_temp;
    reg[`DoubleRegBus] mulres;

    assign aluop_o = aluop_i;
    assign mem_addr_o = reg1_i + {{16{inst_i[15]}}, inst_i[15:0]};
    assign reg2_o = reg2_i;

    // reg2 is reg2's complement if sub
    assign reg2_i_mux = ((aluop_i == {2'b00, `FUNC_SUB}) ||
                            (aluop_i == {2'b00, `FUNC_SUBU}) ||
                            (aluop_i == {2'b00, `FUNC_SLT}))
                            ?(~reg2_i)+1 : reg2_i;
    assign result_sum = reg1_i + reg2_i_mux;

    assign ov_sum = ((!reg1_i[31] && !reg2_i_mux[31]) &&
                        result_sum[31]) ||
                        ((reg1_i[31] && reg2_i_mux[31]) &&
                        (!result_sum[31]));
    assign reg1_lt_reg2 = (aluop_i == {2'b00, `FUNC_SLT})
                            ?((reg1_i[31] && !reg2_i[31]) ||
                            (!reg1_i[31] && !reg2_i[31] && result_sum[31]) ||
                            (reg1_i[31] && reg2_i[31] && result_sum[31]))
                            :(reg1_i < reg2_i);
    assign reg1_i_not = ~reg1_i;

    always @(*) begin
        if(rst == `RstEnable) begin
            arithmeticres <= `ZeroWord;
        end else begin
            case (aluop_i)
                {2'b00, `FUNC_SLT}, {2'b00, `FUNC_SLTU}: begin
                    arithmeticres <= reg1_lt_reg2;
                end 
                {2'b00, `FUNC_ADD}, {2'b00, `FUNC_ADDU}, {2'b00, `EXE_ADDI}, {2'b00, `EXE_ADDIU},
                {2'b00, `FUNC_SUB}, {2'b00, `FUNC_SUBU}: begin
                    arithmeticres <= result_sum;
                end
                default: begin
                    
                end
            endcase
        end
    end

    assign opdata1_mult = ((aluop_i == {2'b00, `FUNC_MUL}) && reg1_i[31] == 1'b1)?
                            (~reg1_i +1) : reg1_i;
    assign opdata2_mult = ((aluop_i == {2'b00, `FUNC_MUL}) && reg2_i[31] == 1'b1)?
                            (~reg2_i + 1) : reg1_i;
    assign hilo_temp = opdata1_mult * opdata2_mult;
    
    always @(*) begin
        if(rst == `RstEnable) begin
            mulres <= {`ZeroWord, `ZeroWord};
        end else if (aluop_i == {2'b00, `FUNC_MUL}) begin
            if(reg1_i[31] ^ reg2_i[31] == 1'b1) begin
                mulres <= ~hilo_temp + 1;
            end else begin
                mulres <= hilo_temp;
            end
        end else begin
            mulres <= hilo_temp;
        end
    end

    always @ (*) begin
        if (rst == `RstEnable) begin
            logicout <= `ZeroWord;
        end else begin
            case (aluop_i)
                `EXE_OR_OP: begin
                    logicout <= reg1_i | reg2_i;
                end
                `EXE_AND_OP: begin
                    logicout <= reg1_i & reg2_i;
                end
                `EXE_NOR_OP: begin
                    logicout <= ~(reg1_i | reg2_i);
                end
                `EXE_XOR_OP: begin
                    logicout <= reg1_i ^ reg2_i;
                end
                default: begin
                    logicout <= `ZeroWord;
                end
            endcase
        end
    end

    always @(*) begin
        if(rst == `RstEnable) begin
            shiftres <= `ZeroWord;
        end else begin
            case(aluop_i)
                `EXE_SLL_OP: begin
                    shiftres <= reg2_i << reg1_i[4:0];
                end
                `EXE_SRL_OP: begin
                    shiftres <= reg2_i >> reg1_i[4:0];
                end
                `EXE_SRA_OP: begin
                    shiftres <= ({32{reg2_i[31]}} << (6'd32-{1'b0, reg1_i[4:0]}))
                            | reg2_i >> reg1_i[4:0];
                end
                default begin
                    shiftres <= `ZeroWord;
                end
            endcase
        end
    end
    

    always @(*) begin
        moveres <= `ZeroWord;
        if(rst != `RstEnable) begin
            case (aluop_i)
                {2'b00, `FUNC_MOVZ}: begin
                    moveres <= reg1_i;
                end 
                {2'b00, `FUNC_MOVN}: begin
                    moveres <= reg1_i;
                end
                default: begin
                    
                end 
            endcase
        end
    end

    always @(*) begin
        wd_o <= wd_i;
        if((aluop_i == {2'b00, `FUNC_ADD})||(aluop_i == {2'b00, `FUNC_SUB})||
        (aluop_i == {2'b00, `EXE_ADDI})) begin
            wreg_o <= `WriteDisable;
        end else begin
            wreg_o <= wreg_i;
        end 
        case (alusel_i)
            `EXE_RES_LOGIC: begin
                wdata_o <= logicout;
            end
            `EXE_RES_SHIFT: begin
                wdata_o <= shiftres;
            end
            `EXE_RES_MOV: begin
                wdata_o <= moveres;
            end
            `EXE_RES_ARITHMETIC: begin
                wdata_o <= arithmeticres;
            end
            `EXE_RES_MUL: begin
                wdata_o <= mulres[31:0];
            end
            default: begin
                wdata_o <= `ZeroWord;
            end
        endcase
    end
    
endmodule
