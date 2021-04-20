`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:02:26 11/27/2019 
// Design Name: 
// Module Name:    MUX 
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
module MUX(
    input [31:0] PC4,
    input [31:0] NPC,
    input [31:0] RFRD1,
    input [1:0] jump,
    input [31:0] RT_E,
    input [31:0] EXT_E,
    input ALUBop,
    input [4:0] Wrd,
    input [4:0] Wrt,
    input [1:0] WAop,
    input [31:0] AO,
    input [31:0] DR,
    input [31:0] PC4_W,
    input [1:0] WDop,
	 input [31:0] ALUout,
	 input [31:0] HI,
	 input [31:0] LO,
	 input [1:0] AOOP,
	 output reg[31:0] AO_E,
    output reg[31:0] PC,
    output reg[31:0] ALUB,
    output reg[4:0] GRFWA,
    output reg[31:0] GRFWD
    );
    always@(*)begin
	   case(jump)
		  0:PC<=PC4;
		  1:PC<=NPC;
		  2:PC<=RFRD1;
		endcase
		
		case(ALUBop)
		  0:ALUB<=RT_E;
		  1:ALUB<=EXT_E;
		endcase
		
		case(WAop)
		  0:GRFWA<=Wrd;
		  1:GRFWA<=Wrt;
		  2:GRFWA<=31;
		  
		endcase
		
		case(WDop)
		  0:GRFWD<=AO;
		  1:GRFWD<=DR;
		  2:GRFWD<=PC4_W+4;
		endcase
	   
		case(AOOP)
		  0:AO_E<=ALUout;
		  1:AO_E<=HI;
		  2:AO_E<=LO;
		endcase
	 end

endmodule
