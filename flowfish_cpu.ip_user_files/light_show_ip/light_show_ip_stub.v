// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Sun Aug 30 15:44:39 2020
// Host        : YFF-OOOOO running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/port_light_control/port_light_control.srcs/sources_1/ip/light_show_ip/light_show_ip_stub.v
// Design      : light_show_ip
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "light_show,Vivado 2019.2" *)
module light_show_ip(I_clk, I_rst, I_show_num, O_led, O_px)
/* synthesis syn_black_box black_box_pad_pin="I_clk,I_rst,I_show_num[7:0],O_led[6:0],O_px[1:0]" */;
  input I_clk;
  input I_rst;
  input [7:0]I_show_num;
  output [6:0]O_led;
  output [1:0]O_px;
endmodule
