`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.09.2026 14:50:22
// Design Name: 
// Module Name: mini_soc
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


module mini_soc(
input clk,
input rst,
input [3:0]irq
    );
wire [7:0] cpu_mem_address;
    wire [7:0] cpu_mem_write_data;
    wire cpu_mem_write_enable;
    wire [7:0] cpu_mem_read_data;
wire ram_select,gpio_select,uart_select,irq_select;
wire [7:0] bus_read_data;
wire ram_write_enable;
wire [7:0] ram_read_data;
wire [7:0] gpio_read_data;
wire gpio_write_enable;
wire [7:0] uart_read_data;
wire uart_write_enable;
wire [7:0] irq_read_data;
wire irq_write_enable;
    CPU c1(.clk(clk),.rst(rst),.mem_address(cpu_mem_address),.mem_write_data(cpu_mem_write_data),
        .mem_write_enable(cpu_mem_write_enable),.mem_read_data(cpu_mem_read_data));
    address_decoder a1(.address(cpu_mem_address),.ram_select(ram_select),.gpio_select(gpio_select),.
    uart_select(uart_select),.irq_select(irq_select));
 system_bus s1(
    .bus_address(cpu_mem_address),
    .bus_write_data(cpu_mem_write_data),
    .bus_write_enable(cpu_mem_write_enable),

    .ram_select(ram_select),
    .gpio_select(gpio_select),
    .uart_select(uart_select),
    .irq_select(irq_select),

    .ram_read_data(ram_read_data),
    .gpio_read_data(gpio_read_data),
    .uart_read_data(uart_read_data),
    .irq_read_data(irq_read_data),

    .bus_read_data(bus_read_data),

    .ram_write_enable(ram_write_enable),
    .gpio_write_enable(gpio_write_enable),
    .uart_write_enable(uart_write_enable),
    .irq_write_enable(irq_write_enable)
);
DATA_RAM r1(.clk(clk),.wr_enable(ram_write_enable),.address(cpu_mem_address),.write_data(cpu_mem_write_data),.
rd_data(ram_read_data));
gpio g1(
    .clk(clk),
    .rst(rst),
    .gpio_write_enable(gpio_write_enable),
    .gpio_write_data(cpu_mem_write_data),
    .gpio_read_data(gpio_read_data)
);
UART_wrapper u1(
    .clk(clk),
    .rst(rst),
    .uart_write_enable(uart_write_enable),
    .uart_write_data(cpu_mem_write_data),
    .uart_read_data(uart_read_data)
);
interrupt_controller_wrapper irq1(
    .clk(clk),
    .rst(rst),
    .irq(irq),
    .irq_write_enable(irq_write_enable),
    .irq_write_data(cpu_mem_write_data),
    .irq_read_data(irq_read_data)
);
assign cpu_mem_read_data = bus_read_data;
endmodule
