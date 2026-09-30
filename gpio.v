`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.09.2026 15:40:11
// Design Name: 
// Module Name: gpio
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


module gpio(
input clk,rst,
input gpio_write_enable,
input [7:0]gpio_write_data,
output reg [7:0] gpio_read_data
    );
    reg [7:0]gpio_reg;
    always @(posedge clk) begin
      if(rst)
        gpio_reg<=8'h0;
      else if(gpio_write_enable)
        gpio_reg<=gpio_write_data;
    end
    always @(*) begin
      gpio_read_data=gpio_reg;
    
    end
endmodule
