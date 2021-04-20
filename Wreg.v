`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:28:55 11/26/2019 
// Design Name: 
// Module Name:    Wreg 
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
module Wreg(
    input [31:0] IR,
    input [31:0] PC4,
    input [31:0] AO,
    input [31:0] DR,
    input clk,
    input reset,
    output [31:0] IR_W,
    output [31:0] PC4_W,
    output [31:0] AO_W,
    output [31:0] DR_W
    );
    reg [31:0]instr;
	 reg [31:0]pc4;
	 reg [31:0]ao;
	 reg [31:0]dr;
	 initial begin
	   instr=0;
		pc4=0;
		ao=0;
		dr=0;
	 end
    
	 assign IR_W=instr;
	 assign PC4_W=pc4;
	 assign AO_W=ao;
	 assign DR_W=dr;
	 
	 always@(posedge clk)begin
	   if(reset)begin
		 instr<=0;
		 pc4<=0;
		 ao<=0;
		 dr<=0;
	     end
		 else begin
		   instr<=IR;
			pc4<=PC4;
			ao<=AO;
			dr<=DR;
		 end
		
	 end
endmodule
