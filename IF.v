`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:03:14 11/26/2019 
// Design Name: 
// Module Name:    IF 
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
module IF(
    input [31:0] NPC,
	 input clk,
	 input reset,
	 input en,
    output [31:0] IR,
    output [31:0] PC4
    );
    reg [31:0]im[4095:0];
	 reg [31:0]PC;
	 wire [31:0]addr;
	 initial begin
	   PC=32'h00003000;
		$readmemh("code.txt",im);
	 end
	 
	 assign addr=PC-32'h00003000;
	 assign IR=im[addr[13:2]];
	 assign PC4=PC+4;
	 always@(posedge clk)begin
	   if(reset)
		  PC<=32'h00003000;
		else begin
		  if(en) PC<=NPC;
		end
	 end

endmodule
