`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2026 11:29:25
// Design Name: 
// Module Name: register_file
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


module register_file(
input clk,we,
input [7:0]wr_data,
input [1:0]wr_addr,
input [1:0] rd_addr_a,
input [1:0] rd_addr_b,
output reg [7:0] rd_data_a,
output reg [7:0] rd_data_b
    );
    reg [7:0]register[3:0];
    always @(posedge clk) begin
       if(we==1'b1)
         register[wr_addr]<=wr_data;
    end
    always @(*) begin
    rd_data_a<=register[rd_addr_a];
    rd_data_b<=register[rd_addr_b];
    end
endmodule
