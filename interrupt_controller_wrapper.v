`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.09.2026 21:17:41
// Design Name: 
// Module Name: interrupt_controller_wrapper
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


module interrupt_controller_wrapper(
input clk,rst,
input irq_write_enable,
input [3:0] irq,
    input [7:0] irq_write_data,

    output reg [7:0] irq_read_data
    );
wire interrupt;
    wire [1:0] irq_id;
    wire cpu_ack;
    assign cpu_ack = irq_write_enable && irq_write_data[0];
    four_Source_Priority_Based_Level_Triggered_Interrupt_Controller ic1(
    .clk(clk),
    .rst(rst),
    .irq(irq),
    .cpu_ack(cpu_ack),
    .interrupt(interrupt),
    .irq_id(irq_id)
);

always @(*) begin
    irq_read_data = 8'b0;
    irq_read_data[7] = interrupt;
    irq_read_data[6:5] = irq_id;
end
endmodule
