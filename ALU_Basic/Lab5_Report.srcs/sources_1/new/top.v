`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2025 09:52:49 AM
// Design Name: 
// Module Name: top
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

/*
Conclusion after analyzing area between using own (Lab 2) implementation of Adder and using native verilog add function.
When using the native add function, the design area is larger. 88 LUTs and 101 IOBs are used.
When using the own implementation of a 32-bit adder by using 8 4-bit adders, only 78 LUTs and 101 IOBs are used.
From this, we can conclude that for this design, our own adder is more area-efficient. However, when scaling the program to bigger bitsizes, it might not be the case,
and due to the carry propagation, we might overall have a higher latency in the future.
Currently, the longest path delay with our design is 13.9s, while it's 16.6s when using the native verilog adding function.
So, all in all, for this design and use case, our own implementation is overall more efficient.
*/


module top (input [31:0] A, input [31:0] B, input [3:0] ALUop, output [31:0] result, output zero);

wire [31:0] ALUout;
wire zerowire;

ALU myALU(.A(A), .B(B), .ALUop(ALUop), .result(ALUout), .zero(zerowire));

assign result = ALUout;
assign zero = zerowire;

endmodule
