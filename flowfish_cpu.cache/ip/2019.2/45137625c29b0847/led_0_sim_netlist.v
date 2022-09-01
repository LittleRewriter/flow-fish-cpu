// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Thu Sep  1 21:11:00 2022
// Host        : LAPTOP-C4LCPO37 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ led_0_sim_netlist.v
// Design      : led_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_led
   (Q,
    enc_b,
    enc_a,
    rst,
    clk,
    div_num,
    input_data);
  output [1:0]Q;
  output [6:0]enc_b;
  output [6:0]enc_a;
  input rst;
  input clk;
  input [20:0]div_num;
  input [31:0]input_data;

  wire [1:0]Q;
  wire clk;
  wire clk_o;
  wire \div_cnt[0]_i_1_n_0 ;
  wire \div_cnt[1]_i_1_n_0 ;
  wire [20:0]div_num;
  wire [6:0]enc_a;
  wire [6:0]enc_b;
  wire \enc_b[6]_INST_0_i_1_n_0 ;
  wire \enc_b[6]_INST_0_i_2_n_0 ;
  wire \enc_b[6]_INST_0_i_3_n_0 ;
  wire \enc_b[6]_INST_0_i_4_n_0 ;
  wire [31:0]input_data;
  wire rst;
  wire [3:0]sel0;

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
       (.I0(Q[1]),
        .I1(Q[0]),
        .O(\div_cnt[1]_i_1_n_0 ));
  FDCE \div_cnt_reg[0] 
       (.C(clk_o),
        .CE(1'b1),
        .CLR(rst),
        .D(\div_cnt[0]_i_1_n_0 ),
        .Q(Q[0]));
  FDCE \div_cnt_reg[1] 
       (.C(clk_o),
        .CE(1'b1),
        .CLR(rst),
        .D(\div_cnt[1]_i_1_n_0 ),
        .Q(Q[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h0000BE6D)) 
    \enc_a[0]_INST_0 
       (.I0(sel0[2]),
        .I1(sel0[3]),
        .I2(sel0[0]),
        .I3(sel0[1]),
        .I4(rst),
        .O(enc_a[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h01454515)) 
    \enc_a[1]_INST_0 
       (.I0(rst),
        .I1(sel0[0]),
        .I2(sel0[2]),
        .I3(sel0[3]),
        .I4(sel0[1]),
        .O(enc_a[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h15155515)) 
    \enc_a[2]_INST_0 
       (.I0(rst),
        .I1(sel0[2]),
        .I2(sel0[3]),
        .I3(sel0[0]),
        .I4(sel0[1]),
        .O(enc_a[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h14551441)) 
    \enc_a[3]_INST_0 
       (.I0(rst),
        .I1(sel0[0]),
        .I2(sel0[2]),
        .I3(sel0[1]),
        .I4(sel0[3]),
        .O(enc_a[3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h44405545)) 
    \enc_a[4]_INST_0 
       (.I0(rst),
        .I1(sel0[3]),
        .I2(sel0[2]),
        .I3(sel0[1]),
        .I4(sel0[0]),
        .O(enc_a[4]));
  LUT5 #(
    .INIT(32'h51551501)) 
    \enc_a[5]_INST_0 
       (.I0(rst),
        .I1(sel0[0]),
        .I2(sel0[1]),
        .I3(sel0[2]),
        .I4(sel0[3]),
        .O(enc_a[5]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h55144554)) 
    \enc_a[6]_INST_0 
       (.I0(rst),
        .I1(sel0[1]),
        .I2(sel0[2]),
        .I3(sel0[3]),
        .I4(sel0[0]),
        .O(enc_a[6]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \enc_a[6]_INST_0_i_1 
       (.I0(input_data[5]),
        .I1(input_data[1]),
        .I2(input_data[13]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(input_data[9]),
        .O(sel0[1]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \enc_a[6]_INST_0_i_2 
       (.I0(input_data[6]),
        .I1(input_data[2]),
        .I2(input_data[14]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(input_data[10]),
        .O(sel0[2]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \enc_a[6]_INST_0_i_3 
       (.I0(input_data[7]),
        .I1(input_data[3]),
        .I2(input_data[15]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(input_data[11]),
        .O(sel0[3]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \enc_a[6]_INST_0_i_4 
       (.I0(input_data[4]),
        .I1(input_data[0]),
        .I2(input_data[12]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(input_data[8]),
        .O(sel0[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h0000BE6D)) 
    \enc_b[0]_INST_0 
       (.I0(\enc_b[6]_INST_0_i_2_n_0 ),
        .I1(\enc_b[6]_INST_0_i_3_n_0 ),
        .I2(\enc_b[6]_INST_0_i_4_n_0 ),
        .I3(\enc_b[6]_INST_0_i_1_n_0 ),
        .I4(rst),
        .O(enc_b[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h01454515)) 
    \enc_b[1]_INST_0 
       (.I0(rst),
        .I1(\enc_b[6]_INST_0_i_4_n_0 ),
        .I2(\enc_b[6]_INST_0_i_2_n_0 ),
        .I3(\enc_b[6]_INST_0_i_3_n_0 ),
        .I4(\enc_b[6]_INST_0_i_1_n_0 ),
        .O(enc_b[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h15155515)) 
    \enc_b[2]_INST_0 
       (.I0(rst),
        .I1(\enc_b[6]_INST_0_i_2_n_0 ),
        .I2(\enc_b[6]_INST_0_i_3_n_0 ),
        .I3(\enc_b[6]_INST_0_i_4_n_0 ),
        .I4(\enc_b[6]_INST_0_i_1_n_0 ),
        .O(enc_b[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h14551441)) 
    \enc_b[3]_INST_0 
       (.I0(rst),
        .I1(\enc_b[6]_INST_0_i_4_n_0 ),
        .I2(\enc_b[6]_INST_0_i_2_n_0 ),
        .I3(\enc_b[6]_INST_0_i_1_n_0 ),
        .I4(\enc_b[6]_INST_0_i_3_n_0 ),
        .O(enc_b[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h44405545)) 
    \enc_b[4]_INST_0 
       (.I0(rst),
        .I1(\enc_b[6]_INST_0_i_3_n_0 ),
        .I2(\enc_b[6]_INST_0_i_2_n_0 ),
        .I3(\enc_b[6]_INST_0_i_1_n_0 ),
        .I4(\enc_b[6]_INST_0_i_4_n_0 ),
        .O(enc_b[4]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h51551501)) 
    \enc_b[5]_INST_0 
       (.I0(rst),
        .I1(\enc_b[6]_INST_0_i_4_n_0 ),
        .I2(\enc_b[6]_INST_0_i_1_n_0 ),
        .I3(\enc_b[6]_INST_0_i_2_n_0 ),
        .I4(\enc_b[6]_INST_0_i_3_n_0 ),
        .O(enc_b[5]));
  LUT5 #(
    .INIT(32'h55144554)) 
    \enc_b[6]_INST_0 
       (.I0(rst),
        .I1(\enc_b[6]_INST_0_i_1_n_0 ),
        .I2(\enc_b[6]_INST_0_i_2_n_0 ),
        .I3(\enc_b[6]_INST_0_i_3_n_0 ),
        .I4(\enc_b[6]_INST_0_i_4_n_0 ),
        .O(enc_b[6]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \enc_b[6]_INST_0_i_1 
       (.I0(input_data[21]),
        .I1(input_data[17]),
        .I2(input_data[29]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(input_data[25]),
        .O(\enc_b[6]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \enc_b[6]_INST_0_i_2 
       (.I0(input_data[22]),
        .I1(input_data[18]),
        .I2(input_data[30]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(input_data[26]),
        .O(\enc_b[6]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \enc_b[6]_INST_0_i_3 
       (.I0(input_data[23]),
        .I1(input_data[19]),
        .I2(input_data[31]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(input_data[27]),
        .O(\enc_b[6]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \enc_b[6]_INST_0_i_4 
       (.I0(input_data[20]),
        .I1(input_data[16]),
        .I2(input_data[28]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(input_data[24]),
        .O(\enc_b[6]_INST_0_i_4_n_0 ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_time_div time_div_0
       (.CLK(clk_o),
        .clk(clk),
        .div_num(div_num),
        .rst(rst));
endmodule

(* CHECK_LICENSE_TYPE = "led_0,led,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "led,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  input [20:0]div_num;
  output [1:0]sel_a;
  output [6:0]enc_a;
  output [1:0]sel_b;
  output [6:0]enc_b;

  wire clk;
  wire [20:0]div_num;
  wire [6:0]enc_a;
  wire [6:0]enc_b;
  wire [31:0]input_data;
  wire rst;
  wire [1:0]sel_a;

  assign sel_b[1:0] = sel_a;
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_led inst
       (.Q(sel_a),
        .clk(clk),
        .div_num(div_num),
        .enc_a(enc_a),
        .enc_b(enc_b),
        .input_data(input_data),
        .rst(rst));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_time_div
   (CLK,
    clk,
    rst,
    div_num);
  output CLK;
  input clk;
  input rst;
  input [20:0]div_num;

  wire CLK;
  wire clk;
  wire clk_o_i_1_n_0;
  wire cnt0_carry__0_i_1_n_0;
  wire cnt0_carry__0_i_2_n_0;
  wire cnt0_carry__0_i_3_n_0;
  wire cnt0_carry__0_n_1;
  wire cnt0_carry__0_n_2;
  wire cnt0_carry__0_n_3;
  wire cnt0_carry_i_1_n_0;
  wire cnt0_carry_i_2_n_0;
  wire cnt0_carry_i_3_n_0;
  wire cnt0_carry_i_4_n_0;
  wire cnt0_carry_n_0;
  wire cnt0_carry_n_1;
  wire cnt0_carry_n_2;
  wire cnt0_carry_n_3;
  wire \cnt[0]_i_1_n_0 ;
  wire \cnt[0]_i_3_n_0 ;
  wire [20:0]cnt_reg;
  wire \cnt_reg[0]_i_2_n_0 ;
  wire \cnt_reg[0]_i_2_n_1 ;
  wire \cnt_reg[0]_i_2_n_2 ;
  wire \cnt_reg[0]_i_2_n_3 ;
  wire \cnt_reg[0]_i_2_n_4 ;
  wire \cnt_reg[0]_i_2_n_5 ;
  wire \cnt_reg[0]_i_2_n_6 ;
  wire \cnt_reg[0]_i_2_n_7 ;
  wire \cnt_reg[12]_i_1_n_0 ;
  wire \cnt_reg[12]_i_1_n_1 ;
  wire \cnt_reg[12]_i_1_n_2 ;
  wire \cnt_reg[12]_i_1_n_3 ;
  wire \cnt_reg[12]_i_1_n_4 ;
  wire \cnt_reg[12]_i_1_n_5 ;
  wire \cnt_reg[12]_i_1_n_6 ;
  wire \cnt_reg[12]_i_1_n_7 ;
  wire \cnt_reg[16]_i_1_n_0 ;
  wire \cnt_reg[16]_i_1_n_1 ;
  wire \cnt_reg[16]_i_1_n_2 ;
  wire \cnt_reg[16]_i_1_n_3 ;
  wire \cnt_reg[16]_i_1_n_4 ;
  wire \cnt_reg[16]_i_1_n_5 ;
  wire \cnt_reg[16]_i_1_n_6 ;
  wire \cnt_reg[16]_i_1_n_7 ;
  wire \cnt_reg[20]_i_1_n_7 ;
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
  wire [20:0]div_num;
  wire rst;
  wire [3:0]NLW_cnt0_carry_O_UNCONNECTED;
  wire [3:3]NLW_cnt0_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_cnt0_carry__0_O_UNCONNECTED;
  wire [3:0]\NLW_cnt_reg[20]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_cnt_reg[20]_i_1_O_UNCONNECTED ;

  LUT3 #(
    .INIT(8'h06)) 
    clk_o_i_1
       (.I0(CLK),
        .I1(cnt0_carry__0_n_1),
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
        .CO({NLW_cnt0_carry__0_CO_UNCONNECTED[3],cnt0_carry__0_n_1,cnt0_carry__0_n_2,cnt0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_cnt0_carry__0_O_UNCONNECTED[3:0]),
        .S({1'b0,cnt0_carry__0_i_1_n_0,cnt0_carry__0_i_2_n_0,cnt0_carry__0_i_3_n_0}));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    cnt0_carry__0_i_1
       (.I0(cnt_reg[18]),
        .I1(div_num[18]),
        .I2(div_num[20]),
        .I3(cnt_reg[20]),
        .I4(div_num[19]),
        .I5(cnt_reg[19]),
        .O(cnt0_carry__0_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    cnt0_carry__0_i_2
       (.I0(cnt_reg[15]),
        .I1(div_num[15]),
        .I2(div_num[17]),
        .I3(cnt_reg[17]),
        .I4(div_num[16]),
        .I5(cnt_reg[16]),
        .O(cnt0_carry__0_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    cnt0_carry__0_i_3
       (.I0(cnt_reg[12]),
        .I1(div_num[12]),
        .I2(div_num[14]),
        .I3(cnt_reg[14]),
        .I4(div_num[13]),
        .I5(cnt_reg[13]),
        .O(cnt0_carry__0_i_3_n_0));
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
        .I1(cnt0_carry__0_n_1),
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
        .CO({\cnt_reg[12]_i_1_n_0 ,\cnt_reg[12]_i_1_n_1 ,\cnt_reg[12]_i_1_n_2 ,\cnt_reg[12]_i_1_n_3 }),
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
  FDRE \cnt_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\cnt_reg[16]_i_1_n_7 ),
        .Q(cnt_reg[16]),
        .R(\cnt[0]_i_1_n_0 ));
  CARRY4 \cnt_reg[16]_i_1 
       (.CI(\cnt_reg[12]_i_1_n_0 ),
        .CO({\cnt_reg[16]_i_1_n_0 ,\cnt_reg[16]_i_1_n_1 ,\cnt_reg[16]_i_1_n_2 ,\cnt_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\cnt_reg[16]_i_1_n_4 ,\cnt_reg[16]_i_1_n_5 ,\cnt_reg[16]_i_1_n_6 ,\cnt_reg[16]_i_1_n_7 }),
        .S(cnt_reg[19:16]));
  FDRE \cnt_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\cnt_reg[16]_i_1_n_6 ),
        .Q(cnt_reg[17]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE \cnt_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(\cnt_reg[16]_i_1_n_5 ),
        .Q(cnt_reg[18]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE \cnt_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(\cnt_reg[16]_i_1_n_4 ),
        .Q(cnt_reg[19]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE \cnt_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\cnt_reg[0]_i_2_n_6 ),
        .Q(cnt_reg[1]),
        .R(\cnt[0]_i_1_n_0 ));
  FDRE \cnt_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(\cnt_reg[20]_i_1_n_7 ),
        .Q(cnt_reg[20]),
        .R(\cnt[0]_i_1_n_0 ));
  CARRY4 \cnt_reg[20]_i_1 
       (.CI(\cnt_reg[16]_i_1_n_0 ),
        .CO(\NLW_cnt_reg[20]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_cnt_reg[20]_i_1_O_UNCONNECTED [3:1],\cnt_reg[20]_i_1_n_7 }),
        .S({1'b0,1'b0,1'b0,cnt_reg[20]}));
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
