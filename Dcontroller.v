`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:15:30 11/26/2019 
// Design Name: 
// Module Name:    Dcontroller 
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
module Dcontroller(
    input [5:0] op,
    input [5:0] fun,
	 input [4:0] fun2,
	 input zero,
	 input gzero,
	 input lzero,
    output [1:0] EXTop,
    output PCEXop,
	 output [1:0]jump
    );
	 parameter R=6'b000000,
	           ADDI=6'b001000,
				  ADDIU=6'b001001,
				  ANDI=6'b001100,
				  SLTI=6'b001010,
				  SLTIU=6'b001011,
	           ORI=6'b001101,
				  LUI=6'b001111,
				  LW=6'b100011,
				  LB=6'b100000,
				  LBU=6'b100100,
				  LH=6'b100001,
				  LHU=6'b100101,
				  SW=6'b101011,
	           SH=6'b101001,
				  SB=6'b101000,
				  BEQ=6'b000100, 
				  BNE=6'b000101,
				  BGTZ=6'b000111,
				  BLEZ=6'b000110,
				  BLTZ=5'b00000,
				  BGEZ=5'b00001,
				  JAL=6'b000011,
				  J=6'b000010,
				  JR=6'b001000,
				  JALR=6'b001001;
    wire addi,addiu,andi,ori,lui,slti,sltiu;
	 wire lw,lb,lbu,lh,lhu,sw,sh,sb;
	 wire beq,bne,bgtz,blez,bltz,bgez;
	 wire jal,jr,j,jalr;
	 
	 assign addi=(op==ADDI)?1:0;
	 assign addiu=(op==ADDIU)?1:0;
	 assign andi=(op==ANDI)?1:0;
	 assign ori=(op==ORI)? 1:0;
	 assign lui=(op==LUI)?1:0;
	 assign slti=(op==SLTI)?1:0;
	 assign sltiu=(op==SLTIU)?1:0;
	 assign lw=(op==LW)?1:0;
	 assign lb=(op==LB)?1:0;
	 assign lbu=(op==LBU)?1:0;
	 assign lh=(op==LH)?1:0;
	 assign lhu=(op==LHU)?1:0;
	 assign sw=(op==SW)?1:0;
	 assign sh=(op==SH)?1:0;
	 assign sb=(op==SB)?1:0;
	 assign beq=(op==BEQ)?zero:0;
	 assign bne=(op==BNE)?~zero:0;
	 assign bgtz=(op==BGTZ)?gzero:0;
	 assign blez=(op==BLEZ)?~gzero:0;
	 assign bltz=(op==6'b000001&&fun2==BLTZ)?lzero:0;
	 assign bgez=(op==6'b000001&&fun2==BGEZ)?~lzero:0;
 	 
	 
	 assign j=(op==J)?1:0;
	 assign jr=(op==R&&fun==JR)?1:0;
	 assign jal=(op==JAL)?1:0;
	 assign jalr=(op==R&&fun==JALR)?1:0;
	 
	 assign EXTop[0]=lw||lb||lbu||lh||lhu||sw||sh||sb||
	                 addi||addiu||slti||sltiu;
	 assign EXTop[1]=lui;
	 
	 assign PCEXop=jal||j;
     
	 assign jump[0]=beq||jal||j||bne||bgtz||blez||bltz||bgez;
	 assign jump[1]=jr||jalr;
endmodule
