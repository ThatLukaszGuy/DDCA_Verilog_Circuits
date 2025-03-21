`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2025 12:25:54 PM
// Design Name: 
// Module Name: Multiplexer2to1
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


module Multiplexer2to1(input d0, input d1, input s, output x);

wire not_s;

not(not_s, s);

wire d0_and_not_s;
wire d1_and_s;

and(d0_and_not_s, d0, not_s);
and(d1_and_s, d1, s);

or(x, d0_and_not_s, d1_and_s);

endmodule
