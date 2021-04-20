`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:45:27 11/27/2019 
// Design Name: 
// Module Name:    PAUSE 
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
module PAUSE(
    input [31:0] IR_D,
    input [31:0] IR_E,
    input [31:0] IR_M,
	 input busy,
	 input start,
    output stall
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
				  JR=6'b001000,
				  JALR=6'b001001;
	 
    wire [5:0]op_e,fun_e,op_d,fun_d,op_m,fun_m;
	 wire [4:0]rs_d,rt_d,rt_e,rd_e,rt_m,rd_m;
    
	 wire add_d,addu_d,sub_d,subu_d,sllv_d,srav_d,srlv_d,and_d,or_d,xor_d,nor_d,slt_d,sltu_d,sra_d,srl_d,sll_d;
	 wire mult_d,multu_d,div_d,divu_d,mfhi_d,mflo_d,mthi_d,mtlo_d;
	 wire addi_d,addiu_d,xori_d,andi_d,ori_d,slti_d,sltiu_d;
	 wire lw_d,lb_d,lbu_d,lh_d,lhu_d;
	 wire sw_d,sh_d,sb_d;
	 wire beq_d,bne_d,bgtz_d,blez_d,bltz_d,bgez_d;
	 wire jr_d,jalr_d;
	 wire cal_r_d,cal_i_d,ld_d,st_d,b_d,md_d,mt_d;
	 
	 assign op_d=IR_D[31:26];
	 assign fun_d=IR_D[5:0];
	 assign rs_d=IR_D[25:21];
	 assign rt_d=IR_D[20:16];
	 assign op_e=IR_E[31:26];
	 assign fun_e=IR_E[5:0];
	 assign rt_e=IR_E[20:16];
	 assign rd_e=IR_E[15:11];
	 assign op_m=IR_M[31:26];
	 assign fun_m=IR_M[5:0];
	 assign rt_m=IR_M[20:16];
	 assign rd_m=IR_M[15:11];
	 
	 assign add_d=(op_d==R&&fun_d==ADD)?1:0;
	 assign addu_d=(op_d==R&&fun_d==ADDU) ? 1:0;
	 assign sub_d=(op_d==R&&fun_d==SUB)?1:0;
	 assign subu_d=(op_d==R&&fun_d==SUBU)?1:0;
	 assign sllv_d=(op_d==R&&fun_d==SLLV)?1:0;
	 assign srav_d=(op_d==R&&fun_d==SRAV)?1:0;
	 assign srlv_d=(op_d==R&&fun_d==SRLV)?1:0;
	 assign and_d=(op_d==R&&fun_d==AND)?1:0;
	 assign or_d=(op_d==R&&fun_d==OR)?1:0;
	 assign xor_d=(op_d==R&&fun_d==XOR)?1:0;
	 assign nor_d=(op_d==R&&fun_d==NOR)?1:0;
	 assign slt_d=(op_d==R&&fun_d==SLT)?1:0;
	 assign sltu_d=(op_d==R&&fun_d==SLTU)?1:0;
	 assign sra_d=(op_d==R&&fun_d==SRA)?1:0;
	 assign srl_d=(op_d==R&&fun_d==SRL)?1:0;
	 assign sll_d=(op_d==R&&fun_d==SLL)?1:0;
	 assign mult_d=(op_d==R&&fun_d==MULT)?1:0;
	 assign multu_d=(op_d==R&&fun_d==MULTU)?1:0;
	 assign div_d=(op_d==R&&fun_d==DIV)?1:0;
	 assign divu_d=(op_d==R&&fun_d==DIVU)?1:0;
	 assign mfhi_d=(op_d==R&&fun_d==MFHI)?1:0;
	 assign mflo_d=(op_d==R&&fun_d==MFLO)?1:0;
	 assign mthi_d=(op_d==R&&fun_d==MTHI)?1:0;
	 assign mtlo_d=(op_d==R&&fun_d==MTLO)?1:0;
	 assign addi_d=(op_d==ADDI)?1:0;
	 assign addiu_d=(op_d==ADDIU)?1:0;
	 assign andi_d=(op_d==ANDI)?1:0;
	 assign xori_d=(op_d==XORI)?1:0;
	 assign ori_d=(op_d==ORI)?1:0;
	 assign slti_d=(op_d==SLTI)?1:0;
	 assign sltiu_d=(op_d==SLTIU)?1:0;
	 assign lw_d=(op_d==LW)?1:0;
	 assign lb_d=(op_d==LB)?1:0;
	 assign lbu_d=(op_d==LBU)?1:0;
	 assign lh_d=(op_d==LH)?1:0;
	 assign lhu_d=(op_d==LHU)?1:0;
	 assign sw_d=(op_d==SW)?1:0;
	 assign sh_d=(op_d==SH)?1:0;
	 assign sb_d=(op_d==SB)?1:0;
	 assign beq_d=(op_d==BEQ)?1:0;
	 assign bne_d=(op_d==BNE)?1:0;
	 assign bgtz_d=(op_d==BGTZ)?1:0;
	 assign blez_d=(op_d==BLEZ)?1:0;
	 assign bltz_d=(op_d==6'b000001&&rt_d==BLTZ)?1:0;
	 assign bgez_d=(op_d==6'b000001&&rt_d==BGEZ)?1:0;
	 assign jr_d=(op_d==R&&fun_d==JR)?1:0;
	 assign jalr_d=(op_d==R&&fun_d==JALR)?1:0;
	 
    assign cal_r_d=add_d||addu_d||sub_d||subu_d||
	                sllv_d||srav_d||srlv_d||sra_d||srl_d||sll_d||
						 and_d||or_d||xor_d||nor_d||
						 slt_d||sltu_d||mult_d||multu_d||div_d||divu_d;   
	 assign cal_i_d=ori_d||addi_d||addiu_d||andi_d||xori_d||slti_d||sltiu_d;
	 assign ld_d=lw_d||lb_d||lbu_d||lh_d||lhu_d;
	 assign st_d=sw_d||sh_d||sb_d;
	 assign b_d=beq_d||bne_d||bgtz_d||blez_d;
	 assign b2_d=bltz_d||bgez_d;
	 assign md_d=mult_d||multu_d||div_d||divu_d||mfhi_d||mflo_d||mthi_d||mtlo_d;
	 assign mt_d=mthi_d||mtlo_d;
	 
	 wire add_e,addu_e,sub_e,subu_e,sllv_e,srav_e,srlv_e,and_e,or_e,xor_e,nor_e,slt_e,sltu_e,sra_e,srl_e,sll_e;
	 wire mfhi_e,mflo_e;
	 wire addi_e,addiu_e,andi_e,xori_e,ori_e,lui_e,slti_e,sltiu_e;
	 wire lw_e,lb_e,lbu_e,lh_e,lhu_e;
	 wire cal_r_e,cal_i_e,ld_e;
	 
	 assign add_e=(op_e==R&&fun_e==ADD)?1:0;
	 assign addu_e=(op_e==R&&fun_e==ADDU) ? 1:0;
	 assign sub_e=(op_e==R&&fun_e==SUB)?1:0;
	 assign subu_e=(op_e==R&&fun_e==SUBU)?1:0;
	 assign sllv_e=(op_e==R&&fun_e==SLLV)?1:0;
	 assign srav_e=(op_e==R&&fun_e==SRAV)?1:0;
	 assign srlv_e=(op_e==R&&fun_e==SRLV)?1:0;
	 assign and_e=(op_e==R&&fun_e==AND)?1:0;
	 assign or_e=(op_e==R&&fun_e==OR)?1:0;
	 assign xor_e=(op_e==R&&fun_e==XOR)?1:0;
	 assign nor_e=(op_e==R&&fun_e==NOR)?1:0;
	 assign slt_e=(op_e==R&&fun_e==SLT)?1:0;
	 assign sltu_e=(op_e==R&&fun_e==SLTU)?1:0;
	 assign sra_e=(op_e==R&&fun_e==SRA)?1:0;
	 assign srl_e=(op_e==R&&fun_e==SRL)?1:0;
	 assign sll_e=(op_e==R&&fun_e==SLL)?1:0;
	 assign mfhi_e=(op_e==R&&fun_e==MFHI)?1:0;
	 assign mflo_e=(op_e==R&&fun_e==MFLO)?1:0;
	 assign addi_e=(op_e==ADDI)?1:0;
	 assign addiu_e=(op_e==ADDIU)?1:0;
	 assign andi_e=(op_e==ANDI)?1:0;
	 assign xori_e=(op_e==XORI)?1:0;
	 assign ori_e=(op_e==ORI)?1:0;
	 assign lui_e=(op_e==LUI)?1:0;
	 assign slti_e=(op_e==SLTI)?1:0;
	 assign sltiu_e=(op_e==SLTIU)?1:0;
	 assign lw_e=(op_e==LW)?1:0;
	 assign lb_e=(op_e==LB)?1:0;
	 assign lbu_e=(op_e==LBU)?1:0;
	 assign lh_e=(op_e==LH)?1:0;
	 assign lhu_e=(op_e==LHU)?1:0;
	 
	 
	 assign cal_r_e=add_e||addu_e||sub_e||subu_e||
	                sllv_e||srav_e||srlv_e||sra_e||srl_e||sll_e||
						 and_e||or_e||xor_e||nor_e||
						 slt_e||sltu_e||mfhi_e||mflo_e;
	 assign cal_i_e=addi_e||addiu_e||andi_e||xori_e||ori_e||lui_e||slti_e||sltiu_e;
	 assign ld_e=lw_e||lb_e||lbu_e||lh_e||lhu_e;
	 
	 wire lw_m,lb_w,lbu_w,lh_w,lhu_w;
	 wire ld_m;
	 
	 assign lw_m=(op_m==LW)?1:0;
	 assign lb_m=(op_m==LB)?1:0;
	 assign lbu_m=(op_m==LBU)?1:0;
	 assign lh_m=(op_m==LH)?1:0;
	 assign lhu_m=(op_m==LHU)?1:0;
	 
	 assign ld_m=lw_m||lb_m||lbu_m||lh_m||lhu_m;
	 
	 wire stall_b,stall_cal_r,stall_cal_i,stall_ld,stall_st,stall_jr,stall_md,stall_mt;
	 assign stall_b=(b_d&&cal_r_e&&((rs_d==rd_e&&rs_d!=0)||(rt_d==rd_e&&rt_d!=0)))||
	                (b_d&&cal_i_e&&((rs_d==rt_e&&rs_d!=0)||(rt_d==rt_e&&rt_d!=0)))||
						 (b_d&&ld_e&&((rs_d==rt_e&&rs_d!=0)||(rt_d==rt_e&&rt_d!=0)))||
						 (b_d&&ld_m&&((rs_d==rt_m)||(rt_d==rt_m)))||
						 (b2_d&&cal_r_e&&(rs_d==rd_e&&rs_d!=0))||
	                (b2_d&&cal_i_e&&(rs_d==rt_e&&rs_d!=0))||
						 (b2_d&&ld_e   &&(rs_d==rt_e&&rs_d!=0))||
						 (b2_d&&ld_m   &&(rs_d==rt_m&&rs_d!=0));
	 assign stall_jr=((jr_d||jalr_d)&&cal_r_e&&(rs_d==rd_e&&rs_d!=0))||
	                 ((jr_d||jalr_d)&&cal_i_e&&(rs_d==rt_e&&rs_d!=0))||
						  ((jr_d||jalr_d)&&ld_e   &&(rs_d==rt_e&&rs_d!=0))||
						  ((jr_d||jalr_d)&&ld_m   &&(rs_d==rt_m&&rs_d!=0));
	 assign stall_cal_r=cal_r_d&&ld_e&&((rs_d==rt_e)||(rt_d==rt_e)&&rt_e!=0);
	 assign stall_cal_i=cal_i_d&&ld_e&&(rs_d==rt_e)&&rt_e!=0;
	 assign stall_ld=ld_d&&ld_e&&(rs_d==rt_e)&&rt_e!=0;
	 assign stall_st=st_d&&ld_e&&(rs_d==rt_e)&&rt_e!=0;
	 assign stall_md=(busy||start)&&md_d;
	 assign stall_mt=mt_d&&ld_e&&(rs_d==rt_e)&&rs_d!=0;
	 
	 assign stall=stall_b||stall_cal_r||stall_cal_i||stall_ld||stall_st||stall_jr||stall_md||stall_mt;
	 
	 
endmodule
