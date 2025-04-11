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
wire[31:0] BB;

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
      2'b00: logic_result = A & B; // AND
      2'b01: logic_result = A | B; // OR
      2'b10: logic_result = A ^ B; // XOR
      2'b11: logic_result =  ~(A | B); // NOR
      default: logic_result = A & B; // AND
      endcase
    end

// Arithmetic result

wire [31:0] base_sum;
FullAdder adder(.A(A), .B(BB), .result(base_sum));

reg [31:0] modified_sum;
wire [31:0] inc_base;
FullAdder adder2(.A(base_sum), .B(1), .result(inc_base));

always @(*) begin
    case (ALUop[3])
        1'b0: arithmetic_result = (B == BB) ? base_sum : inc_base;
        1'b1: begin
                  modified_sum = inc_base;
                  arithmetic_result = {31'b0, modified_sum[31]};
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

