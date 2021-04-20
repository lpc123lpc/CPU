`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:32:14 10/18/2019 
// Design Name: 
// Module Name:    alu 
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
module ALU(
    input [31:0] A,
    input [31:0] B,
	 input [4:0] s,
    input [3:0] ALUop,
    output reg[31:0] ALUout
    );
    always@(*)begin

	 if(ALUop==0)
	    ALUout<=A+B;
	 else if(ALUop==1)
	    ALUout<=A-B;
	 else if(ALUop==2)
	    ALUout<=A|B;
	 else if(ALUop==3)
	    ALUout<=B<<A[4:0];
	 else if(ALUop==4)
	    ALUout<=$signed(B)>>>A[4:0];
	 else if(ALUop==5)
	    ALUout<=B>>A[4:0];
	 else if(ALUop==6)
	    ALUout<=A&B;
	 else if(ALUop==7)
	    ALUout<=A|B;
	 else if(ALUop==8)
	    ALUout<=A^B;
	 else if(ALUop==9)
	    ALUout<=~(A|B);
	 else if(ALUop==10)begin
	    if($signed(A)<$signed(B)) ALUout<=1;
		 else ALUout<=0;
		 end
	 else if(ALUop==11)begin
	    if(A<B) ALUout<=1;
		 else ALUout<=0;
	    end
	 else if(ALUop==12)
	    ALUout<=$signed(B)>>>s;
    else if(ALUop==13)
	    ALUout<=B>>s;
	 else if(ALUop==14)
	    ALUout<=B<<s;
	 end
	 
	 
	 	 

endmodule
