`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:20:17 11/26/2019 
// Design Name: 
// Module Name:    EXT 
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
module EXT(
    input [15:0] imm,
	 input [1:0] EXTop,
    output reg[31:0] EXT_imm
    );
    
	 always@(*)begin
	   if(EXTop==0)
		  EXT_imm<={16'b0,imm};//0-ext
		else if(EXTop==1)
		  EXT_imm<={{16{imm[15]}},imm};//signed-ext
		else if(EXTop==2)
		  EXT_imm<={imm,16'b0};//lui
	 end

endmodule
