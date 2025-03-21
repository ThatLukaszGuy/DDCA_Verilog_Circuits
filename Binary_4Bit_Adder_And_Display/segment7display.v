`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2025 08:55:13 AM
// Design Name: 
// Module Name: segment7display
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


module segment7display(input[3:0] a, input[3:0] b, input [1:0] display_choice, output[6:0] d, output o, output [3:0] AN);

wire[4:0] s;

/*
Exercise 1:

assign AN[0] = 0;
assign AN[1] = 1;
assign AN[2] = 1;
assign AN[3] = 1;
*/

// Decoder outputs array AN with unique display choice (decoded from 2-bit input)
DecodeDisplayChoice ddc (.display_choice(display_choice), .d(AN));

// Adder outputs result of addition
FourBitAdder adder (.a(a), .b(b), .s(s));

// Decoder outputs array d of segments
Decoder decoder (.s(s[3:0]), .d(d));

// Overflow is indicated by LED
assign o = s[4];

endmodule