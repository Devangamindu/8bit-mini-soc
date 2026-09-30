`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2026 14:01:51
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(
    input [7:0] address,
    output [15:0] instruction
);
    reg [15:0] mem[0:255];

    assign instruction = mem[address];

    initial begin

        // 1. LOAD R0, 55
        mem[0] = 16'b0001_00_00_00110111;

        // 2. STORE R0, RAM address 30
        mem[1] = 16'b1000_00_00_00011110;

        // 3. STORE R0, GPIO address 80
        mem[2] = 16'b1000_00_00_10000000;

        // 4. STORE R0, UART address 90
        mem[3] = 16'b1000_00_00_10010000;

    end
endmodule