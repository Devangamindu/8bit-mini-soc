`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2026 11:49:31
// Design Name: 
// Module Name: instruction_register
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


module instruction_register(
input clk,rst,ir_load,
input [15:0]instruction_in,
output reg [15:0]instruction
    );
    always @(posedge clk) begin
      if(rst)
        instruction<=16'h0;
        else if(ir_load)
        instruction<=instruction_in;
        else
        instruction<=instruction;
    
    end
endmodule
