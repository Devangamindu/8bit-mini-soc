`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2026 11:18:52
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu(
input [7:0]a,b,
input [2:0]alu_sel,
output reg [7:0]result
    );
    always @(*) begin
       case(alu_sel)
         3'b000:result=a+b;
         3'b001:result=a-b;
         3'b010:result=a & b;
         3'b011:result= a|b;
         3'b100:result=a^b;
         default:result=8'd0;
       endcase
    end
endmodule
