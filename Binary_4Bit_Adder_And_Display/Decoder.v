`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2025 08:31:30 AM
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


module Decoder(input [3:0] s, output reg [6:0] d);

always @(*) begin
    case (s)
        4'h0:  d = 7'b1000000; // 0
        4'h1:  d = 7'b1111001; // 1
        4'h2:  d = 7'b0100100; // 2
        4'h3:  d = 7'b0110000; // 3
        4'h4:  d = 7'b0011001; // 4
        4'h5:  d = 7'b0010010; // 5
        4'h6:  d = 7'b0000010; // 6
        4'h7:  d = 7'b1111000; // 7
        4'h8:  d = 7'b0000000; // 8
        4'h9:  d = 7'b0010000; // 9
        4'hA:  d = 7'b0001000; // A
        4'hB:  d = 7'b0000011; // b
        4'hC:  d = 7'b1000110; // C
        4'hD:  d = 7'b0100001; // d
        4'hE:  d = 7'b0000110; // E
        4'hF:  d = 7'b0001110; // F 
        default: d = 7'b1111111;
    endcase
end

endmodule
