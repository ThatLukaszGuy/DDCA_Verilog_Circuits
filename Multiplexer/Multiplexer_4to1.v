`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2025 12:25:15 PM
// Design Name: 
// Module Name: Multiplexer_4to1
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


module Multiplexer_4to1(input [3:0] d, input [1:0] s, output x);

wire output_top;
wire output_bottom;

Multiplexer2to1 top (.d0(d[0]), .d1(d[1]), .s(s[0]), .x(output_top));
Multiplexer2to1 bottom (.d0(d[2]), .d1(d[3]), .s(s[0]), .x(output_bottom));

Multiplexer2to1 final (.d0(output_top), .d1(output_bottom), .s(s[1]), .x(x));

// Mapping to ports
// D0 on V17
// D1 on V16
// D2 on W16
// D3 on W17
// S0 on W15
// S1 on V15
// Output on U16

endmodule
