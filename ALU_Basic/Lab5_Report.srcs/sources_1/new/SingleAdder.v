`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2025 09:06:46 AM
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


module SingleAdder(input a, input b, input ci, output s, output co);

wire not_a;
wire not_b;
wire not_ci;

not(not_a, a);
not(not_b, b);
not(not_ci, ci);

///// AB combinations

wire a_b;
wire not_a_b;
wire a_not_b;
wire not_a_not_b;

and(a_b, a, b);
and(not_a_b, not_a, b);
and(a_not_b, a, not_b);
and(not_a_not_b, not_a, not_b);

////////////

// Computing CO

wire a_not_b_or_b_not_a;
wire ci_and__a_not_b_or_b_not_a;

or(a_not_b_or_b_not_a, a_not_b, not_a_b);
and(ci_and__a_not_b_or_b_not_a, ci, a_not_b_or_b_not_a);

or(co, a_b, ci_and__a_not_b_or_b_not_a);

// Computing S

wire a_b_or_not_a_not_b;
wire ci_and_a_b_or_not_a_not_b;
wire not_ci_and_a_not_b_or_b_not_a;

or(a_b_or_not_a_not_b, a_b, not_a_not_b);
and(ci_and_a_b_or_not_a_not_b, ci, a_b_or_not_a_not_b);
and(not_ci_and_a_not_b_or_b_not_a, not_ci, a_not_b_or_b_not_a);

or(s, ci_and_a_b_or_not_a_not_b, not_ci_and_a_not_b_or_b_not_a);

endmodule
