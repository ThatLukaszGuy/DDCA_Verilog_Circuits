`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2025 09:03:21 AM
// Design Name: 
// Module Name: ALU
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


module ALU(input [31:0] A, input [31:0] B, input [3:0] ALUop, output [31:0] result, output zero);

wire invertBchoice;
wire choice;
wire BB;

reg[31:0] logic_result;
reg[31:0] arithmetic_result;
reg[31:0] result;

assign invertBchoice = ALUop[1];
assign choice = ALUop[2];

// B negation multiplexer
assign BB = ALUop[1] ? ~B : B;

// Logic result
always @ (*)
    begin
     case (ALUop[1:0])
      2'b00: logic_result = A & BB; // AND
      2'b01: logic_result = A | BB; // OR
      2'b10: logic_result = A ^ ~BB; // XOR
      2'b11: logic_result =  ~(A | ~BB); // NOR
      default: logic_result = A & BB; // AND
      endcase
    end

// Arithmetic result

wire[31:0] sum;
FullAdder adder(.A(A), .B(B), .result(sum));

always @(*) begin
    case (ALUop[3])
        1'b0: arithmetic_result = sum;
        1'b1: begin
              arithmetic_result = {31'b0, sum[0]};
              end
        default: arithmetic_result = 32'b0;
    endcase
end

// Final result
always @ (*) begin
    case (ALUop[2])
      1'b0: result = arithmetic_result;
      1'b1: result = logic_result;
    endcase
end

assign zero = (result == 32'b0) ? 1 : 0;

endmodule
