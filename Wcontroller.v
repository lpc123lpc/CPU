`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:17:42 11/26/2019 
// Design Name: 
// Module Name:    Wcontroller 
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
module Wcontroller(
    input [5:0]op,
    input [5:0]fun,
    output GRFwe,
	 output [1:0]WAop,
	 output [1:0]WDop
    );
	 parameter R=6'b000000,
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
				  MFHI=6'b010000,
				  MFLO=6'b010010,
				  ADDI=6'b001000,
				  ADDIU=6'b001001,
				  ANDI=6'b001100,
				  XORI=6'b001110,
	           ORI=6'b001101,
				  LUI=6'b001111,
				  SLTI=6'b001010,
				  SLTIU=6'b001011,
				  LB=6'b100000,
				  LBU=6'b100100,
				  LH=6'b100001,
				  LHU=6'b100101,
				  LW=6'b100011,
				  SW=6'b101011,
	           SH=6'b101001,
				  SB=6'b101000,
				  BEQ=6'b000100, 
				  JAL=6'b000011,
				  JR=6'b001000,
				  JALR=6'b001001;
    wire add,addu,sub,subu,sllv,srav,srlv,and_w,or_w,xor_w,nor_w,slt,sltu,sra,srl,sll,mfhi,mflo;
	 wire addi,addiu,andi,xori,ori,lui,slti,sltiu;
	 wire lw,lb,lbu,lh,lhu;
	 wire sw,sh,sb;
	 wire beq;
	 wire jal,jr,jalr;
	 
	 assign add=(op==R&&fun==ADD)?1:0;
	 assign addu=(op==R&&fun==ADDU)?1:0;
	 assign sub=(op==R&&fun==SUB)?1:0;
    assign subu=(op==R&&fun==SUBU)?1:0;
	 assign sllv=(op==R&&fun==SLLV)?1:0;
	 assign srav=(op==R&&fun==SRAV)?1:0;
	 assign srlv=(op==R&&fun==SRLV)?1:0;
	 assign and_w=(op==R&&fun==AND)?1:0;
	 assign or_w=(op==R&&fun==OR)?1:0;
	 assign xor_w=(op==R&&fun==XOR)?1:0;
	 assign nor_w=(op==R&&fun==NOR)?1:0;
	 assign slt=(op==R&&fun==SLT)?1:0;
	 assign sltu=(op==R&&fun==SLTU)?1:0;
	 assign sra=(op==R&&fun==SRA)?1:0;
	 assign srl=(op==R&&fun==SRL)?1:0;
	 assign sll=(op==R&&fun==SLL)?1:0;
	 assign mfhi=(op==R&&fun==MFHI)?1:0;
	 assign mflo=(op==R&&fun==MFLO)?1:0;
	 assign addi=(op==ADDI)?1:0;
	 assign addiu=(op==ADDIU)?1:0;
	 assign andi=(op==ANDI)?1:0;
	 assign xori=(op==XORI)?1:0;
	 assign ori=(op==ORI)? 1:0;
	 assign lui=(op==LUI)?1:0;
	 assign slti=(op==SLTI)?1:0;
	 assign sltiu=(op==SLTIU)?1:0;
	 assign lb=(op==LB)?1:0;
	 assign lbu=(op==LBU)?1:0;
	 assign lh=(op==LH)?1:0;
	 assign lhu=(op==LHU)?1:0;
	 assign lw=(op==LW)?1:0;
	 assign sw=(op==SW)?1:0;
	 assign sh=(op==SH)?1:0;
	 assign sb=(op==SB)?1:0;
	 assign beq=(op==BEQ)?1:0;
	 assign jr=(op==R&&fun==JR)?1:0;
	 assign jal=(op==JAL)?1:0;
	 assign jalr=(op==R&&fun==JALR)?1:0;
	 
	 assign GRFwe=add||addu||sub||subu||sllv||srav||srlv||and_w||or_w||xor_w||nor_w||slt||sltu||sra||srl||sll||mfhi||mflo||
              	  lb||lbu||lh||lhu||lw||
					  addi||addiu||andi||xori||ori||lui||slti||sltiu||
					  jal||jalr; 
	 
	 assign WAop[0]=addi||addiu||andi||xori||ori||lui||slti||sltiu||
	                lb||lbu||lh||lhu||lw;
	 assign WAop[1]=jal;
	 
	 assign WDop[0]=lb||lbu||lh||lhu||lw;
	 assign WDop[1]=jal||jalr;

endmodule
