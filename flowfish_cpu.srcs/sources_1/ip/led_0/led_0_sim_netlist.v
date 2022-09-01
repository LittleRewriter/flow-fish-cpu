// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Thu Sep  1 16:26:02 2022
// Host        : LAPTOP-C4LCPO37 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/LR/FPGA/flow-fish-cpu/flowfish_cpu.srcs/sources_1/ip/led_0/led_0_sim_netlist.v
// Design      : led_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "led_0,led,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "led,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module led_0
   (clk,
    rst,
    input_data,
    div_num,
    sel_a,
    enc_a,
    sel_b,
    enc_b);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst;
  input [31:0]input_data;
  input [15:0]div_num;
  output [1:0]sel_a;
  output [6:0]enc_a;
  output [1:0]sel_b;
  output [6:0]enc_b;

  wire clk;
  wire [15:0]div_num;
  wire [6:0]enc_a;
  wire [6:0]enc_b;
  wire [31:0]input_data;
  wire rst;
  wire [1:0]sel_a;

  assign sel_b[1:0] = sel_a;
  led_0_led inst
       (.Q(sel_a),
        .clk(clk),
        .div_num(div_num),
        .enc_a(enc_a),
        .enc_b(enc_b),
        .input_data(input_data),
        .rst(rst));
endmodule

(* ORIG_REF_NAME = "led" *) 
module led_0_led
   (Q,
    enc_a,
    enc_b,
    div_num,
    rst,
    clk,
    input_data);
  output [1:0]Q;
  output [6:0]enc_a;
  output [6:0]enc_b;
  input [15:0]div_num;
  input rst;
  input clk;
  input [31:0]input_data;

  wire [1:0]Q;
  wire clk;
  wire \div_cnt[0]_i_1_n_0 ;
  wire \div_cnt[1]_i_1_n_0 ;
  wire [15:0]div_num;
  wire [6:0]enc_a;
  wire [6:0]enc_b;
  wire [31:0]input_data;
  wire rst;
  wire time_div_0_n_0;

  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \div_cnt[0]_i_1 
       (.I0(Q[0]),
        .O(\div_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \div_cnt[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\div_cnt[1]_i_1_n_0 ));
  FDCE \div_cnt_reg[0] 
       (.C(time_div_0_n_0),
        .CE(1'b1),
        .CLR(rst),
        .D(\div_cnt[0]_i_1_n_0 ),
        .Q(Q[0]));
  FDCE \div_cnt_reg[1] 
       (.C(time_div_0_n_0),
        .CE(1'b1),
        .CLR(rst),
        .D(\div_cnt[1]_i_1_n_0 ),
        .Q(Q[1]));
  led_0_single_led single_led_0
       (.CLK(time_div_0_n_0),
        .Q(Q),
        .enc_a(enc_a),
        .input_data(input_data[15:0]));
  led_0_single_led_0 single_led_1
       (.CLK(time_div_0_n_0),
        .Q(Q),
        .enc_b(enc_b),
        .input_data(input_data[31:16]));
  led_0_time_div time_div_0
       (.CLK(time_div_0_n_0),
        .clk(clk),
        .div_num(div_num),
        .rst(rst));
endmodule

(* ORIG_REF_NAME = "single_led" *) 
module led_0_single_led
   (enc_a,
    input_data,
    Q,
    CLK);
  output [6:0]enc_a;
  input [15:0]input_data;
  input [1:0]Q;
  input CLK;

  wire CLK;
  wire [1:0]Q;
  wire [6:0]enc_a;
  wire [6:0]hex_enc;
  wire [15:0]input_data;
  wire [3:0]sel0;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hDE6B)) 
    \hex_enc[0]_i_1__0 
       (.I0(sel0[3]),
        .I1(sel0[1]),
        .I2(sel0[0]),
        .I3(sel0[2]),
        .O(hex_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h53B7)) 
    \hex_enc[1]_i_1__0 
       (.I0(sel0[3]),
        .I1(sel0[2]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .O(hex_enc[1]));
  LUT4 #(
    .INIT(16'h77F7)) 
    \hex_enc[2]_i_1__0 
       (.I0(sel0[2]),
        .I1(sel0[3]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .O(hex_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h3EE3)) 
    \hex_enc[3]_i_1__0 
       (.I0(sel0[3]),
        .I1(sel0[1]),
        .I2(sel0[0]),
        .I3(sel0[2]),
        .O(hex_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hF4D5)) 
    \hex_enc[4]_i_1__0 
       (.I0(sel0[0]),
        .I1(sel0[1]),
        .I2(sel0[3]),
        .I3(sel0[2]),
        .O(hex_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hC6EF)) 
    \hex_enc[5]_i_1__0 
       (.I0(sel0[2]),
        .I1(sel0[3]),
        .I2(sel0[1]),
        .I3(sel0[0]),
        .O(hex_enc[5]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hFB6E)) 
    \hex_enc[6]_i_1__0 
       (.I0(sel0[1]),
        .I1(sel0[2]),
        .I2(sel0[0]),
        .I3(sel0[3]),
        .O(hex_enc[6]));
  LUT6 #(
    .INIT(64'hFCAFFCA00CAF0CA0)) 
    \hex_enc[6]_i_2__0 
       (.I0(input_data[9]),
        .I1(input_data[5]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(input_data[1]),
        .I5(input_data[13]),
        .O(sel0[1]));
  LUT6 #(
    .INIT(64'hFCAFFCA00CAF0CA0)) 
    \hex_enc[6]_i_3__0 
       (.I0(input_data[10]),
        .I1(input_data[6]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(input_data[2]),
        .I5(input_data[14]),
        .O(sel0[2]));
  LUT6 #(
    .INIT(64'hFCAFFCA00CAF0CA0)) 
    \hex_enc[6]_i_4__0 
       (.I0(input_data[8]),
        .I1(input_data[4]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(input_data[0]),
        .I5(input_data[12]),
        .O(sel0[0]));
  LUT6 #(
    .INIT(64'hFCAFFCA00CAF0CA0)) 
    \hex_enc[6]_i_5__0 
       (.I0(input_data[11]),
        .I1(input_data[7]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(input_data[3]),
        .I5(input_data[15]),
        .O(sel0[3]));
  FDRE \hex_enc_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(hex_enc[0]),
        .Q(enc_a[0]),
        .R(1'b0));
  FDRE \hex_enc_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(hex_enc[1]),
        .Q(enc_a[1]),
        .R(1'b0));
  FDRE \hex_enc_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(hex_enc[2]),
        .Q(enc_a[2]),
        .R(1'b0));
  FDRE \hex_enc_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(hex_enc[3]),
        .Q(enc_a[3]),
        .R(1'b0));
  FDRE \hex_enc_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .D(hex_enc[4]),
        .Q(enc_a[4]),
        .R(1'b0));
  FDRE \hex_enc_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .D(hex_enc[5]),
        .Q(enc_a[5]),
        .R(1'b0));
  FDRE \hex_enc_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .D(hex_enc[6]),
        .Q(enc_a[6]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "single_led" *) 
module led_0_single_led_0
   (enc_b,
    input_data,
    Q,
    CLK);
  output [6:0]enc_b;
  input [15:0]input_data;
  input [1:0]Q;
  input CLK;

  wire CLK;
  wire [1:0]Q;
  wire [6:0]enc_b;
  wire [6:0]hex_enc;
  wire \hex_enc[6]_i_2_n_0 ;
  wire \hex_enc[6]_i_3_n_0 ;
  wire \hex_enc[6]_i_4_n_0 ;
  wire \hex_enc[6]_i_5_n_0 ;
  wire [15:0]input_data;

  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hDE6B)) 
    \hex_enc[0]_i_1 
       (.I0(\hex_enc[6]_i_5_n_0 ),
        .I1(\hex_enc[6]_i_2_n_0 ),
        .I2(\hex_enc[6]_i_4_n_0 ),
        .I3(\hex_enc[6]_i_3_n_0 ),
        .O(hex_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h53B7)) 
    \hex_enc[1]_i_1 
       (.I0(\hex_enc[6]_i_5_n_0 ),
        .I1(\hex_enc[6]_i_3_n_0 ),
        .I2(\hex_enc[6]_i_4_n_0 ),
        .I3(\hex_enc[6]_i_2_n_0 ),
        .O(hex_enc[1]));
  LUT4 #(
    .INIT(16'h77F7)) 
    \hex_enc[2]_i_1 
       (.I0(\hex_enc[6]_i_3_n_0 ),
        .I1(\hex_enc[6]_i_5_n_0 ),
        .I2(\hex_enc[6]_i_4_n_0 ),
        .I3(\hex_enc[6]_i_2_n_0 ),
        .O(hex_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h3EE3)) 
    \hex_enc[3]_i_1 
       (.I0(\hex_enc[6]_i_5_n_0 ),
        .I1(\hex_enc[6]_i_2_n_0 ),
        .I2(\hex_enc[6]_i_4_n_0 ),
        .I3(\hex_enc[6]_i_3_n_0 ),
        .O(hex_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hF4D5)) 
    \hex_enc[4]_i_1 
       (.I0(\hex_enc[6]_i_4_n_0 ),
        .I1(\hex_enc[6]_i_2_n_0 ),
        .I2(\hex_enc[6]_i_5_n_0 ),
        .I3(\hex_enc[6]_i_3_n_0 ),
        .O(hex_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hC6EF)) 
    \hex_enc[5]_i_1 
       (.I0(\hex_enc[6]_i_3_n_0 ),
        .I1(\hex_enc[6]_i_5_n_0 ),
        .I2(\hex_enc[6]_i_2_n_0 ),
        .I3(\hex_enc[6]_i_4_n_0 ),
        .O(hex_enc[5]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hFB6E)) 
    \hex_enc[6]_i_1 
       (.I0(\hex_enc[6]_i_2_n_0 ),
        .I1(\hex_enc[6]_i_3_n_0 ),
        .I2(\hex_enc[6]_i_4_n_0 ),
        .I3(\hex_enc[6]_i_5_n_0 ),
        .O(hex_enc[6]));
  LUT6 #(
    .INIT(64'hFCAFFCA00CAF0CA0)) 
    \hex_enc[6]_i_2 
       (.I0(input_data[9]),
        .I1(input_data[5]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(input_data[1]),
        .I5(input_data[13]),
        .O(\hex_enc[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFCAFFCA00CAF0CA0)) 
    \hex_enc[6]_i_3 
       (.I0(input_data[10]),
        .I1(input_data[6]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(input_data[2]),
        .I5(input_data[14]),
        .O(\hex_enc[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFCAFFCA00CAF0CA0)) 
    \hex_enc[6]_i_4 
       (.I0(input_data[8]),
        .I1(input_data[4]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(input_data[0]),
        .I5(input_data[12]),
        .O(\hex_enc[6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFCAFFCA00CAF0CA0)) 
    \hex_enc[6]_i_5 
       (.I0(input_data[11]),
        .I1(input_data[7]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(input_data[3]),
        .I5(input_data[15]),
        .O(\hex_enc[6]_i_5_n_0 ));
  FDRE \hex_enc_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(hex_enc[0]),
        .Q(enc_b[0]),
        .R(1'b0));
  FDRE \hex_enc_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(hex_enc[1]),
        .Q(enc_b[1]),
        .R(1'b0));
  FDRE \hex_enc_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(hex_enc[2]),
        .Q(enc_b[2]),
        .R(1'b0));
  FDRE \hex_enc_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(hex_enc[3]),
        .Q(enc_b[3]),
        .R(1'b0));
  FDRE \hex_enc_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .D(hex_enc[4]),
        .Q(enc_b[4]),
        .R(1'b0));
  FDRE \hex_enc_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .D(hex_enc[5]),
        .Q(enc_b[5]),
        .R(1'b0));
  FDRE \hex_enc_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .D(hex_enc[6]),
        .Q(enc_b[6]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "time_div" *) 
module led_0_time_div
   (CLK,
    clk,
    div_num,
    rst);
  output CLK;
  input clk;
  input [15:0]div_num;
  input rst;

  wire CLK;
  wire clk;
  wire clk_o_i_1_n_0;
  wire cnt0_carry__0_n_2;
  wire cnt0_carry__0_n_3;
  wire cnt0_carry_i_1__0_n_0;
  wire cnt0_carry_i_1_n_0;
  wire cnt0_carry_i_2__0_n_0;
  wire cnt0_carry_i_2_n_0;
  wire cnt0_carry_i_3_n_0;
  wire cnt0_carry_i_4_n_0;
  wire cnt0_carry_n_0;
  wire cnt0_carry_n_1;
  wire cnt0_carry_n_2;
  wire cnt0_carry_n_3;
  wire \cnt[0]_i_1_n_0 ;
  wire \cnt[0]_i_3_n_0 ;
  wire [15:0]cnt_reg;
  wire \cnt_reg[0]_i_2_n_0 ;
  wire \cnt_reg[0]_i_2_n_1 ;
  wire \cnt_reg[0]_i_2_n_2 ;
  wire \cnt_reg[0]_i_2_n_3 ;
  wire \cnt_reg[0]_i_2_n_4 ;
  wire \cnt_reg[0]_i_2_n_5 ;
  wire \cnt_reg[0]_i_2_n_6 ;
  wire \cnt_reg[0]_i_2_n_7 ;
  wire \cnt_reg[12]_i_1_n_1 ;
  wire \cnt_reg[12]_i_1_n_2 ;
  wire \cnt_reg[12]_i_1_n_3 ;
  wire \cnt_reg[12]_i_1_n_4 ;
  wire \cnt_reg[12]_i_1_n_5 ;
  wire \cnt_reg[12]_i_1_n_6 ;
  wire \cnt_reg[12]_i_1_n_7 ;
  wire \cnt_reg[4]_i_1_n_0 ;
  wire \cnt_reg[4]_i_1_n_1 ;
  wire \cnt_reg[4]_i_1_n_2 ;
  wire \cnt_reg[4]_i_1_n_3 ;
  wire \cnt_reg[4]_i_1_n_4 ;
  wire \cnt_reg[4]_i_1_n_5 ;
  wire \cnt_reg[4]_i_1_n_6 ;
  wire \cnt_reg[4]_i_1_n_7 ;
  wire \cnt_reg[8]_i_1_n_0 ;
  wire \cnt_reg[8]_i_1_n_1 ;
  wire \cnt_reg[8]_i_1_n_2 ;
  wire \cnt_reg[8]_i_1_n_3 ;
  wire \cnt_reg[8]_i_1_n_4 ;
  wire \cnt_reg[8]_i_1_n_5 ;
  wire \cnt_reg[8]_i_1_n_6 ;
  wire \cnt_reg[8]_i_1_n_7 ;
  wire [15:0]div_num;
  wire rst;
  wire [3:0]NLW_cnt0_carry_O_UNCONNECTED;
  wire [3:2]NLW_cnt0_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_cnt0_carry__0_O_UNCONNECTED;
  wire [3:3]\NLW_cnt_reg[12]_i_1_CO_UNCONNECTED ;

  LUT3 #(
    .INIT(8'h06)) 
    clk_o_i_1
       (.I0(CLK),
        .I1(cnt0_carry__0_n_2),
        .I2(rst),
        .O(clk_o_i_1_n_0));
  FDRE clk_o_reg
       (.C(clk),
        .CE(1'b1),
        .D(clk_o_i_1_n_0),
        .Q(CLK),
        .R(1'b0));
  CARRY4 cnt0_carry
       (.CI(1'b0),
        .CO({cnt0_carry_n_0,cnt0_carry_n_1,cnt0_carry_n_2,cnt0_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_cnt0_carry_O_UNCONNECTED[3:0]),
        .S({cnt0_carry_i_1_n_0,cnt0_carry_i_2_n_0,cnt0_carry_i_3_n_0,cnt0_carry_i_4_n_0}));
  CARRY4 cnt0_carry__0
       (.CI(cnt0_carry_n_0),
        .CO({NLW_cnt0_carry__0_CO_UNCONNECTED[3:2],cnt0_carry__0_n_2,cnt0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_cnt0_carry__0_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,cnt0_carry_i_1__0_n_0,cnt0_carry_i_2__0_n_0}));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    cnt0_carry_i_1
       (.I0(cnt_reg[9]),
        .I1(div_num[9]),
        .I2(div_num[11]),
        .I3(cnt_reg[11]),
        .I4(div_num[10]),
        .I5(cnt_reg[10]),
        .O(cnt0_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    cnt0_carry_i_1__0
       (.I0(div_num[15]),
        .I1(cnt_reg[15]),
        .O(cnt0_carry_i_1__0_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    cnt0_carry_i_2
       (.I0(cnt_reg[6]),
        .I1(div_num[6]),
        .I2(div_num[8]),
        .I3(cnt_reg[8]),
        .I4(div_num[7]),
        .I5(cnt_reg[7]),
        .O(cnt0_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    cnt0_carry_i_2__0
       (.I0(cnt_reg[12]),
        .I1(div_num[12]),
        .I2(div_num[14]),
        .I3(cnt_reg[14]),
        .I4(div_num[13]),
        .I5(cnt_reg[13]),
        .O(cnt0_carry_i_2__0_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    cnt0_carry_i_3
       (.I0(cnt_reg[3]),
        .I1(div_num[3]),
        .I2(div_num[5]),
        .I3(cnt_reg[5]),
        .I4(div_num[4]),
        .I5(cnt_reg[4]),
        .O(cnt0_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    cnt0_carry_i_4
       (.I0(cnt_reg[0]),
        .I1(div_num[0]),
        .I2(div_num[2]),
        .I3(cnt_reg[2]),
        .I4(div_num[1]),
        .I5(cnt_reg[1]),
        .O(cnt0_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    \cnt[0]_i_1 
       (.I0(rst),
        .I1(cnt0_carry__0_n_2),
        .O(\cnt[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[0]_i_3 
       (.I0(cnt_reg[0]),
        .O(\cnt[0]_i_3_n_0 ));
  FDRE \cnt_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\cnt_reg[0]_i_2_n_7 ),
        .Q(cnt_reg[0]),
        .R(\cnt[0]_i_1_n_0 ));
  CARRY4 \cnt_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\cnt_reg[0]_i_2_n_0 ,\cnt_reg[0]_i_2_n_1 ,\cnt_reg[0]_i_2_n_2 ,\cnt_reg[0]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\cnt_reg[0]_i_2_n_4 ,\cnt_reg[0]_i_2_n_5 ,\cnt_reg[0]_i_2_n_6 ,\cnt_reg[0]_i_2_n_7 }),
        .S({cnt_reg[3:1],\cnt[0]_i_3_n_0 }));
  FDRE \cnt_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\cnt_reg[8]_i_1_n_5 ),
        .Q(cnt_reg[10]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE \cnt_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\cnt_reg[8]_i_1_n_4 ),
        .Q(cnt_reg[11]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE \cnt_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\cnt_reg[12]_i_1_n_7 ),
        .Q(cnt_reg[12]),
        .R(\cnt[0]_i_1_n_0 ));
  CARRY4 \cnt_reg[12]_i_1 
       (.CI(\cnt_reg[8]_i_1_n_0 ),
        .CO({\NLW_cnt_reg[12]_i_1_CO_UNCONNECTED [3],\cnt_reg[12]_i_1_n_1 ,\cnt_reg[12]_i_1_n_2 ,\cnt_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[12]_i_1_n_4 ,\cnt_reg[12]_i_1_n_5 ,\cnt_reg[12]_i_1_n_6 ,\cnt_reg[12]_i_1_n_7 }),
        .S(cnt_reg[15:12]));
  FDRE \cnt_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\cnt_reg[12]_i_1_n_6 ),
        .Q(cnt_reg[13]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE \cnt_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\cnt_reg[12]_i_1_n_5 ),
        .Q(cnt_reg[14]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE \cnt_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\cnt_reg[12]_i_1_n_4 ),
        .Q(cnt_reg[15]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE \cnt_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\cnt_reg[0]_i_2_n_6 ),
        .Q(cnt_reg[1]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE \cnt_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\cnt_reg[0]_i_2_n_5 ),
        .Q(cnt_reg[2]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE \cnt_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\cnt_reg[0]_i_2_n_4 ),
        .Q(cnt_reg[3]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE \cnt_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\cnt_reg[4]_i_1_n_7 ),
        .Q(cnt_reg[4]),
        .R(\cnt[0]_i_1_n_0 ));
  CARRY4 \cnt_reg[4]_i_1 
       (.CI(\cnt_reg[0]_i_2_n_0 ),
        .CO({\cnt_reg[4]_i_1_n_0 ,\cnt_reg[4]_i_1_n_1 ,\cnt_reg[4]_i_1_n_2 ,\cnt_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[4]_i_1_n_4 ,\cnt_reg[4]_i_1_n_5 ,\cnt_reg[4]_i_1_n_6 ,\cnt_reg[4]_i_1_n_7 }),
        .S(cnt_reg[7:4]));
  FDRE \cnt_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\cnt_reg[4]_i_1_n_6 ),
        .Q(cnt_reg[5]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE \cnt_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\cnt_reg[4]_i_1_n_5 ),
        .Q(cnt_reg[6]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE \cnt_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\cnt_reg[4]_i_1_n_4 ),
        .Q(cnt_reg[7]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE \cnt_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\cnt_reg[8]_i_1_n_7 ),
        .Q(cnt_reg[8]),
        .R(\cnt[0]_i_1_n_0 ));
  CARRY4 \cnt_reg[8]_i_1 
       (.CI(\cnt_reg[4]_i_1_n_0 ),
        .CO({\cnt_reg[8]_i_1_n_0 ,\cnt_reg[8]_i_1_n_1 ,\cnt_reg[8]_i_1_n_2 ,\cnt_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[8]_i_1_n_4 ,\cnt_reg[8]_i_1_n_5 ,\cnt_reg[8]_i_1_n_6 ,\cnt_reg[8]_i_1_n_7 }),
        .S(cnt_reg[11:8]));
  FDRE \cnt_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\cnt_reg[8]_i_1_n_6 ),
        .Q(cnt_reg[9]),
        .R(\cnt[0]_i_1_n_0 ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
