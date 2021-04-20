`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:10:57 11/26/2019 
// Design Name: 
// Module Name:    mips 
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
module mips(
    input clk,
    input reset
    );
    wire [31:0]IR_F,PC4_F,IR_D,PC4_D,RS_D,RT_D,EXT_D,IR_E,PC4_E,RS_E,RT_E,EXT_E,IR_M,PC4_M,AO_M,RT_M,IR_W,PC4_W,AO_W,DR_W;
	 wire [31:0]ALUout,MRD,NPC;
	 
	 wire GRFwe,Dregen,Eregclr,ifen,stall;
	 wire [1:0]jump,WAop,WDop;
	 wire [3:0]ALUop;
	 wire ALUBop;
	 wire mwrite;
	 wire zero,gzero,lzero;
	 
	 wire [31:0]PC;
	 wire [31:0]ALUB;
	 wire [4:0]GRFWA;
	 wire [31:0]GRFWD;
	 
	 assign Dregen=~stall;
	 assign Eregclr=stall;
	 assign ifen=~stall;
	 
	 wire [1:0]forwardRTM;
	 wire [2:0]forwardRSE,forwardRTE,forwardRSD,forwardRTD;
	 wire [31:0]MFRSD,MFRTD,MFRSE,MFRTE,MFRTM,MFPC;
	 
	 wire [3:0]BE;
    wire [2:0]DEXop;
    wire [31:0]DOUT;	 
	 
	 wire [1:0] MDOP,AOOP,MDWE;
	 wire start,busy;
	 wire [31:0]HI,LO,AO_E;
	 wire [4:0]TIM;
	 
	 IF ifu(.NPC(PC),.clk(clk),.reset(reset),.en(ifen),.IR(IR_F),.PC4(PC4_F));
	 
	 Dreg d(.IR(IR_F),.PC4(PC4_F),.clk(clk),.reset(reset),.en(Dregen),.IR_D(IR_D),.PC4_D(PC4_D));
	 
	 ID id(.IR(IR_D),.PC4(PC4_D),.WA(GRFWA),.WD(GRFWD),.PC4_W(PC4_W),.GRFwe(GRFwe),.clk(clk),.reset(reset),.zero(zero),.gzero(gzero),.lzero(lzero),.RS_D(RS_D),.RT_D(RT_D),.EXTout_D(EXT_D),.NPC(NPC),.jump(jump));
	 CMP cmp(.RS(MFRSD),.RT(MFRTD),.zero(zero),.gzero(gzero),.lzero(lzero));
	 
	 Ereg e(.IR(IR_D),.PC4(PC4_D),.RS(RS_D),.RT(RT_D),.EXT(EXT_D),.clk(clk),.reset(reset),.clr(Eregclr),.IR_E(IR_E),.PC4_E(PC4_E),.RS_E(RS_E),.RT_E(RT_E),.EXT_E(EXT_E));
	 
	 Econtroller ectr(.op(IR_E[31:26]),.fun(IR_E[5:0]),.tim(TIM),.ALUop(ALUop),.ALUBop(ALUBop),.MDOP(MDOP),.busy(busy),.start(start),.AOOP(AOOP),.MDWE(MDWE));
	 ALU alu(.A(MFRSE),.B(ALUB),.s(EXT_E[10:6]),.ALUop(ALUop),.ALUout(ALUout));
	 MULDIV md(.A(MFRSE),.B(ALUB),.MDOP(MDOP),.MDWE(MDWE),.start(start),.clk(clk),.reset(reset),.HI(HI),.LO(LO),.TIM(TIM));
	 
	 Mreg m(.IR(IR_E),.PC4(PC4_E),.AO(AO_E),.RT(MFRTE),.clk(clk),.reset(reset),.IR_M(IR_M),.PC4_M(PC4_M),.AO_M(AO_M),.RT_M(RT_M));
	 
	 Mcontroller mctr(.op(IR_M[31:26]),.fun(IR_M[5:0]),.A(AO_M[1:0]),.mwrite(mwrite),.BE(BE),.DEXop(DEXop));
	 DM dm(.A(AO_M),.WD(MFRTM),.PC4(PC4_M),.BE(BE),.clk(clk),.reset(reset),.mwrite(mwrite),.MRD(MRD));
	 DMEX dmex(.A(AO_M[1:0]),.MRD(MRD),.DEXop(DEXop),.DOUT(DOUT));
	 
	 Wreg w(.IR(IR_M),.PC4(PC4_M),.AO(AO_M),.DR(DOUT),.clk(clk),.reset(reset),.IR_W(IR_W),.PC4_W(PC4_W),.AO_W(AO_W),.DR_W(DR_W));
    Wcontroller wctr(.op(IR_W[31:26]),.fun(IR_W[5:0]),.GRFwe(GRFwe),.WAop(WAop),.WDop(WDop));
	 
	 MUX mux(.PC4(PC4_F),.NPC(NPC),.RFRD1(MFRSD),.jump(jump),.RT_E(MFRTE),.EXT_E(EXT_E),.ALUBop(ALUBop),.Wrd(IR_W[15:11]),.Wrt(IR_W[20:16]),.WAop(WAop),.AO(AO_W),.DR(DR_W),.PC4_W(PC4_W),.WDop(WDop),.ALUout(ALUout),.HI(HI),.LO(LO),.AOOP(AOOP),.AO_E(AO_E),.PC(PC),.ALUB(ALUB),.GRFWA(GRFWA),.GRFWD(GRFWD));
	 PAUSE pause(.IR_D(IR_D),.IR_E(IR_E),.IR_M(IR_M),.busy(busy),.start(start),.stall(stall));
                                                                                                                                                                                                                 
	 forward f(.IR_D(IR_D),.IR_E(IR_E),.IR_M(IR_M),.IR_W(IR_W),.forwardRSD(forwardRSD),.forwardRTD(forwardRTD),.forwardRSE(forwardRSE),.forwardRTE(forwardRTE),.forwardRTM(forwardRTM));
	 
    forwardMUX mux2(.AO_M(AO_M),.MWD(GRFWD),.RFRD1(RS_D),.RFRD2(RT_D),.RS_E(RS_E),.RT_E(RT_E),.RT_M(RT_M),.PC4_E(PC4_E),.PC4_M(PC4_M),.PC4_W(PC4_W),.forwardRSD(forwardRSD),.forwardRTD(forwardRTD),.forwardRSE(forwardRSE),.forwardRTE(forwardRTE),.forwardRTM(forwardRTM),.MFRSD(MFRSD),.MFRTD(MFRTD),.MFRSE(MFRSE),.MFRTE(MFRTE),.MFRTM(MFRTM));
endmodule
