`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2025 09:29:07 AM
// Design Name: 
// Module Name: FourBitAdder
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


module FourBitAdder(input[3:0] a, input[3:0] b, input ci, output[3:0] s, output co);
wire c_o_1;
wire s_1;

wire c_o_2;
wire s_2;

wire c_o_3;
wire s_3;

// FullAdder(input a, input b, input ci, output s, output co);
SingleAdder firstAdder (a[0], b[0], ci, s[0], c_o_1);
SingleAdder secondAdder (a[1], b[1], c_o_1, s[1], c_o_2);
SingleAdder thirdAdder (a[2], b[2], c_o_2, s[2], c_o_3);
SingleAdder fourthAdder (a[3], b[3], c_o_3, s[3], co);

endmodule
