`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:19:03 11/27/2019 
// Design Name: 
// Module Name:    CMP 
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
module CMP(
    input [31:0] RS,
    input [31:0] RT,
    output zero,
	 output gzero,
	 output lzero
    );
    assign zero=(RS==RT)?1:0;
	 assign gzero=($signed(RS)>0)?1:0;
	 assign lzero=($signed(RS)<0)?1:0;

endmodule
