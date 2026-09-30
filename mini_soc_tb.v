`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.09.2026 15:27:44
// Design Name: 
// Module Name: mini_soc_tb
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


module mini_soc_tb;
reg clk,rst;
reg [3:0] irq;

mini_soc uut(
    .clk(clk),
    .rst(rst),
    .irq(irq)
);

initial begin
    repeat(200)
    begin
        clk = 1'b0; #5;
        clk = 1'b1; #5;
    end
end

initial begin
    rst = 1'b1;
    irq = 4'b0000;
    #10;

    rst = 1'b0;

    #300;
    $finish;
end

endmodule