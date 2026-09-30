`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.09.2026 14:30:42
// Design Name: 
// Module Name: address_decoder
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


module address_decoder(
    input [7:0] address,
    output reg ram_select,
    output reg gpio_select,
    output reg uart_select,
    output reg irq_select
);
always @(*) begin
    // defaults
    ram_select  = 1'b0;
    gpio_select = 1'b0;
    uart_select = 1'b0;
    irq_select  = 1'b0;
if (address >= 8'h00 && address <= 8'h7F)
  ram_select=1'b1;
  else if(address==8'h80)
  gpio_select=1'b1;
  else if(address==8'h90)
  uart_select=1'b1;
  else if(address==8'hA0)
  irq_select=1'b1;
 
end
endmodule