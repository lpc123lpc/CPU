`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:42:42 11/27/2019 
// Design Name: 
// Module Name:    forward 
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
module forward(
    input [31:0] IR_D,
    input [31:0] IR_E,
    input [31:0] IR_M,
    input [31:0] IR_W,
    output [2:0] forwardRSD,
    output [2:0] forwardRTD,
    output [2:0] forwardRSE,
    output [2:0] forwardRTE,
    output [1:0] forwardRTM
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
				  LW=6'b100011,
				  LB=6'b100000,
				  LBU=6'b100100,
				  LH=6'b100001,
				  LHU=6'b100101,
				  SW=6'b101011,
	           SH=6'b101001,
				  SB=6'b101000,
				  BEQ=6'b000100, 
				  JAL=6'b000011,
				  JR=6'b001000,
				  JALR=6'b001001;
	 wire [5:0]op_e,fun_e,op_d,fun_d,op_m,fun_m,op_w,fun_w;
	 wire [4:0]rs_d,rt_d,rs_e,rt_e,rd_e,rt_m,rd_m,rt_w,rd_w;
	 
	 assign op_d=IR_D[31:26];
	 assign fun_d=IR_D[5:0];
	 assign rs_d=IR_D[25:21];
	 assign rt_d=IR_D[20:16];
	 assign op_e=IR_E[31:26];
	 assign fun_e=IR_E[5:0];
	 assign rs_e=IR_E[25:21];
	 assign rt_e=IR_E[20:16];
	 assign rd_e=IR_E[15:11];
	 assign op_m=IR_M[31:26];
	 assign fun_m=IR_M[5:0];
	 assign rt_m=IR_M[20:16];
	 assign rd_m=IR_M[15:11];
	 assign op_w=IR_W[31:26];
	 assign fun_w=IR_W[5:0];
	 assign rt_w=IR_W[20:16];
	 assign rd_w=IR_W[15:11];
	 
	 wire jal_m,jal_w,jalr_m,jalr_w;
	 
	 assign jal_m=(op_m==JAL)?1:0;
	 assign jal_w=(op_w==JAL)?1:0;
	 assign jalr_m=(op_m==R&&fun_m==JALR)?1:0;
	 assign jalr_w=(op_w==R&&fun_w==JALR)?1:0;

	 
	 wire cal_r_m,cal_i_m,cal_r_w,cal_i_w,ld_w;//ex\mem
	 wire add_m,addu_m,sub_m,subu_m,sllv_m,srav_m,srlv_m,and_m,or_m,xor_m,nor_m,slt_m,sltu_m,sra_m,srl_m,sll_m,mfhi_m,mflo_m;
	 wire addi_m,addiu_m,andi_m,xori_m,ori_m,lui_m,slti_m,sltiu_m;
	 
	 assign add_m=(op_m==R&&fun_m==ADD)?1:0;
	 assign addu_m=(op_m==R&&fun_m==ADDU)?1:0;
	 assign sub_m=(op_m==R&&fun_m==SUB)?1:0;
	 assign subu_m=(op_m==R&&fun_m==SUBU)?1:0;
	 assign sllv_m=(op_m==R&&fun_m==SLLV)?1:0;
	 assign srav_m=(op_m==R&&fun_m==SRAV)?1:0;
	 assign srlv_m=(op_m==R&&fun_m==SRLV)?1:0;
	 assign and_m=(op_m==R&&fun_m==AND)?1:0;
	 assign or_m=(op_m==R&&fun_m==OR)?1:0;
	 assign xor_m=(op_m==R&&fun_m==XOR)?1:0;
	 assign nor_m=(op_m==R&&fun_m==NOR)?1:0;
	 assign slt_m=(op_m==R&&fun_m==SLT)?1:0;
	 assign sltu_m=(op_m==R&&fun_m==SLTU)?1:0;
	 assign sra_m=(op_m==R&&fun_m==SRA)?1:0;
	 assign srl_m=(op_m==R&&fun_m==SRL)?1:0;
	 assign sll_m=(op_m==R&&fun_m==SLL)?1:0;
	 assign mfhi_m=(op_m==R&&fun_m==MFHI)?1:0;
	 assign mflo_m=(op_m==R&&fun_m==MFLO)?1:0;
	 assign addi_m=(op_m==ADDI)?1:0;
	 assign addiu_m=(op_m==ADDIU)?1:0;
	 assign andi_m=(op_m==ANDI)?1:0;
	 assign xori_m=(op_m==XORI)?1:0;
	 assign ori_m=(op_m==ORI)?1:0;
	 assign lui_m=(op_m==LUI)?1:0;
	 assign slti_m=(op_m==SLTI)?1:0;
	 assign sltiu_m=(op_m==SLTIU)?1:0;
	 
	 assign cal_r_m=add_m||addu_m||sub_m||subu_m||
	                sllv_m||srav_m||srlv_m||sra_m||srl_m||sll_m||
						 and_m||or_m||xor_m||nor_m||
						 slt_m||sltu_m||mfhi_m||mflo_m;
	 assign cal_i_m=addi_m||addiu_m||andi_m||xori_m||ori_m||lui_m||slti_m||sltiu_m;
	 
	 wire add_w,addu_w,sub_w,subu_w,sllv_w,srav_w,srlv_w,and_w,or_w,xor_w,nor_w,slt_w,sltu_w,sra_w,srl_w,sll_w,mfhi_w,mflo_w;
	 wire addi_w,addiu_w,andi_w,xori_w,ori_w,lui_w,slti_w,sltiu_w;
	 wire lw_w,lb_w,lbu_w,lh_w,lhu_w;//mem/wb
	 
	 assign add_w=(op_w==R&&fun_w==ADD)?1:0;
	 assign addu_w=(op_w==R&&fun_w==ADDU)?1:0;
	 assign sub_w=(op_w==R&&fun_w==SUB)?1:0;
	 assign subu_w=(op_w==R&&fun_w==SUBU)?1:0;
	 assign sllv_w=(op_w==R&&fun_w==SLLV)?1:0;
	 assign srav_w=(op_w==R&&fun_w==SRAV)?1:0;
	 assign srlv_w=(op_w==R&&fun_w==SRLV)?1:0;
	 assign and_w=(op_w==R&&fun_w==AND)?1:0;
	 assign or_w=(op_w==R&&fun_w==OR)?1:0;
	 assign xor_w=(op_w==R&&fun_w==XOR)?1:0;
	 assign nor_w=(op_w==R&&fun_w==NOR)?1:0;
	 assign slt_w=(op_w==R&&fun_w==SLT)?1:0;
	 assign sltu_w=(op_w==R&&fun_w==SLTU)?1:0;
	 assign sra_w=(op_w==R&&fun_w==SRA)?1:0;
	 assign srl_w=(op_w==R&&fun_w==SRL)?1:0;
	 assign sll_w=(op_w==R&&fun_w==SLL)?1:0;
	 assign mfhi_w=(op_w==R&&fun_w==MFHI)?1:0;
	 assign mflo_w=(op_w==R&&fun_w==MFLO)?1:0;
	 assign addi_w=(op_w==ADDI)?1:0;
	 assign addiu_w=(op_w==ADDIU)?1:0;
	 assign andi_w=(op_w==ANDI)?1:0;
	 assign xori_w=(op_w==XORI)?1:0;
	 assign ori_w=(op_w==ORI)?1:0;
	 assign lui_w=(op_w==LUI)?1:0;
	 assign slti_w=(op_w==SLTI)?1:0;
	 assign sltiu_w=(op_w==SLTIU)?1:0;
	 assign lw_w=(op_w==LW)?1:0;
	 assign lb_w=(op_w==LB)?1:0;
	 assign lbu_w=(op_w==LBU)?1:0;
	 assign lh_w=(op_w==LH)?1:0;
	 assign lhu_w=(op_w==LHU)?1:0;
	 
	 assign cal_r_w=add_w||addu_w||sub_w||subu_w||
	                sllv_w||srav_w||srlv_w||sra_w||srl_w||sll_w||
						 and_w||or_w||xor_w||nor_w||
						 slt_w||sltu_w||mfhi_w||mflo_w;
	 assign cal_i_w=addi_w||addiu_w||andi_w||xori_w||ori_w||lui_w||slti_w||sltiu_w;
	 assign ld_w=lw_w||lb_w||lbu_w||lh_w||lhu_w;
	 
	 
    assign forwardRSD=(cal_r_m&&rs_d==rd_m&&rs_d!=0)?1:
	                   (cal_i_m&&rs_d==rt_m&&rs_d!=0)?1:
							 (jal_m  &&rs_d==31)           ?2:
							 (jalr_m &&rs_d==rd_m&&rs_d!=0)?2:
							 (cal_r_w&&rs_d==rd_w&&rs_d!=0)?3:
							 (cal_i_w&&rs_d==rt_w&&rs_d!=0)?3:
							 (ld_w   &&rs_d==rt_w&&rs_d!=0)?3:
							 (jal_w  &&rs_d==31)?4:
							 (jalr_w &&rs_d==rd_w&&rd_w!=0)?4:
							                                  0;
	 assign forwardRTD=(cal_r_m&&rt_d==rd_m&&rt_d!=0)?1:
	                   (cal_i_m&&rt_d==rt_m&&rt_d!=0)?1:
							 (jal_m&&rt_d==31)             ?2:
							 (jalr_m &&rs_d==rd_m&&rs_d!=0)?2:
							 (cal_r_w&&rt_d==rd_w&&rt_d!=0)?3:
							 (cal_i_w&&rt_d==rt_w&&rt_d!=0)?3:
							 (ld_w   &&rt_d==rt_w&&rt_d!=0)?3:
							 (jal_w&&rt_d==31)             ?4:
							 (jalr_w &&rs_d==rd_w&&rd_w!=0)?4:
							                                0;
	 
	 
	 assign forwardRSE=cal_r_m&&rs_e==rd_m&&rs_e!=0?1:
	                   cal_i_m&&rs_e==rt_m&&rs_e!=0?1:
							 jal_m  &&rs_e==31           ?2:
							 jalr_m &&rs_e==rd_m&&rs_e!=0?2:
							 cal_r_w&&rs_e==rd_w&&rs_e!=0?3:
							 cal_i_w&&rs_e==rt_w&&rs_e!=0?3:
							 ld_w   &&rs_e==rt_w&&rs_e!=0?3:
							 jal_w  &&rs_e==31           ?4:
							 jalr_w &&rs_e==rd_w&&rs_e!=0?4:
							                                  0;
    assign forwardRTE=cal_r_m&&rt_e==rd_m&&rt_e!=0?1:
	                   cal_i_m&&rt_e==rt_m&&rt_e!=0?1:
							 jal_m  &&rt_e==31           ?2:
							 jalr_m &&rt_e==rd_m&&rt_e!=0?2:
							 cal_r_w&&rt_e==rd_w&&rt_e!=0?3:
							 cal_i_w&&rt_e==rt_w&&rt_e!=0?3:
							 ld_w   &&rt_e==rt_w&&rt_e!=0?3:
							 jal_w  &&rt_e==31           ?4:
							 jalr_w &&rt_e==rd_w&&rt_e!=0?4:
							                              0;
	
	 assign forwardRTM=(cal_r_w&&rt_m==rd_w&&rt_m!=0)?1:
	                   (cal_i_w&&rt_m==rt_w&&rt_m!=0)?1:
							 (ld_w   &&rt_m==rt_w&&rt_m!=0)?1:
							 (jal_w  &&rt_m==31           )?2:
							 (jalr_w &&rt_m==rd_w&&rt_m!=0)?2:
							                             0;
	                   
endmodule
