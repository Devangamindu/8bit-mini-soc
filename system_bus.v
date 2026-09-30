`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.09.2026 14:27:15
// Design Name: 
// Module Name: system_bus
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


module system_bus(
input [7:0]bus_address,
input [7:0]bus_write_data,
input bus_write_enable,
input ram_select,
input gpio_select,
input [7:0] ram_read_data,
input [7:0]gpio_read_data,
input uart_select,
input [7:0] uart_read_data,
input irq_select,
input [7:0]irq_read_data,
output irq_write_enable,
output uart_write_enable,
output reg [7:0] bus_read_data,
output ram_write_enable,
output gpio_write_enable
    );
    always @(*) begin
    bus_read_data = 8'b0;

    if (ram_select)
        bus_read_data = ram_read_data;
      else if(gpio_select)
        bus_read_data=gpio_read_data;
     
         else if(uart_select)
         bus_read_data=uart_read_data;
         else if(irq_select)
         bus_read_data=irq_read_data;
end
assign ram_write_enable=bus_write_enable && ram_select;
assign gpio_write_enable=bus_write_enable && gpio_select;
assign uart_write_enable=bus_write_enable && uart_select;
assign irq_write_enable=bus_write_enable && irq_select;

endmodule
