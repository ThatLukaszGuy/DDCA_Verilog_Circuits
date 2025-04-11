`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2025 08:55:25 AM
// Design Name: 
// Module Name: FSM
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


module FSM(input clk, input rst, input left, input right, output [5:0] lights);

reg[2:0] state, nextState;
wire div_clk = clk; //div(.clk(clk), .rst(rst), .clk_en(div_clk));

parameter S0 = 3'b000;
parameter R1 = 3'b001;
parameter R2 = 3'b010;
parameter R3 = 3'b011;
parameter L1 = 3'b100;
parameter L2 = 3'b101;
parameter L3 = 3'b110;

always @ (posedge div_clk, posedge rst) // State register
 if (rst) state <= S0;
 else state <= nextState;

always @ (*) // Next State Logic
 case (state)
  S0: 
   if (left == 1'b1 && right == 1'b0) nextState = L1;
   else if (right == 1'b1 && left == 1'b0) nextState = R1;
   else nextState = S0;
  R1: nextState = R2;
  R2: nextState = R3;
  R3: nextState = S0;
  //////////////////
  L1: nextState = L2;
  L2: nextState = L3;
  L3: nextState = S0;
  default: nextState = S0;
 endcase
 
Decoder d(.state(state), .lights(lights));
 
endmodule