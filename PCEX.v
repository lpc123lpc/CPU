`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:22:50 11/26/2019 
// Design Name: 
// Module Name:    PCEX 
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
module PCEX(
    input [31:0] PC4,
    input [25:0] IMM26,
	 input  PCEXop,
    output reg[31:0] NPC
    );
	 always@(*)begin
    if(PCEXop==0)
	   NPC<=({{16{IMM26[15]}},IMM26[15:0]}<<2)+PC4;//beq
	 else if(PCEXop==1)
	   NPC<={PC4[31:28],IMM26,2'b0};//jal
    end
endmodule
