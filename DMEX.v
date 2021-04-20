`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:33:00 12/16/2019 
// Design Name: 
// Module Name:    DMEX 
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
module DMEX(
    input [1:0] A,
    input [31:0] MRD,
    input [2:0] DEXop,
    output reg[31:0] DOUT
    );
    always@(*)begin
	 case(DEXop)
	 3'b000:DOUT<=MRD;
	 3'b001:begin
	   case(A)
      2'b00:DOUT<={{24{1'b0}},MRD[7:0]};
		2'b01:DOUT<={{24{1'b0}},MRD[15:8]};
		2'b10:DOUT<={{24{1'b0}},MRD[23:16]};
		2'b11:DOUT<={{24{1'b0}},MRD[31:24]};
      endcase		
	 end
	 3'b010:begin
	   case(A)
		2'b00:DOUT<={{24{MRD[7]}},MRD[7:0]};
		2'b01:DOUT<={{24{MRD[15]}},MRD[15:8]};
		2'b10:DOUT<={{24{MRD[23]}},MRD[23:16]};
		2'b11:DOUT<={{24{MRD[31]}},MRD[31:24]};
		endcase
	 end
	 3'b011:begin
	   case(A)
		2'b00,2'b01:DOUT<={{16{1'b0}},MRD[15:0]};
		2'b10,2'b11:DOUT<={{16{1'b0}},MRD[31:16]};
		endcase
	 end
	 3'b100:begin
	   case(A)
		2'b00,2'b01:DOUT<={{16{MRD[15]}},MRD[15:0]};
		2'b10,2'b11:DOUT<={{16{MRD[31]}},MRD[31:16]};
		endcase
	 end
	 endcase
	 end

endmodule
