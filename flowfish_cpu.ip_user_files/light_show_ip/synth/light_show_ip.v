// (c) Copyright 1995-2020 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:user:light_show:1.0
// IP Revision: 2

(* X_CORE_INFO = "light_show,Vivado 2019.2" *)
(* CHECK_LICENSE_TYPE = "light_show_ip,light_show,{}" *)
(* CORE_GENERATION_INFO = "light_show_ip,light_show,{x_ipProduct=Vivado 2019.2,x_ipVendor=xilinx.com,x_ipLibrary=user,x_ipName=light_show,x_ipVersion=1.0,x_ipCoreRevision=2,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_COUNTER_NUM=1000000}" *)
(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module light_show_ip (
  I_clk,
  I_rst,
  I_show_num,
  O_led,
  O_px
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME I_clk, ASSOCIATED_RESET I_rst, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 I_clk CLK" *)
input wire I_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME I_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 I_rst RST" *)
input wire I_rst;
input wire [7 : 0] I_show_num;
output wire [6 : 0] O_led;
output wire [1 : 0] O_px;

  light_show #(
    .C_COUNTER_NUM(1000000)
  ) inst (
    .I_clk(I_clk),
    .I_rst(I_rst),
    .I_show_num(I_show_num),
    .O_led(O_led),
    .O_px(O_px)
  );
endmodule
