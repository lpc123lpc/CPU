`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:14:05 11/26/2019 
// Design Name: 
// Module Name:    Mcontroller 
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
module Mcontroller(
    input [5:0]op,
    input [5:0]fun,
	 input [1:0]A,
    output mwrite,
	 output reg[3:0]BE,
	 output reg[2:0]DEXop
    );
	 parameter SW=6'b101011,
	           SH=6'b101001,
				  SB=6'b101000,
				  LB=6'b100000,
				  LBU=6'b100100,
				  LH=6'b100001,
				  LHU=6'b100101,
				  LW=6'b100011;
    wire sw,sh,sb;
	 wire lb,lbu,lh,lhu,lw;
	 assign sw=(op==SW)?1:0;
	 assign sh=(op==SH)?1:0;
	 assign sb=(op==SB)?1:0;
	 assign lb=(op==LB)?1:0;
	 assign lbu=(op==LBU)?1:0;
	 assign lh=(op==LH)?1:0;
	 assign lhu=(op==LHU)?1:0;
	 assign lw=(op==LW)?1:0;
	 
	 assign mwrite=sw||sh||sb;
	 
	 always@(*)begin
	 if(sw) BE<=4'b1111;
	 else if(sh)begin
	   case(A)
		2'b00,2'b01: BE<=4'b0011;
		2'b10,2'b11: BE<=4'b1100;
		endcase
	 end
	 else if(sb)begin
	   case(A)
		2'b00: BE<=4'b0001;
		2'b01: BE<=4'b0010;
		2'b10: BE<=4'b0100;
		2'b11: BE<=4'b1000;
		endcase
	 end
	 else if(lw) DEXop<=3'b000;
    else if(lbu) DEXop<=3'b001;
    else if(lb)	DEXop<=3'b010;
	 else if(lhu) DEXop<=3'b011;
	 else if(lh)  DEXop<=3'b100;
	 end

endmodule
