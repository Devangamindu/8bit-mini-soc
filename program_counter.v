`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2026 11:42:24
// Design Name: 
// Module Name: program_counter
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


module program_counter(
input clk,rst,pc_load,pc_inc,
input [7:0]pc_load_value,
output reg [7:0]pc
    );
    always @(posedge clk)begin
       if(rst)
       pc<=8'd0;
       else if(pc_load)
        pc<=pc_load_value;
        else if(pc_inc)
        pc<=pc+1;
        else
        pc<=pc;
    
    end
endmodule
