`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:47:45 12/22/2019 
// Design Name: 
// Module Name:    MULDIV 
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
module MULDIV(
    input [31:0] A,
    input [31:0] B,
    input [1:0]MDOP,
	 input [1:0]MDWE,
	 input start,
    input clk,
    input reset,
    output [31:0] HI,
    output [31:0] LO,
	 output [4:0]  TIM
    );
    reg [31:0]hi,lo;
	 reg [4:0]tim;
	 initial begin
	  hi=0;
	  lo=0;
	  tim=0;
	 end
    
	 assign HI=hi;
	 assign LO=lo;
	 assign TIM=tim;
	 
	 always@(posedge clk)begin
	 if(reset)begin
	 hi<=0;
	 lo<=0;
	 tim<=0;
	 end
	 
	 else begin
	 if(start)begin
    case(MDOP)
	 0,2:tim<=5;
	 1,3:tim<=10;
    endcase
	 
	 case(MDOP)
	 0:{hi,lo}<=A*B;
	 1:begin
	   if(B!=0)begin
	   lo<=A/B;
		hi<=A%B;
		end
	 end
	 2:{hi,lo}<=($signed(A))*($signed(B));
	 3:begin
	   if(B!=0)begin
	   lo<=$signed(A)/$signed(B);
	   hi<=$signed(A)%$signed(B);
		end
	 end
	 endcase
    end	 
	 if(tim>0) tim<=tim-1;
	 case(MDWE)
	 1:hi<=A;
	 2:lo<=A;
	 endcase
	 end
	 end
endmodule
