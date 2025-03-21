`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2025 12:06:15 PM
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


module Decoder(input a, input b, output[3:0] s);

wire not_a;
wire not_b;

not(not_a, a);
not(not_b, b);

// AB combinations
and(s[3], a, b);
and(s[2], a, not_b);
and(s[1], not_a, b);
and(s[0], not_a, not_b);

// Mapping from AB combinations to LEDs
// 00 => U16
// 01 => E19
// 10 => U19
// 11 => V19

endmodule
