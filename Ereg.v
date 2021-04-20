`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:39:30 11/26/2019 
// Design Name: 
// Module Name:    Ereg 
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
module Ereg(
    input [31:0] IR,
    input [31:0] PC4,
    input [31:0] RS,
    input [31:0] RT,
    input [31:0] EXT,
	 input clk,
	 input reset,
	 input clr,
	 output [31:0]IR_E,
	 output [31:0]PC4_E,
	 output [31:0]RS_E,
	 output [31:0]RT_E,
	 output [31:0]EXT_E
    );
	 reg [31:0] instr;
	 reg [31:0] pc4;
	 reg [31:0] rs;
	 reg [31:0] rt;
	 reg [31:0] ext;
	 initial begin
	   instr=0;
		pc4=0;
		rs=0;
		rt=0;
		ext=0;
	 end
	 
	 assign IR_E=instr;
	 assign PC4_E=pc4;
	 assign RS_E=rs;
	 assign RT_E=rt;
	 assign EXT_E=ext;
	 
	 
	 always@(posedge clk)begin
	   if(reset)begin
		  instr<=0;
		  pc4<=0;
		  rs<=0;
		  rt<=0;
		  ext<=0;
		end
		else begin
		  if(clr)begin
		  instr<=0;
        pc4<=0;
        rs<=0;
        rt<=0;
        ext<=0;
		  end
		  else begin
		  instr<=IR;
        pc4<=PC4;
        rs<=RS;
        rt<=RT;
        ext<=EXT;
		  end
		end
	 end

endmodule
