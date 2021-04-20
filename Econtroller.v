`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:45:03 11/26/2019 
// Design Name: 
// Module Name:    Econtroller 
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
module Econtroller(
    input [5:0] op,
    input [5:0] fun,
	 input [4:0]tim,
    output [3:0] ALUop,
	 output ALUBop,
	 output [1:0]MDOP,
	 output busy,
	 output start,
	 output [1:0]AOOP,
	 output [1:0]MDWE
    );
	 parameter SW=6'b101011,
	           SH=6'b101001,
				  SB=6'b101000,
				  R=6'b000000,
				  ADD=6'b100000,
				  ADDU=6'b100001,
				  SUB=6'b100010,
				  SUBU=6'b100011,
				  SLLV=6'b000100,
				  SRAV=6'b000111,
				  SRLV=6'b000110,
				  AND=6'b100100,
				  OR=6'b100101,
				  XOR=6'b100110,
				  NOR=6'b100111,
				  SLT=6'b101010,
				  SLTU=6'b101011,
				  SRA=6'b000011,
				  SRL=6'b000010,
				  SLL=6'b000000,
				  MULT=6'b011000,
				  DIV=6'b011010,
				  MULTU=6'b011001,
				  DIVU=6'b011011,
				  MFHI=6'b010000,
				  MFLO=6'b010010,
				  MTHI=6'b010001,
				  MTLO=6'b010011,
				  ADDI=6'b001000,
				  ADDIU=6'b001001,
				  ANDI=6'b001100,
				  XORI=6'b001110,
				  ORI=6'b001101,
				  LUI=6'b001111,
				  SLTI=6'b001010,
				  SLTIU=6'b001011,
				  LW=6'b100011,
				  LB=6'b100000,
				  LBU=6'b100100,
				  LH=6'b100001,
				  LHU=6'b100101;
    wire add,addu,sub,subu,sllv,srav,srlv,and_e,or_e,xor_e,nor_e,slt,sltu;
	 wire sra,srl,sll;
	 wire addi,addiu,andi,xori,ori,lui,slti,sltiu;
	 wire lw,lb,lbu,lh,lhu;
	 wire sw,sh,sb;
    wire mult,multu,div,divu,mfhi,mflo,mthi,mtlo;
	 
	 
	 
	 assign lw=(op==LW)?1:0;
	 assign lb=(op==LB)?1:0;
	 assign lbu=(op==LBU)?1:0;
	 assign lh=(op==LH)?1:0;
	 assign lhu=(op==LHU)?1:0;
	 assign sw=(op==SW)?1:0;
	 assign sh=(op==SH)?1:0;
	 assign sb=(op==SB)?1:0;
	 assign add=(op==R&&fun==ADD)?1:0;
	 assign addu=(op==R&&fun==ADDU)?1:0;
	 assign sub=(op==R&&fun==SUB)?1:0;
	 assign subu=(op==R&&fun==SUBU)?1:0;
	 assign sllv=(op==R&&fun==SLLV)?1:0;
	 assign srav=(op==R&&fun==SRAV)?1:0;
	 assign srlv=(op==R&&fun==SRLV)?1:0;
	 assign and_e=(op==R&&fun==AND)?1:0;
	 assign or_e=(op==R&&fun==OR)?1:0;
	 assign xor_e=(op==R&&fun==XOR)?1:0;
	 assign nor_e=(op==R&&fun==NOR)?1:0;
	 assign slt=(op==R&&fun==SLT)?1:0;
	 assign sltu=(op==R&&fun==SLTU)?1:0;
	 assign sra=(op==R&&fun==SRA)?1:0;
	 assign srl=(op==R&&fun==SRL)?1:0;
	 assign sll=(op==R&&fun==SLL)?1:0;
	 assign mult=(op==R&&fun==MULT)?1:0;
	 assign multu=(op==R&&fun==MULTU)?1:0;
	 assign div=(op==R&&fun==DIV)?1:0;
	 assign divu=(op==R&&fun==DIVU)?1:0;
	 assign mfhi=(op==R&&fun==MFHI)?1:0;
	 assign mflo=(op==R&&fun==MFLO)?1:0;
	 assign mthi=(op==R&&fun==MTHI)?1:0;
	 assign mtlo=(op==R&&fun==MTLO)?1:0;
	 assign addi=(op==ADDI)?1:0;
	 assign addiu=(op==ADDIU)?1:0;
	 assign andi=(op==ANDI)?1:0;
	 assign xori=(op==XORI)?1:0;
	 assign ori=(op==ORI)?1:0;
	 assign lui=(op==LUI)?1:0;
	 assign slti=(op==SLTI)?1:0;
	 assign sltiu=(op==SLTIU)?1:0;
	 
	 assign ALUop[0]=sub||subu||sllv||srlv||or_e||nor_e||sltu||sltiu||srl;
	 assign ALUop[1]=ori||sllv||and_e||or_e||slt||sltu||andi||slti||sltiu||sll;
	 assign ALUop[2]=srav||srlv||and_e||or_e||andi||sra||srl||sll;
	 assign ALUop[3]=xor_e||nor_e||slt||sltu||xori||slti||sltiu||sra||srl||sll;
	 
	 assign MDOP[0]=div||divu;
    assign MDOP[1]=mult||div;	 
	 
	 assign start=(tim==0&&(mult||multu||div||divu))?1:0;
	 assign busy=(tim>0)?1:0;
	 
	 assign AOOP[0]=mfhi;
	 assign AOOP[1]=mflo;
	 
	 assign MDWE[0]=mthi;
	 assign MDWE[1]=mtlo;
	 
	 assign ALUBop=lw||lb||lbu||lh||lhu||
	               sw||sh||sb||
						addi||addiu||andi||xori||ori||lui||slti||sltiu;
endmodule
