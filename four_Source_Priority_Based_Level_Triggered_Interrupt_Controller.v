`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.09.2026 09:21:59
// Design Name: 
// Module Name: four_Source_Priority_Based_Level_Triggered_Interrupt_Controller
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


module four_Source_Priority_Based_Level_Triggered_Interrupt_Controller(
input clk,rst,
input [3:0]irq,
input cpu_ack,
output reg interrupt,
output reg [1:0]irq_id
    );
   reg [3:0]pending;
   reg [3:0]clearmask;
   always @(posedge clk or posedge rst) begin
      if(rst) begin
         pending<=4'b0000;
      end
      else begin
         if(irq==4'b0000 && cpu_ack==0)
            pending<=pending;
            else if(irq != 4'b0000 && cpu_ack==0)
              pending<=pending |irq;
              else if(irq == 4'b0000 && cpu_ack==1)
                pending<=pending & clearmask;
                else if(irq !=4'b0000 && cpu_ack==1)
                 pending <= (pending & clearmask) | irq;
      end
  end
 always @(*) begin
    case(irq_id)
      2'b00:clearmask=4'b1110;
      2'b01:clearmask=4'b1101;
      2'b10:clearmask=4'b1011;
      2'b11:clearmask=4'b0111;
      default:clearmask=4'b1111;
    endcase
 end  
 always @(*) begin
 interrupt=1'b0;
 irq_id=2'b00;
 if (pending[3])begin
    interrupt=1'b1;
    irq_id=2'b11;
    end
else if (pending[2]) begin
    interrupt=1'b1;
    irq_id=2'b10;
    end
else if (pending[1]) begin
   interrupt=1'b1;
    irq_id=2'b01;
    end
else if (pending[0]) begin
interrupt=1'b1;
    irq_id=2'b00;
    end
else begin
    interrupt=1'b0;
 irq_id=2'b00;
 end
 end
endmodule
