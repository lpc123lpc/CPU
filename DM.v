`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:19:34 11/26/2019 
// Design Name: 
// Module Name:    DM 
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
module DM(
    input [31:0] A,
    input [31:0] WD,
	 input [31:0] PC4,
	 input [3:0] BE,
	 input clk,
	 input reset,
	 input mwrite,
    output [31:0] MRD
    );
    reg [31:0]file[4095:0];
	 
	 integer i;
	 initial begin
	   for(i=0;i<4096;i=i+1)
		  file[i]=0;
	 end
	 
	 assign MRD=file[A[13:2]];
	 always @(posedge clk)begin
	   if(reset)begin
		for(i=0;i<4096;i=i+1)
		  file[i]<=0;
		end
		else begin
		  if(mwrite)begin
		    case(BE)
			 4'b1111:begin
			   file[A[13:2]]<=WD;
				$display("%d@%h: *%h <= %h", $time, PC4-4, A,WD);
				end
			 4'b0011:begin
			   file[A[13:2]]<={MRD[31:16],WD[15:0]};
				$display("%d@%h: *%h <= %h", $time, PC4-4, {A[31:2],{2'b00}},{MRD[31:16],WD[15:0]});
				end
			 4'b1100:begin
			   file[A[13:2]]<={WD[15:0],MRD[15:0]};
				$display("%d@%h: *%h <= %h", $time, PC4-4, {A[31:2],{2'b00}},{WD[15:0],MRD[15:0]});
				end
			 4'b0001:begin
			   file[A[13:2]]<={MRD[31:8],WD[7:0]};
				$display("%d@%h: *%h <= %h", $time, PC4-4, {A[31:2],{2'b00}},{MRD[31:8],WD[7:0]});
				end
			 4'b0010:begin
			   file[A[13:2]]<={MRD[31:16],WD[7:0],MRD[7:0]};
				$display("%d@%h: *%h <= %h", $time, PC4-4, {A[31:2],{2'b00}},{MRD[31:16],WD[7:0],MRD[7:0]});
				end
			 4'b0100:begin
			   file[A[13:2]]<={MRD[31:24],WD[7:0],MRD[15:0]};
				$display("%d@%h: *%h <= %h", $time, PC4-4, {A[31:2],{2'b00}},{MRD[31:24],WD[7:0],MRD[15:0]});
				end
			 4'b1000:begin
			   file[A[13:2]]<={WD[7:0],MRD[23:0]};
				$display("%d@%h: *%h <= %h", $time, PC4-4, {A[31:2],{2'b00}},{WD[7:0],MRD[23:0]});
				end
			 endcase
			 
			end
		end
	 end

endmodule
