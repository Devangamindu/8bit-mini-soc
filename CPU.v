`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2026 13:29:35
// Design Name: 
// Module Name: CPU
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


module CPU(
input clk,rst,
output  [7:0] mem_address,
output [7:0] mem_write_data,
output reg mem_write_enable,
input [7:0] mem_read_data
    );
    reg [2:0] alu_sel;
wire [7:0] alu_result;
    wire [7:0] reg_data_a;
wire [7:0] reg_data_b;
    wire ir_load;
    wire [7:0]pc;
    wire pc_load;
    wire [7:0]pc_load_value;
    wire [15:0]instruction;
    wire [15:0] instruction_in;
    wire pc_inc;
    wire [3:0] opcode;
wire [1:0] dest_reg;
wire [1:0] src_reg;
wire [7:0] immediate;
reg [7:0] write_data;
wire write_back;
assign opcode    = instruction[15:12];
assign dest_reg  = instruction[11:10];
assign src_reg   = instruction[9:8];
assign immediate = instruction[7:0];
assign pc_load = 1'b0;
assign pc_load_value = 8'b0;
assign mem_address = immediate;
assign mem_write_data = reg_data_a;
contol_fsm f1(.clk(clk),.rst(rst),.ir_load(ir_load),.pc_inc(pc_inc),.write_back(write_back),.opcode(opcode));
instruction_register i1(.clk(clk),.ir_load(ir_load),.rst(rst),.instruction(instruction),.instruction_in(instruction_in));
instruction_memory i11(.address(pc),.instruction(instruction_in)); 
program_counter p1(.clk(clk),.rst(rst),.pc_load(pc_load),.pc_load_value(pc_load_value),.pc(pc),.pc_inc(pc_inc));
register_file r1(.clk(clk),.we(write_back),.wr_data(write_data),.wr_addr(dest_reg),.rd_addr_a(dest_reg),.rd_addr_b(src_reg),.rd_data_a(reg_data_a),
    .rd_data_b(reg_data_b));
alu alu1(.a(reg_data_a),.b(reg_data_b),.alu_sel(alu_sel),.result(alu_result));
always @(*) begin
    case(opcode)
        4'b0010: alu_sel = 3'b000; // ADD
        4'b0011: alu_sel = 3'b001; // SUB
        4'b0100: alu_sel = 3'b010; // AND
        4'b0101: alu_sel = 3'b011; // OR
        4'b0110: alu_sel = 3'b100; // XOR
        default: alu_sel = 3'b000;
    endcase
end
always @(*) begin
    if (opcode == 4'b0001)
        write_data = immediate;
        else if(opcode==4'b0111)
         write_data=mem_read_data;
    else
        write_data = alu_result;
end
always @(*) begin
   if(opcode==4'b1000)
   mem_write_enable=1'b1;
   else
   mem_write_enable=1'b0;
end
endmodule
