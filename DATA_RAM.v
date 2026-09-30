`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2026 14:24:45
// Design Name: 
// Module Name: DATA_RAM
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


module DATA_RAM(
input wr_enable,clk,
input [7:0]address,
input [7:0]write_data,
output reg [7:0]rd_data
    );
    reg [7:0]mem[0:255];
    initial begin
    mem[20] = 8'd55;
end
    always @(posedge clk) begin
       if(wr_enable)
         mem[address]<=write_data;
         
    end
    always @(*) begin
      rd_data<=mem[address];
    
    end
endmodule
