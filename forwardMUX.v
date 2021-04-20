`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:02:24 11/27/2019 
// Design Name: 
// Module Name:    forwardMUX 
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
module forwardMUX(
    input [31:0] AO_M,
    input [31:0] MWD,
    input [31:0] RFRD1,
    input [31:0] RFRD2,
    input [31:0] RS_E,
    input [31:0] RT_E,
    input [31:0] RT_M,
	 input [31:0] PC4_E,
	 input [31:0] PC4_M,
	 input [31:0] PC4_W,
	 input [2:0] forwardRSD,
    input [2:0] forwardRTD,
    input [2:0] forwardRSE,
    input [2:0] forwardRTE,
    input [1:0] forwardRTM,
    output reg[31:0] MFRSD,
    output reg[31:0] MFRTD,
    output reg[31:0] MFRSE,
    output reg[31:0] MFRTE,
    output reg[31:0] MFRTM
    );
    always@(*)begin
	  case(forwardRSD)
	    0:MFRSD<=RFRD1;
		 1:MFRSD<=AO_M;
		 2:MFRSD<=PC4_M+4;
		 3:MFRSD<=MWD;
		 4:MFRSD<=PC4_W+4;
	  endcase
	  
	  case(forwardRTD)
	    0:MFRTD<=RFRD2;
		 1:MFRTD<=AO_M;
		 2:MFRTD<=PC4_M+4;
		 3:MFRTD<=MWD;
		 4:MFRTD<=PC4_W+4;
	  endcase
	  
	  
	  case(forwardRSE)
	    0:MFRSE<=RS_E;
		 1:MFRSE<=AO_M;
		 2:MFRSE<=PC4_M+4;
		 3:MFRSE<=MWD;
		 4:MFRSE<=PC4_W+4;
	  endcase	  
	  
	  case(forwardRTE)
	    0:MFRTE<=RT_E;
		 1:MFRTE<=AO_M;
		 2:MFRTE<=PC4_M+4;
		 3:MFRTE<=MWD;
		 4:MFRTE<=PC4_W+4;
	  endcase
	  
	  case(forwardRTM)
	    0:MFRTM<=RT_M;
		 1:MFRTM<=MWD;
		 2:MFRTM<=PC4_W+4;
	  endcase
	  
	 end

endmodule
