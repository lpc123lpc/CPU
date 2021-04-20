`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:14:41 11/26/2019 
// Design Name: 
// Module Name:    Dreg 
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
module Dreg(
    input [31:0] IR,
    input [31:0] PC4,
	 input clk,
	 input reset,
	 input en,
    output [31:0] IR_D,
    output [31:0] PC4_D
    );
    reg [31:0]instr;
	 reg [31:0]pc4;
	 initial begin
	   instr=0;
		pc4=0;
	 end
	 
	 assign IR_D=instr;
	 assign PC4_D=pc4;
	 
	 always@(posedge clk)begin
	   if(reset)begin
		  instr<=0;
		  pc4<=4;
		end
		else begin
		  if(en)begin
		  instr<=IR;
		  pc4<=PC4;
		  end
		end
	 
	 end

endmodule
