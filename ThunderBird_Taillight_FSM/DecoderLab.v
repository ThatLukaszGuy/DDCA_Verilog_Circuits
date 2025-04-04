`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2025 09:20:22 AM
// Design Name: 
// Module Name: Decoder
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


module DecoderLab(input [2:0] state, output reg [5:0] lights);

always @ (*) begin
 case(state)
  3'b000: lights = 6'b000000; // no lights
  3'b001: lights = 6'b001000; // RA
  3'b010: lights = 6'b011000; // RA, RB
  3'b011: lights = 6'b111000; // RA, RB, RC
  3'b100: lights = 6'b000001; // LA
  3'b101: lights = 6'b000011; // LA, LB
  3'b110: lights = 6'b000111; // LA, LB, LC
  default: lights = 6'b000000; // default: no lights
 endcase
 end

endmodule
