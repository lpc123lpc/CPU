`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:30:06 11/26/2019 
// Design Name: 
// Module Name:    GRF 
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
module GRF(
    input [4:0] A1,
    input [4:0] A2,
    input [4:0] WA,
    input [31:0] WD,
    input clk,
    input reset,
	 input we,
	 input [31:0]PC,
    output [31:0] RD1,
    output [31:0] RD2
    );
    reg [31:0] regfile[31:0];
	 integer i;
	 initial begin
	   for(i=0;i<31;i=i+1)
		  regfile[i]=0;
	 end
	 
	 assign RD1=(A1==WA&&we==1&&WA!=0)? WD : regfile[A1];
	 assign RD2=(A2==WA&&we==1&&WA!=0)? WD : regfile[A2];
	 always@(posedge clk)begin
	   if(reset)begin
		  for(i=0;i<31;i=i+1)
		  regfile[i]<=0;
		end
	   else begin
		 if(we)begin
		  if(WA!=0) begin
		  regfile[WA]<=WD;
		  $display("%d@%h: $%d <= %h", $time, PC-4, WA,WD); 
			end
		 end
	   end
	 end

endmodule
