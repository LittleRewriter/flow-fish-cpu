// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Sun Aug 30 15:44:39 2020
// Host        : YFF-OOOOO running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/port_light_control/port_light_control.srcs/sources_1/ip/light_show_ip/light_show_ip_sim_netlist.v
// Design      : light_show_ip
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "light_show_ip,light_show,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "light_show,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module light_show_ip
   (I_clk,
    I_rst,
    I_show_num,
    O_led,
    O_px);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 I_clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME I_clk, ASSOCIATED_RESET I_rst, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input I_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 I_rst RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME I_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input I_rst;
  input [7:0]I_show_num;
  output [6:0]O_led;
  output [1:0]O_px;

  wire I_clk;
  wire I_rst;
  wire [7:0]I_show_num;
  wire [6:0]O_led;
  wire [1:0]O_px;

  light_show_ip_light_show inst
       (.I_clk(I_clk),
        .I_rst(I_rst),
        .I_show_num(I_show_num),
        .O_led(O_led),
        .\R_px_temp_reg[0]_0 (O_px[0]),
        .\R_px_temp_reg[1]_0 (O_px[1]));
endmodule

(* ORIG_REF_NAME = "light_show" *) 
module light_show_ip_light_show
   (\R_px_temp_reg[0]_0 ,
    \R_px_temp_reg[1]_0 ,
    O_led,
    I_clk,
    I_rst,
    I_show_num);
  output \R_px_temp_reg[0]_0 ;
  output \R_px_temp_reg[1]_0 ;
  output [6:0]O_led;
  input I_clk;
  input I_rst;
  input [7:0]I_show_num;

  wire I_clk;
  wire I_rst;
  wire [7:0]I_show_num;
  wire [6:0]O_led;
  wire [32:0]R_counter;
  wire [32:1]R_counter0;
  wire R_counter0_carry__0_n_0;
  wire R_counter0_carry__0_n_1;
  wire R_counter0_carry__0_n_2;
  wire R_counter0_carry__0_n_3;
  wire R_counter0_carry__1_n_0;
  wire R_counter0_carry__1_n_1;
  wire R_counter0_carry__1_n_2;
  wire R_counter0_carry__1_n_3;
  wire R_counter0_carry__2_n_0;
  wire R_counter0_carry__2_n_1;
  wire R_counter0_carry__2_n_2;
  wire R_counter0_carry__2_n_3;
  wire R_counter0_carry__3_n_0;
  wire R_counter0_carry__3_n_1;
  wire R_counter0_carry__3_n_2;
  wire R_counter0_carry__3_n_3;
  wire R_counter0_carry__4_n_0;
  wire R_counter0_carry__4_n_1;
  wire R_counter0_carry__4_n_2;
  wire R_counter0_carry__4_n_3;
  wire R_counter0_carry__5_n_0;
  wire R_counter0_carry__5_n_1;
  wire R_counter0_carry__5_n_2;
  wire R_counter0_carry__5_n_3;
  wire R_counter0_carry__6_n_1;
  wire R_counter0_carry__6_n_2;
  wire R_counter0_carry__6_n_3;
  wire R_counter0_carry_n_0;
  wire R_counter0_carry_n_1;
  wire R_counter0_carry_n_2;
  wire R_counter0_carry_n_3;
  wire \R_counter[32]_i_2_n_0 ;
  wire \R_counter[32]_i_3_n_0 ;
  wire \R_px_temp[0]_i_1_n_0 ;
  wire \R_px_temp[1]_i_1_n_0 ;
  wire \R_px_temp[1]_i_2_n_0 ;
  wire \R_px_temp[1]_i_3_n_0 ;
  wire \R_px_temp[1]_i_4_n_0 ;
  wire \R_px_temp[1]_i_5_n_0 ;
  wire \R_px_temp[1]_i_6_n_0 ;
  wire \R_px_temp[1]_i_7_n_0 ;
  wire \R_px_temp[1]_i_8_n_0 ;
  wire \R_px_temp_reg[0]_0 ;
  wire \R_px_temp_reg[1]_0 ;
  wire \R_temp[0]_i_1_n_0 ;
  wire \R_temp[1]_i_1_n_0 ;
  wire \R_temp[2]_i_1_n_0 ;
  wire \R_temp[3]_i_1_n_0 ;
  wire \R_temp[3]_i_2_n_0 ;
  wire \R_temp_reg_n_0_[0] ;
  wire \R_temp_reg_n_0_[1] ;
  wire \R_temp_reg_n_0_[2] ;
  wire \R_temp_reg_n_0_[3] ;
  wire [32:0]p_0_in;
  wire [3:3]NLW_R_counter0_carry__6_CO_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hBEF6)) 
    \O_led[0]_INST_0 
       (.I0(\R_temp_reg_n_0_[3] ),
        .I1(\R_temp_reg_n_0_[2] ),
        .I2(\R_temp_reg_n_0_[1] ),
        .I3(\R_temp_reg_n_0_[0] ),
        .O(O_led[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hDF71)) 
    \O_led[1]_INST_0 
       (.I0(\R_temp_reg_n_0_[0] ),
        .I1(\R_temp_reg_n_0_[1] ),
        .I2(\R_temp_reg_n_0_[2] ),
        .I3(\R_temp_reg_n_0_[3] ),
        .O(O_led[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hA8FB)) 
    \O_led[2]_INST_0 
       (.I0(\R_temp_reg_n_0_[3] ),
        .I1(\R_temp_reg_n_0_[2] ),
        .I2(\R_temp_reg_n_0_[1] ),
        .I3(\R_temp_reg_n_0_[0] ),
        .O(O_led[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h5BED)) 
    \O_led[3]_INST_0 
       (.I0(\R_temp_reg_n_0_[0] ),
        .I1(\R_temp_reg_n_0_[3] ),
        .I2(\R_temp_reg_n_0_[2] ),
        .I3(\R_temp_reg_n_0_[1] ),
        .O(O_led[3]));
  LUT4 #(
    .INIT(16'h7F67)) 
    \O_led[4]_INST_0 
       (.I0(\R_temp_reg_n_0_[3] ),
        .I1(\R_temp_reg_n_0_[2] ),
        .I2(\R_temp_reg_n_0_[1] ),
        .I3(\R_temp_reg_n_0_[0] ),
        .O(O_led[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h297F)) 
    \O_led[5]_INST_0 
       (.I0(\R_temp_reg_n_0_[0] ),
        .I1(\R_temp_reg_n_0_[1] ),
        .I2(\R_temp_reg_n_0_[3] ),
        .I3(\R_temp_reg_n_0_[2] ),
        .O(O_led[5]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hF76D)) 
    \O_led[6]_INST_0 
       (.I0(\R_temp_reg_n_0_[0] ),
        .I1(\R_temp_reg_n_0_[3] ),
        .I2(\R_temp_reg_n_0_[2] ),
        .I3(\R_temp_reg_n_0_[1] ),
        .O(O_led[6]));
  CARRY4 R_counter0_carry
       (.CI(1'b0),
        .CO({R_counter0_carry_n_0,R_counter0_carry_n_1,R_counter0_carry_n_2,R_counter0_carry_n_3}),
        .CYINIT(R_counter[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(R_counter0[4:1]),
        .S(R_counter[4:1]));
  CARRY4 R_counter0_carry__0
       (.CI(R_counter0_carry_n_0),
        .CO({R_counter0_carry__0_n_0,R_counter0_carry__0_n_1,R_counter0_carry__0_n_2,R_counter0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(R_counter0[8:5]),
        .S(R_counter[8:5]));
  CARRY4 R_counter0_carry__1
       (.CI(R_counter0_carry__0_n_0),
        .CO({R_counter0_carry__1_n_0,R_counter0_carry__1_n_1,R_counter0_carry__1_n_2,R_counter0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(R_counter0[12:9]),
        .S(R_counter[12:9]));
  CARRY4 R_counter0_carry__2
       (.CI(R_counter0_carry__1_n_0),
        .CO({R_counter0_carry__2_n_0,R_counter0_carry__2_n_1,R_counter0_carry__2_n_2,R_counter0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(R_counter0[16:13]),
        .S(R_counter[16:13]));
  CARRY4 R_counter0_carry__3
       (.CI(R_counter0_carry__2_n_0),
        .CO({R_counter0_carry__3_n_0,R_counter0_carry__3_n_1,R_counter0_carry__3_n_2,R_counter0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(R_counter0[20:17]),
        .S(R_counter[20:17]));
  CARRY4 R_counter0_carry__4
       (.CI(R_counter0_carry__3_n_0),
        .CO({R_counter0_carry__4_n_0,R_counter0_carry__4_n_1,R_counter0_carry__4_n_2,R_counter0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(R_counter0[24:21]),
        .S(R_counter[24:21]));
  CARRY4 R_counter0_carry__5
       (.CI(R_counter0_carry__4_n_0),
        .CO({R_counter0_carry__5_n_0,R_counter0_carry__5_n_1,R_counter0_carry__5_n_2,R_counter0_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(R_counter0[28:25]),
        .S(R_counter[28:25]));
  CARRY4 R_counter0_carry__6
       (.CI(R_counter0_carry__5_n_0),
        .CO({NLW_R_counter0_carry__6_CO_UNCONNECTED[3],R_counter0_carry__6_n_1,R_counter0_carry__6_n_2,R_counter0_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(R_counter0[32:29]),
        .S(R_counter[32:29]));
  LUT5 #(
    .INIT(32'h0000999F)) 
    \R_counter[0]_i_1 
       (.I0(\R_px_temp_reg[1]_0 ),
        .I1(\R_px_temp_reg[0]_0 ),
        .I2(\R_counter[32]_i_2_n_0 ),
        .I3(\R_px_temp[1]_i_3_n_0 ),
        .I4(R_counter[0]),
        .O(p_0_in[0]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[10]_i_1 
       (.I0(R_counter0[10]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[10]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[11]_i_1 
       (.I0(R_counter0[11]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[11]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[12]_i_1 
       (.I0(R_counter0[12]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[12]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[13]_i_1 
       (.I0(R_counter0[13]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[13]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[14]_i_1 
       (.I0(R_counter0[14]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[14]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[15]_i_1 
       (.I0(R_counter0[15]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[15]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[16]_i_1 
       (.I0(R_counter0[16]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[16]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[17]_i_1 
       (.I0(R_counter0[17]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[17]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[18]_i_1 
       (.I0(R_counter0[18]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[18]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[19]_i_1 
       (.I0(R_counter0[19]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[19]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[1]_i_1 
       (.I0(R_counter0[1]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[1]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[20]_i_1 
       (.I0(R_counter0[20]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[20]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[21]_i_1 
       (.I0(R_counter0[21]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[21]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[22]_i_1 
       (.I0(R_counter0[22]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[22]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[23]_i_1 
       (.I0(R_counter0[23]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[23]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[24]_i_1 
       (.I0(R_counter0[24]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[24]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[25]_i_1 
       (.I0(R_counter0[25]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[25]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[26]_i_1 
       (.I0(R_counter0[26]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[26]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[27]_i_1 
       (.I0(R_counter0[27]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[27]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[28]_i_1 
       (.I0(R_counter0[28]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[28]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[29]_i_1 
       (.I0(R_counter0[29]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[29]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[2]_i_1 
       (.I0(R_counter0[2]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[2]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[30]_i_1 
       (.I0(R_counter0[30]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[30]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[31]_i_1 
       (.I0(R_counter0[31]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[31]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[32]_i_1 
       (.I0(R_counter0[32]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[32]));
  LUT6 #(
    .INIT(64'hFFFFFEAAAAAAAAAA)) 
    \R_counter[32]_i_2 
       (.I0(\R_counter[32]_i_3_n_0 ),
        .I1(\R_px_temp[1]_i_8_n_0 ),
        .I2(\R_px_temp[1]_i_7_n_0 ),
        .I3(R_counter[14]),
        .I4(R_counter[15]),
        .I5(\R_px_temp[1]_i_6_n_0 ),
        .O(\R_counter[32]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \R_counter[32]_i_3 
       (.I0(R_counter[30]),
        .I1(R_counter[31]),
        .O(\R_counter[32]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[3]_i_1 
       (.I0(R_counter0[3]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[3]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[4]_i_1 
       (.I0(R_counter0[4]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[4]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[5]_i_1 
       (.I0(R_counter0[5]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[5]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[6]_i_1 
       (.I0(R_counter0[6]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[6]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[7]_i_1 
       (.I0(R_counter0[7]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[7]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[8]_i_1 
       (.I0(R_counter0[8]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[8]));
  LUT5 #(
    .INIT(32'h828282AA)) 
    \R_counter[9]_i_1 
       (.I0(R_counter0[9]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .O(p_0_in[9]));
  FDCE \R_counter_reg[0] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[0]),
        .Q(R_counter[0]));
  FDCE \R_counter_reg[10] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[10]),
        .Q(R_counter[10]));
  FDCE \R_counter_reg[11] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[11]),
        .Q(R_counter[11]));
  FDCE \R_counter_reg[12] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[12]),
        .Q(R_counter[12]));
  FDCE \R_counter_reg[13] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[13]),
        .Q(R_counter[13]));
  FDCE \R_counter_reg[14] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[14]),
        .Q(R_counter[14]));
  FDCE \R_counter_reg[15] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[15]),
        .Q(R_counter[15]));
  FDCE \R_counter_reg[16] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[16]),
        .Q(R_counter[16]));
  FDCE \R_counter_reg[17] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[17]),
        .Q(R_counter[17]));
  FDCE \R_counter_reg[18] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[18]),
        .Q(R_counter[18]));
  FDCE \R_counter_reg[19] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[19]),
        .Q(R_counter[19]));
  FDCE \R_counter_reg[1] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[1]),
        .Q(R_counter[1]));
  FDCE \R_counter_reg[20] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[20]),
        .Q(R_counter[20]));
  FDCE \R_counter_reg[21] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[21]),
        .Q(R_counter[21]));
  FDCE \R_counter_reg[22] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[22]),
        .Q(R_counter[22]));
  FDCE \R_counter_reg[23] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[23]),
        .Q(R_counter[23]));
  FDCE \R_counter_reg[24] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[24]),
        .Q(R_counter[24]));
  FDCE \R_counter_reg[25] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[25]),
        .Q(R_counter[25]));
  FDCE \R_counter_reg[26] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[26]),
        .Q(R_counter[26]));
  FDCE \R_counter_reg[27] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[27]),
        .Q(R_counter[27]));
  FDCE \R_counter_reg[28] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[28]),
        .Q(R_counter[28]));
  FDCE \R_counter_reg[29] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[29]),
        .Q(R_counter[29]));
  FDCE \R_counter_reg[2] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[2]),
        .Q(R_counter[2]));
  FDCE \R_counter_reg[30] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[30]),
        .Q(R_counter[30]));
  FDCE \R_counter_reg[31] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[31]),
        .Q(R_counter[31]));
  FDCE \R_counter_reg[32] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[32]),
        .Q(R_counter[32]));
  FDCE \R_counter_reg[3] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[3]),
        .Q(R_counter[3]));
  FDCE \R_counter_reg[4] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[4]),
        .Q(R_counter[4]));
  FDCE \R_counter_reg[5] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[5]),
        .Q(R_counter[5]));
  FDCE \R_counter_reg[6] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[6]),
        .Q(R_counter[6]));
  FDCE \R_counter_reg[7] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[7]),
        .Q(R_counter[7]));
  FDCE \R_counter_reg[8] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[8]),
        .Q(R_counter[8]));
  FDCE \R_counter_reg[9] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(p_0_in[9]),
        .Q(R_counter[9]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00010000)) 
    \R_px_temp[0]_i_1 
       (.I0(\R_px_temp[1]_i_3_n_0 ),
        .I1(\R_px_temp[1]_i_4_n_0 ),
        .I2(R_counter[30]),
        .I3(R_counter[31]),
        .I4(\R_px_temp_reg[0]_0 ),
        .I5(\R_px_temp_reg[1]_0 ),
        .O(\R_px_temp[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0001FFFE0000)) 
    \R_px_temp[1]_i_1 
       (.I0(\R_px_temp[1]_i_3_n_0 ),
        .I1(\R_px_temp[1]_i_4_n_0 ),
        .I2(R_counter[30]),
        .I3(R_counter[31]),
        .I4(\R_px_temp_reg[0]_0 ),
        .I5(\R_px_temp_reg[1]_0 ),
        .O(\R_px_temp[1]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \R_px_temp[1]_i_2 
       (.I0(I_rst),
        .O(\R_px_temp[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \R_px_temp[1]_i_3 
       (.I0(\R_px_temp[1]_i_5_n_0 ),
        .I1(R_counter[28]),
        .I2(R_counter[29]),
        .I3(R_counter[32]),
        .I4(R_counter[26]),
        .I5(R_counter[27]),
        .O(\R_px_temp[1]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hA8A8A888)) 
    \R_px_temp[1]_i_4 
       (.I0(\R_px_temp[1]_i_6_n_0 ),
        .I1(R_counter[15]),
        .I2(R_counter[14]),
        .I3(\R_px_temp[1]_i_7_n_0 ),
        .I4(\R_px_temp[1]_i_8_n_0 ),
        .O(\R_px_temp[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \R_px_temp[1]_i_5 
       (.I0(R_counter[20]),
        .I1(R_counter[21]),
        .I2(R_counter[22]),
        .I3(R_counter[23]),
        .I4(R_counter[25]),
        .I5(R_counter[24]),
        .O(\R_px_temp[1]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \R_px_temp[1]_i_6 
       (.I0(R_counter[17]),
        .I1(R_counter[16]),
        .I2(R_counter[19]),
        .I3(R_counter[18]),
        .O(\R_px_temp[1]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFEEE)) 
    \R_px_temp[1]_i_7 
       (.I0(R_counter[12]),
        .I1(R_counter[11]),
        .I2(R_counter[7]),
        .I3(R_counter[9]),
        .O(\R_px_temp[1]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFA8)) 
    \R_px_temp[1]_i_8 
       (.I0(R_counter[9]),
        .I1(R_counter[6]),
        .I2(R_counter[8]),
        .I3(R_counter[13]),
        .I4(R_counter[10]),
        .O(\R_px_temp[1]_i_8_n_0 ));
  FDPE \R_px_temp_reg[0] 
       (.C(I_clk),
        .CE(1'b1),
        .D(\R_px_temp[0]_i_1_n_0 ),
        .PRE(\R_px_temp[1]_i_2_n_0 ),
        .Q(\R_px_temp_reg[0]_0 ));
  FDCE \R_px_temp_reg[1] 
       (.C(I_clk),
        .CE(1'b1),
        .CLR(\R_px_temp[1]_i_2_n_0 ),
        .D(\R_px_temp[1]_i_1_n_0 ),
        .Q(\R_px_temp_reg[1]_0 ));
  LUT6 #(
    .INIT(64'hEFEFEFFF20202000)) 
    \R_temp[0]_i_1 
       (.I0(I_show_num[4]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .I5(I_show_num[0]),
        .O(\R_temp[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEFEFEFFF20202000)) 
    \R_temp[1]_i_1 
       (.I0(I_show_num[5]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .I5(I_show_num[1]),
        .O(\R_temp[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEFEFEFFF20202000)) 
    \R_temp[2]_i_1 
       (.I0(I_show_num[6]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .I5(I_show_num[2]),
        .O(\R_temp[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h66600000)) 
    \R_temp[3]_i_1 
       (.I0(\R_px_temp_reg[1]_0 ),
        .I1(\R_px_temp_reg[0]_0 ),
        .I2(\R_counter[32]_i_2_n_0 ),
        .I3(\R_px_temp[1]_i_3_n_0 ),
        .I4(I_rst),
        .O(\R_temp[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEFEFEFFF20202000)) 
    \R_temp[3]_i_2 
       (.I0(I_show_num[7]),
        .I1(\R_px_temp_reg[1]_0 ),
        .I2(\R_px_temp_reg[0]_0 ),
        .I3(\R_counter[32]_i_2_n_0 ),
        .I4(\R_px_temp[1]_i_3_n_0 ),
        .I5(I_show_num[3]),
        .O(\R_temp[3]_i_2_n_0 ));
  FDRE \R_temp_reg[0] 
       (.C(I_clk),
        .CE(\R_temp[3]_i_1_n_0 ),
        .D(\R_temp[0]_i_1_n_0 ),
        .Q(\R_temp_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \R_temp_reg[1] 
       (.C(I_clk),
        .CE(\R_temp[3]_i_1_n_0 ),
        .D(\R_temp[1]_i_1_n_0 ),
        .Q(\R_temp_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \R_temp_reg[2] 
       (.C(I_clk),
        .CE(\R_temp[3]_i_1_n_0 ),
        .D(\R_temp[2]_i_1_n_0 ),
        .Q(\R_temp_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \R_temp_reg[3] 
       (.C(I_clk),
        .CE(\R_temp[3]_i_1_n_0 ),
        .D(\R_temp[3]_i_2_n_0 ),
        .Q(\R_temp_reg_n_0_[3] ),
        .R(1'b0));
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
