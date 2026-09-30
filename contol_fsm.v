`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2026 12:30:26
// Design Name: 
// Module Name: contol_fsm
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


module contol_fsm(
input clk,rst,
input [3:0] opcode,
output reg ir_load,
output reg pc_inc,
output reg write_back
    );
reg [2:0] ps,ns;
parameter IDLE=3'b000,
          FETCH=3'b001,
          DECODE=3'b010,
          EXECUTE=3'b011,
          WRITE=3'b100;
always @(posedge clk) begin
  if(rst)
    ps<=IDLE;
   else
     ps<=ns;
end
always @(*) begin
ir_load=1'b0;
pc_inc=1'b0;
write_back=1'b0;
  case(ps)
   IDLE:ns=FETCH;
   FETCH: begin
   ir_load=1'b1;
   pc_inc=1'b1;
   ns=DECODE;
   end
   DECODE:ns=EXECUTE;
   EXECUTE:ns=WRITE;
   WRITE:begin
   case(opcode)
    4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0101, 4'b0110,4'b0111:
        write_back = 1'b1;

    default:
        write_back = 1'b0;
endcase
   ns=FETCH;
 
   end
   default:ns=IDLE; 
  
  endcase
end

endmodule
