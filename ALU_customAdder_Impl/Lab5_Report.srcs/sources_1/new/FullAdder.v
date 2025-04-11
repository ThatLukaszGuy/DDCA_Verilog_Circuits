`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2025 02:10:49 PM
// Design Name: 
// Module Name: FullAdder
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


module FullAdder(input [31:0] A, input [31:0] B, output [31:0] result);

wire co1;
wire co2;
wire co3;
wire co4;
wire co5;
wire co6;
wire co7;
wire final_carry;


FourBitAdder one   (.a(A[3:0]),   .b(B[3:0]),   .ci(1'b0),    .s(result[3:0]),   .co(co1));
FourBitAdder two   (.a(A[7:4]),   .b(B[7:4]),   .ci(co1),  .s(result[7:4]),   .co(co2));
FourBitAdder three (.a(A[11:8]),  .b(B[11:8]),  .ci(co2),  .s(result[11:8]),  .co(co3));
FourBitAdder four  (.a(A[15:12]), .b(B[15:12]), .ci(co3),  .s(result[15:12]), .co(co4));
FourBitAdder five  (.a(A[19:16]), .b(B[19:16]), .ci(co4),  .s(result[19:16]), .co(co5));
FourBitAdder six   (.a(A[23:20]), .b(B[23:20]), .ci(co5),  .s(result[23:20]), .co(co6));
FourBitAdder seven (.a(A[27:24]), .b(B[27:24]), .ci(co6),  .s(result[27:24]), .co(co7));
FourBitAdder eight (.a(A[31:28]), .b(B[31:28]), .ci(co7),  .s(result[31:28]), .co(final_carry));

endmodule
