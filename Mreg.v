`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:07:59 11/26/2019 
// Design Name: 
// Module Name:    Mreg 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Mreg(
    input [31:0] IR,
    input [31:0] PC4,
    input [31:0] AO,
    input [31:0] RT,
    input clk,
    input reset,
    output [31:0] IR_M,
    output [31:0] PC4_M,
    output [31:0] AO_M,
    output [31:0] RT_M
    );
	 reg [31:0]instr;
	 reg [31:0]pc4;
	 reg [31:0]ao;
	 reg [31:0]rt;
    initial begin
	    instr=0;
		 pc4=0;
		 ao=0;
		 rt=0;
	 end
	 assign IR_M=instr;
	 assign PC4_M=pc4;
	 assign AO_M=ao;
	 assign RT_M=rt;
	 always@(posedge clk)begin
	   if(reset)begin
		 instr<=0;
		 pc4<=0;
		 ao<=0;
		 rt<=0;
		end
		else begin
		  instr<=IR;
		  pc4<=PC4;
		  ao<=AO;
		  rt<=RT;
		end
	 
	 end

endmodule
