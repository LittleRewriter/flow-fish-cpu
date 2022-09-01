// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Thu Sep  1 21:11:00 2022
// Host        : LAPTOP-C4LCPO37 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ led_0_stub.v
// Design      : led_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "led,Vivado 2019.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, rst, input_data, div_num, sel_a, enc_a, sel_b, 
  enc_b)
/* synthesis syn_black_box black_box_pad_pin="clk,rst,input_data[31:0],div_num[20:0],sel_a[1:0],enc_a[6:0],sel_b[1:0],enc_b[6:0]" */;
  input clk;
  input rst;
  input [31:0]input_data;
  input [20:0]div_num;
  output [1:0]sel_a;
  output [6:0]enc_a;
  output [1:0]sel_b;
  output [6:0]enc_b;
endmodule
