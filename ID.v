`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:25:08 11/26/2019 
// Design Name: 
// Module Name:    ID 
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
module ID(
    input [31:0] IR,
    input [31:0] PC4,
	 input [4:0] WA,
	 input [31:0]WD,
	 input [31:0]PC4_W,
	 input GRFwe,
	 input clk,
	 input reset,
	 input zero,
	 input gzero,
	 input lzero,
    output [31:0] RS_D,
    output [31:0] RT_D,
    output [31:0] EXTout_D,
	 output [31:0] NPC,
	 output [1:0] jump
    );
	 wire PCEXop;
    wire [1:0]EXTop;
	 Dcontroller dctr(.op(IR[31:26]),.fun(IR[5:0]),.fun2(IR[20:16]),.zero(zero),.gzero(gzero),.lzero(lzero),.EXTop(EXTop),.PCEXop(PCEXop),.jump(jump));
	 
	 GRF grf(.A1(IR[25:21]),.A2(IR[20:16]),.WA(WA),.WD(WD),.clk(clk),.reset(reset),.we(GRFwe),.PC(PC4_W),.RD1(RS_D),.RD2(RT_D));
	 EXT ext(.imm(IR[15:0]),.EXTop(EXTop),.EXT_imm(EXTout_D));
	 PCEX pcex(.PC4(PC4),.IMM26(IR[25:0]),.PCEXop(PCEXop),.NPC(NPC));

endmodule
